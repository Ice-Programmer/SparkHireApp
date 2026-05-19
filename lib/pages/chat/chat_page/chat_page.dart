import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:spark_hire_app/components/cache_image.dart';
import 'package:spark_hire_app/components/empty_state.dart';
import 'package:spark_hire_app/model/chat/chat_session_info.dart';
import 'package:spark_hire_app/model/chat/query_chat_message.dart';
import 'package:spark_hire_app/pages/chat/chat_page/view_model/chat_message_view_model.dart';

class ChatPage extends StatefulWidget {
  final ChatSessionInfo session;

  const ChatPage({super.key, required this.session});

  @override
  State<ChatPage> createState() => _ChatPageState();

  static Widget _tag(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: const Color(0xffF2F3F5),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.grey.shade700, fontSize: 11.sp),
      ),
    );
  }

  static Widget _actionBtn(IconData icon, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: const Color(0xffEEEEEE)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20.sp, color: const Color(0xff5B4DFF)),

          8.horizontalSpace,

          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sp),
          ),
        ],
      ),
    );
  }
}

class _ChatPageState extends State<ChatPage> {
  final ChatMessageViewModel _vm = ChatMessageViewModel();
  final ScrollController _scrollController = ScrollController();
  bool _shouldAutoScroll = true;
  bool _didInitialScroll = false;
  int _lastMessageCount = 0;

  @override
  void initState() {
    super.initState();
    _vm.init(widget.session.id);
    _scrollController.addListener(() {
      if (!_scrollController.hasClients) return;
      final max = _scrollController.position.maxScrollExtent;
      final current = _scrollController.offset;
      final distance = (max - current).abs();
      final threshold = 120.h;
      _shouldAutoScroll = distance <= threshold;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.session;

    return ChangeNotifierProvider.value(
      value: _vm,
      child: Consumer<ChatMessageViewModel>(
        builder: (context, vm, child) {
          _scheduleAutoScroll(vm);
          return Scaffold(
            backgroundColor: const Color(0xffF7F8FA),
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      vertical: 14.h,
                    ),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              child:
                                  Icon(Icons.arrow_back_ios_new, size: 22.sp),
                              onTap: () => context.pop(),
                            ),
                            12.horizontalSpace,
                            CacheImage(
                              imageUrl: s.receiverInfo.userAvatar,
                              height: 46.h,
                              width: 46.w,
                              borderRadius: 23.r,
                            ),
                            14.horizontalSpace,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          s.receiverInfo.username,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      10.horizontalSpace,
                                      Text(
                                        s.companyName,
                                        style: TextStyle(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.tertiary.withAlpha(150),
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  5.verticalSpace,
                                  Row(
                                    children: [
                                      Container(
                                        width: 8.w,
                                        height: 8.w,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      6.horizontalSpace,
                                      Text(
                                        "在线",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Icon(Icons.star_border_rounded, size: 28.sp),
                            20.horizontalSpace,
                            Icon(Icons.more_horiz, size: 30.sp),
                          ],
                        ),
                        20.verticalSpace,
                        Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: const Color(0xffFAFAFB),
                            borderRadius: BorderRadius.circular(24.r),
                            border: Border.all(color: const Color(0xffEEEEEE)),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 54.w,
                                height: 54.w,
                                decoration: BoxDecoration(
                                  color: const Color(0xffF1EFFF),
                                  borderRadius: BorderRadius.circular(18.r),
                                ),
                                child: Icon(
                                  Icons.bar_chart_rounded,
                                  color: const Color(0xff5B4DFF),
                                  size: 28.sp,
                                ),
                              ),
                              14.horizontalSpace,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      s.recruitmentName,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.sp,
                                      ),
                                    ),
                                    8.verticalSpace,
                                    Text(
                                      s.companyName,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                    12.verticalSpace,
                                    Wrap(
                                      spacing: 8.w,
                                      runSpacing: 8.h,
                                      children: [
                                        ChatPage._tag("沟通中"),
                                        ChatPage._tag("职位相关"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.chevron_right_rounded,
                                color: Colors.grey,
                                size: 28.sp,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: _buildMessageList(context, vm, s)),
                  _buildInputBar(context),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _scheduleAutoScroll(ChatMessageViewModel vm) {
    if (vm.messages.isEmpty) return;
    if (!_scrollController.hasClients) return;

    final count = vm.messages.length;
    if (!_didInitialScroll) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!_scrollController.hasClients) return;
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      });
      _didInitialScroll = true;
      _lastMessageCount = count;
      return;
    }

    if (count != _lastMessageCount && _shouldAutoScroll) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!_scrollController.hasClients) return;
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      });
    }
    _lastMessageCount = count;
  }

  Widget _buildMessageList(
    BuildContext context,
    ChatMessageViewModel vm,
    ChatSessionInfo session,
  ) {
    if (vm.isLoading && vm.messages.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (vm.messages.isEmpty) {
      return EmptyState(title: "暂无消息");
    }

    return RefreshIndicator(
      onRefresh: () async {
        _didInitialScroll = false;
        await vm.refresh();
      },
      child: ListView.builder(
        controller: _scrollController,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        itemCount: vm.messages.length,
        itemBuilder: (context, index) {
          final msg = vm.messages[index];
          final isLeft = msg.senderInfo.id == session.receiverInfo.id;
          return Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child:
                isLeft
                    ? _LeftMessage(message: msg)
                    : _RightMessage(message: msg),
          );
        },
      ),
    );
  }

  Widget _buildInputBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 26.h),
      color: Colors.white,
      child: Row(
        children: [
          Container(
            width: 52.w,
            height: 52.w,
            decoration: BoxDecoration(
              color: const Color(0xffF5F5F7),
              borderRadius: BorderRadius.circular(26.r),
            ),
            child: Icon(Icons.mic_none_rounded, size: 28.sp),
          ),
          12.horizontalSpace,
          Expanded(
            child: Container(
              height: 52.h,
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              decoration: BoxDecoration(
                color: const Color(0xffF5F5F7),
                borderRadius: BorderRadius.circular(28.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "输入消息...",
                      style: TextStyle(color: Colors.grey, fontSize: 15.sp),
                    ),
                  ),
                  Icon(
                    Icons.sentiment_satisfied_alt_outlined,
                    color: Colors.grey,
                    size: 26.sp,
                  ),
                ],
              ),
            ),
          ),
          12.horizontalSpace,
          Container(
            width: 52.w,
            height: 52.w,
            decoration: BoxDecoration(
              color: const Color(0xffF5F5F7),
              borderRadius: BorderRadius.circular(26.r),
            ),
            child: Icon(Icons.add, size: 28.sp),
          ),
        ],
      ),
    );
  }
}

