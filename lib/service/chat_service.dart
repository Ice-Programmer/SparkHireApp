import 'package:dio/dio.dart';
import 'package:spark_hire_app/http/business_exception.dart';
import 'package:spark_hire_app/http/dio_instance.dart';
import 'package:spark_hire_app/model/chat/list_current_user_chat_session.dart';
import 'package:spark_hire_app/model/chat/query_chat_message.dart';

class ChatService {
  final DioInstance _dioInstance = DioInstance.instance();

  Future<ListCurrentUserChatSessionResponse> listCurrentUserChatSession(
    ListCurrentUserChatSessionRequest req,
  ) async {
    try {
      final resp = await _dioInstance.post(
        path: '/api/v1/ice/sparkhire/user/chat/list',
        data: req.toJson(),
      );

      final result = ListCurrentUserChatSessionResponse.fromMap(resp.data);

      if (!result.success) {
        throw BusinessException(
          result.baseResp.statusMessage,
          result.baseResp.statusCode,
        );
      }

      return result;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<QueryChatMessageResponse> queryChatMessage(
    QueryChatMessageRequest req,
  ) async {
    try {
      final resp = await _dioInstance.post(
        path: '/api/v1/ice/sparkhire/user/chat/message/query',
        data: req.toJson(),
      );

      final result = QueryChatMessageResponse.fromMap(resp.data);

      if (!result.success) {
        throw BusinessException(
          result.baseResp.statusMessage,
          result.baseResp.statusCode,
        );
      }

      return result;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
