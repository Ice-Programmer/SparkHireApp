import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:spark_hire_app/components/custom_input.dart';
import 'package:spark_hire_app/components/edit_title.dart';
import 'package:spark_hire_app/components/keyboard_wrapper.dart';
import 'package:spark_hire_app/http/business_exception.dart';
import 'package:spark_hire_app/model/tag/add_tag.dart';
import 'package:spark_hire_app/model/tag/query_tag.dart';
import 'package:spark_hire_app/model/tag/tag_info.dart';
import 'package:spark_hire_app/model/tag/bind_tag.dart';
import 'package:spark_hire_app/model/tag/unbind_tag.dart';
import 'package:spark_hire_app/pages/personal/components/edit_save_btn.dart';
import 'package:spark_hire_app/pages/personal/view_model/tag_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:spark_hire_app/providers/user_provider.dart';
import 'package:spark_hire_app/service/tag_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

class TagInfoEditPage extends StatefulWidget {
  final TagViewModel viewModel;
  const TagInfoEditPage({super.key, required this.viewModel});

  @override
  State<TagInfoEditPage> createState() => _TagInfoEditPageState();
}

class _TagInfoEditPageState extends State<TagInfoEditPage> {
  final TagService _tagService = TagService();

  Timer? _debounce;
  String searchText = ""; // 直接使用变量管理
  bool _isLoading = false; // 保存时的 loading
  bool _isSearching = false; // 搜索接口的 loading

  // 存放初始从接口获取的标签，用于后续比对差集
  List<TagInfo> _originalTags = [];
  // 当前界面上选中的标签集合
  List<TagInfo> _currentTags = [];
  // 搜索下拉联想结果
  List<TagInfo> _searchResults = [];