class _LeftMessage extends StatelessWidget {
  final ChatMessageInfo message;

  const _LeftMessage({required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CacheImage(
          imageUrl: message.senderInfo.userAvatar,
          height: 40.w,
          width: 40.w,
          borderRadius: 20.r,
        ),

        10.horizontalSpace,

        Flexible(
          child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6.r),
                topRight: Radius.circular(24.r),
                bottomLeft: Radius.circular(24.r),
                bottomRight: Radius.circular(24.r),
              ),
            ),
            child: Text(
              message.content,
              style: TextStyle(fontSize: 16.sp, height: 1.6),
            ),
          ),
        ),
      ],
    );
  }
}

class _RightMessage extends StatelessWidget {
  final ChatMessageInfo message;

  const _RightMessage({required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),

        Flexible(
          child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xffF1EEFF), Color(0xffECE9FF)],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.r),
                topRight: Radius.circular(6.r),
                bottomLeft: Radius.circular(24.r),
                bottomRight: Radius.circular(24.r),
              ),
            ),
            child: Text(
              message.content,
              style: TextStyle(fontSize: 16.sp, height: 1.6),
            ),
          ),
        ),

        10.horizontalSpace,

        CacheImage(
          imageUrl: message.senderInfo.userAvatar,
          height: 40.w,
          width: 40.w,
          borderRadius: 20.r,
        ),
      ],
    );
  }
}
