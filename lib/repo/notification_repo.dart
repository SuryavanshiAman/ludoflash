import 'package:flutter/foundation.dart';
import 'package:ludo_flash/model/chat_model.dart';
import 'package:ludo_flash/model/notification_model.dart';
import 'package:ludo_flash/res/api_url.dart';

import '../helper/network/base_api_services.dart';
import '../helper/network/network_api_services.dart';

class NotificationRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<NotificationModel> notificationApi(dynamic userID,dynamic status) async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse("${ApiUrl.notificationApi}$userID/$status");
      return NotificationModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during notificationApi: $e');
      }
      rethrow;
    }
  }
}