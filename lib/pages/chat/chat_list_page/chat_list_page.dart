import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:spark_hire_app/components/cache_image.dart';
import 'package:spark_hire_app/components/edit_title.dart';
import 'package:spark_hire_app/components/empty_state.dart';
import 'package:spark_hire_app/model/chat/chat_session_info.dart';
import 'package:spark_hire_app/pages/chat/chat_list_page/view_model/chat_session_view_model.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  final ChatSessionViewModel _vm = ChatSessionViewModel();

  @override
  void initState() {
    super.initState();
    _vm.loadChatSession();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _vm,
      child: Consumer<ChatSessionViewModel>(
        builder: (context, vm, child) {
          return Scaffold(
            appBar: EditAppBar(titleName: "消息", centerTitle: true),
            body: _buildBody(context, vm),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, ChatSessionViewModel vm) {
    final sessions = (vm.sessionList ?? const <ChatSessionInfo>[]).toList();
    sessions.sort(
      (a, b) => b.latestMessageCreatedAt.compareTo(a.latestMessageCreatedAt),
    );

    if (vm.isLoading && sessions.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (sessions.isEmpty) {
      return EmptyState(title: "暂无消息");
    }

    final sections = _buildSections(sessions);

    return RefreshIndicator(
      onRefresh: vm.loadChatSession,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
        children: [
          for (final section in sections) ...[
            _SectionHeader(title: section.title),
            6.verticalSpace,
            for (var i = 0; i < section.items.length; i++) ...[
              _ChatSessionTile(item: section.items[i]),
              if (i != section.items.length - 1)
                Divider(
                  height: 20.h,
                  thickness: 0.6,
                  color: const Color(0xffECECEC),
                  indent: 60.w,
                ),
            ],
            18.verticalSpace,
          ],
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h, bottom: 6.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
    );
  }
}

class _ChatSessionTile extends StatelessWidget {
  final ChatSessionInfo item;

  const _ChatSessionTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push('/chat', extra: item),
      borderRadius: BorderRadius.circular(16.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 44.w,
              height: 44.w,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CacheImage(
                    imageUrl: item.receiverInfo.userAvatar,
                    height: 44.w,
                    width: 44.w,
                    borderRadius: 22.r,
                  ),
                  if (item.unreadNum > 0)
                    Positioned(
                      top: -2.h,
                      right: -2.w,
                      child: Container(
                        constraints: BoxConstraints(minWidth: 16.w),
                        height: 16.w,
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        decoration: BoxDecoration(
                          color: const Color(0xffFF3B30),
                          borderRadius: BorderRadius.circular(100.r),
                          border: Border.all(color: Colors.white, width: 2.w),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          item.unreadNum > 99
                              ? "99+"
                              : item.unreadNum.toString(),
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            14.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          item.receiverInfo.username,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ),

                      10.horizontalSpace,

                      Text(
                        _formatTime(item.latestMessageCreatedAt),
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                    ],
                  ),

                  6.verticalSpace,

                  // 最近一条消息
                  Text(
                    item.lastMessage.isEmpty
                        ? item.recruitmentName
                        : item.lastMessage,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Theme.of(
                        context,
                      ).colorScheme.tertiary.withAlpha(200),
                      height: 1.35,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SessionSection {
  final String title;
  final List<ChatSessionInfo> items;

  const _SessionSection({required this.title, required this.items});
}

List<_SessionSection> _buildSections(List<ChatSessionInfo> sessions) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(const Duration(days: 1));

  final Map<String, List<ChatSessionInfo>> grouped = {};

  for (final s in sessions) {
    final dt = _timestampToDateTime(s.latestMessageCreatedAt);
    final date = DateTime(dt.year, dt.month, dt.day);
    final String key;

    if (date == today) {
      key = "今天";
    } else if (date == yesterday) {
      key = "昨天";
    } else {
      key = DateFormat("yyyy-MM-dd").format(date);
    }

    grouped.putIfAbsent(key, () => <ChatSessionInfo>[]).add(s);
  }

  final List<_SessionSection> sections = [];
  if (grouped.containsKey("今天")) {
    sections.add(_SessionSection(title: "今天", items: grouped["今天"]!));
  }
  if (grouped.containsKey("昨天")) {
    sections.add(_SessionSection(title: "昨天", items: grouped["昨天"]!));
  }

  final otherKeys =
      grouped.keys.where((k) => k != "今天" && k != "昨天").toList()
        ..sort((a, b) => b.compareTo(a));

  for (final k in otherKeys) {
    sections.add(_SessionSection(title: k, items: grouped[k]!));
  }

  return sections;
}

DateTime _timestampToDateTime(int timestamp) {
  if (timestamp <= 0) return DateTime.fromMillisecondsSinceEpoch(0);
  final ms = timestamp < 1000000000000 ? timestamp * 1000 : timestamp;
  return DateTime.fromMillisecondsSinceEpoch(ms);
}

String _formatTime(int timestamp) {
  final dt = _timestampToDateTime(timestamp);
  final isAm = dt.hour < 12;
  final hour12 = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
  final time =
      "${hour12.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}";
  return "${isAm ? '上午' : '下午'}$time";
}
