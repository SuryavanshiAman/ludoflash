import 'package:flutter/foundation.dart';
import 'package:ludo_flash/res/api_url.dart';

import '../helper/network/base_api_services.dart';
import '../helper/network/network_api_services.dart';

class SendChatRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> sendChatApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(ApiUrl.sentChatApi,data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during sendChatApi: $e');
      }
      rethrow;
    }
  }
}