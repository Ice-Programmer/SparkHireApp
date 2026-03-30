import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:spark_hire_app/components/comment_card.dart';
import 'package:spark_hire_app/components/custom_divider.dart';
import 'package:spark_hire_app/components/empty_state.dart';
import 'package:spark_hire_app/pages/company/company_detail_page/view_model/company_comment_view_model.dart'; // 确保路径正确

class CompanyCommentsContent extends StatefulWidget {
  final int companyId;
  const CompanyCommentsContent({super.key, required this.companyId});

  @override
  State<CompanyCommentsContent> createState() => _CompanyCommentsContentState();
}

class _CompanyCommentsContentState extends State<CompanyCommentsContent> {
  final CompanyCommentViewModel _commentVM = CompanyCommentViewModel();

  @override
  void initState() {
    super.initState();
    // 初始化加载
    _commentVM.refreshComments(widget.companyId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _commentVM,
      child: Consumer<CompanyCommentViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading && vm.comments.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (vm.comments.isEmpty && !vm.isLoading) {
            return EmptyState(title: "暂无评论，快发表你的看法吧");
          }

          return Column(
            children: [
              // 评论列表
              ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: vm.comments.length + (vm.hasMore ? 1 : 0),
                separatorBuilder:
                    (context, index) =>
                        CustomDivider(height: 32.h, thickness: 0.3),
                itemBuilder: (context, index) {
                  if (index == vm.comments.length) {
                    // 滚动到底部触发加载更多
                    vm.loadMore(widget.companyId);
                    return Center(
                      child: SizedBox(
                        width: 24.w,
                        height: 24.h,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    );
                  }
                  return CommentCard(comment: vm.comments[index]);
                },
              ),

              // 是否有更多
              if (!vm.hasMore && vm.comments.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: CustomDivider(
                    text: "没有更多评论了",
                    thickness: 0.8,
                    horizontalGap: 20.w,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