  @override
  void initState() {
    super.initState();
    _loadCurrentTags();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  /// 1. 初始化数据
  void _loadCurrentTags() {
    final tagList = widget.viewModel.tagList;
    setState(() {
      _originalTags = List.from(tagList ?? []);
      _currentTags = List.from(tagList ?? []);
    });
  }

  /// 2. 搜索标签逻辑 (防抖处理)
  void _onSearchChanged(String query) {
    setState(() {
      searchText = query;
    });

    if (_debounce?.isActive ?? false) _debounce!.cancel();

    if (query.trim().isEmpty) {
      setState(() {
        _searchResults.clear();
        _isSearching = false;
      });
      return;
    }

    setState(() => _isSearching = true);

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      try {
        final response = await _tagService.queryTag(
          QueryTagRequest(searchText: query.trim(), pageNum: 1, pageSize: 20),
        );
        if (mounted) {
          setState(() {
            _searchResults = response.tagList ?? [];
            _isSearching = false;
          });
        }
      } catch (e) {
        if (mounted) setState(() => _isSearching = false);
      }
    });
  }

  /// 3. 添加/选中标签逻辑
  void _addTag({TagInfo? existTag, String? manualName}) async {
    if (existTag != null) {
      if (!_currentTags.any((tag) => tag.id == existTag.id)) {
        setState(() {
          _currentTags.add(existTag);
        });
      }
      _resetSearch();
      return;
    }

    final name = manualName?.trim() ?? "";
    if (name.isEmpty) return;

    if (_currentTags.any((tag) => tag.tagName == name)) {
      _resetSearch();
      return;
    }

    setState(() => _isLoading = true);
    try {
      final response = await _tagService.addTag(AddTagRequest(tagName: name));
      final newTagInfo = TagInfo(id: response.id, tagName: name);

      setState(() {
        _currentTags.add(newTagInfo);
      });
      _resetSearch();
    } catch (e) {
      ToastUtils.showErrorMsg('添加标签失败 $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _resetSearch() {
    setState(() {
      searchText = "";
      _searchResults.clear();
    });
  }

  void _removeTag(TagInfo tag) {
    setState(() {
      _currentTags.removeWhere((t) => t.id == tag.id);
    });
  }

  void _onSave() async {
    setState(() => _isLoading = true);

    final originalIds = _originalTags.map((e) => e.id).toSet();
    final currentIds = _currentTags.map((e) => e.id).toSet();

    final toBindIds = currentIds.difference(originalIds).toList();
    final toUnbindIds = originalIds.difference(currentIds).toList();

    try {
      int currentUserId = context.read<UserProvider>().currentUserId;

      if (toBindIds.isNotEmpty) {
        await _tagService.bindTag(
          BindTagRequest(
            objType: TagObjType.candidate,
            tagIdList: toBindIds,
            objId: currentUserId,
          ),
        );
      }

      if (toUnbindIds.isNotEmpty) {
        await _tagService.unbindTag(
          UnbindTagRequest(
            objType: TagObjType.candidate,
            tagIdList: toUnbindIds,
            objId: currentUserId,
          ),
        );
      }

      await widget.viewModel.loadCurrentTagList();

      if (mounted) {
        ToastUtils.showSuccessMsg('保存成功');
        Navigator.pop(context, true);
      }
    } catch (e) {
      ToastUtils.showErrorMsg('保存失败，请检查网络 $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissWrapper(
      child: Scaffold(
        appBar: EditAppBar(
          context: context,
          titleName: AppLocalizations.of(context)!.skillText,
        ),
        bottomNavigationBar: EditSaveBtn(onEdit: _isLoading ? () {} : _onSave),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomInput(
                  height: 50.h,
                  backgroundColor: Theme.of(context).colorScheme.inverseSurface,
                  title: AppLocalizations.of(context)!.skillText,
                  hintText: AppLocalizations.of(context)!.skillsHintText,
                  onChanged: _onSearchChanged,
                ),

                // 优化的搜索结果联想面板
                if (searchText.isNotEmpty) _buildSearchResultsPanel(),

                SizedBox(height: 20.h),

                // 选中的标签流式布局
                Wrap(
                  spacing: 12.w,
                  runSpacing: 12.h,
                  children:
                      _currentTags.map((tag) => _buildTagChip(tag)).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 构建美化后的搜索结果面板
  Widget _buildSearchResultsPanel() {
    // 检查搜索结果中是否已经包含完全一致的名称
    bool alreadyExists = _searchResults.any(
      (t) => t.tagName?.toLowerCase() == searchText.trim().toLowerCase(),
    );

    return Container(
      margin: EdgeInsets.only(top: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 搜索 loading 提示
          if (_isSearching)
            LinearProgressIndicator(
              minHeight: 2,
              color: Theme.of(context).colorScheme.primary,
              backgroundColor: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.1),
            ),

          // 动作项：添加新标签 (仅当搜索词不为空且没在结果里时显示)
          if (!alreadyExists && searchText.trim().isNotEmpty)
            _buildResultItem(
              icon: Icons.add_circle_outline,
              label: 'Add "$searchText"',
              isAction: true,
              onTap: () => _addTag(manualName: searchText),
            ),

          // 搜索出的现有标签列表
          if (_searchResults.isNotEmpty)
            ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _searchResults.length,
              separatorBuilder:
                  (_, __) =>
                      Divider(height: 1, color: Colors.grey.withOpacity(0.1)),
              itemBuilder: (context, index) {
                final tag = _searchResults[index];
                return _buildResultItem(
                  icon: Icons.label_outline,
                  label: tag.tagName ?? "",
                  onTap: () => _addTag(existTag: tag),
                );
              },
            ),

          if (!alreadyExists && _searchResults.isEmpty && !_isSearching)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Text(
                "No tags found",
                style: TextStyle(color: Colors.grey, fontSize: 13.sp),
              ),
            ),
        ],
      ),
    );
  }

  /// 联想项的封装
  Widget _buildResultItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool isAction = false,
  }) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    return ListTile(
      visualDensity: VisualDensity.compact,
      leading: Icon(
        icon,
        size: 20.w,
        color: isAction ? primaryColor : Colors.grey,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: isAction ? FontWeight.w600 : FontWeight.normal,
          color: isAction ? primaryColor : Colors.black87,
        ),
      ),
      onTap: onTap,
    );
  }

  /// 标签 Chip 样式优化
  Widget _buildTagChip(TagInfo tag) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: primaryColor, width: 1.5),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            tag.tagName ?? '',
            style: TextStyle(
              color: primaryColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 6.w),
          GestureDetector(
            onTap: () => _removeTag(tag),
            behavior: HitTestBehavior.opaque,
            child: Icon(Icons.close_rounded, size: 16.w, color: primaryColor),
          ),
        ],
      ),
    );
  }
}
