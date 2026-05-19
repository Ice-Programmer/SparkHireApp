import 'package:flutter/material.dart';
import 'package:spark_hire_app/model/chat/chat_session_info.dart';
import 'package:spark_hire_app/model/chat/list_current_user_chat_session.dart';
import 'package:spark_hire_app/service/chat_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

class ChatSessionViewModel extends ChangeNotifier {
  final ChatService _service = ChatService();

  List<ChatSessionInfo>? _sessionList;
  List<ChatSessionInfo>? get sessionList => _sessionList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadChatSession() async {
    _isLoading = true;
    notifyListeners();

    try {
      final req = ListCurrentUserChatSessionRequest();
      final response = await _service.listCurrentUserChatSession(req);
      _sessionList = response.sessionList;
    } catch (e) {
      ToastUtils.showErrorMsg("获取对话记录失败：$e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
