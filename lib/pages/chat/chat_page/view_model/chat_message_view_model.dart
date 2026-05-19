import 'package:flutter/material.dart';
import 'package:spark_hire_app/model/chat/query_chat_message.dart';
import 'package:spark_hire_app/service/chat_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

class ChatMessageViewModel extends ChangeNotifier {
  final ChatService _service = ChatService();

  List<ChatMessageInfo> _messages = [];
  List<ChatMessageInfo> get messages => _messages;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _hasMore = true;
  bool get hasMore => _hasMore;

  int _pageNum = 1;
  final int _pageSize = 30;

  int _sessionId = 0;

  Future<void> init(int sessionId) async {
    _sessionId = sessionId;
    await refresh();
  }

  Future<void> refresh() async {
    if (_sessionId <= 0) return;

    _isLoading = true;
    notifyListeners();

    try {
      _pageNum = 1;
      final req = QueryChatMessageRequest(
        pageSize: _pageSize,
        pageNum: _pageNum,
        sessionId: _sessionId,
      );
      final resp = await _service.queryChatMessage(req);
      final list = resp.messageList ?? const <ChatMessageInfo>[];
      _messages = list.toList()..sort((a, b) => a.createdAt.compareTo(b.createdAt));
      final total = resp.total ?? _messages.length;
      _hasMore = _messages.length < total;
    } catch (e) {
      ToastUtils.showErrorMsg("获取消息失败：$e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadMore() async {
    if (_sessionId <= 0) return;
    if (_isLoading) return;
    if (!_hasMore) return;

    _isLoading = true;
    notifyListeners();

    try {
      _pageNum += 1;
      final req = QueryChatMessageRequest(
        pageSize: _pageSize,
        pageNum: _pageNum,
        sessionId: _sessionId,
      );
      final resp = await _service.queryChatMessage(req);
      final list = resp.messageList ?? const <ChatMessageInfo>[];
      final merged = [..._messages, ...list];
      merged.sort((a, b) => a.createdAt.compareTo(b.createdAt));
      _messages = merged;
      final total = resp.total ?? _messages.length;
      _hasMore = _messages.length < total;
    } catch (e) {
      ToastUtils.showErrorMsg("加载更多消息失败：$e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

