import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ludo_flash/model/ContestCategoryModel.dart';
import 'package:ludo_flash/repo/contest_category_repo.dart';

import '../helper/response/api_response.dart';

class ContestCategoryViewModel with ChangeNotifier {
  final _contestCategoryRepo =ContestCategoryRepository();

  ApiResponse<ContestCategoriesModel> contestCategoriesList = ApiResponse.loading();

  setContestCategoriesList(ApiResponse<ContestCategoriesModel> response) {
    contestCategoriesList = response;
    notifyListeners();
  }

  Future<void>contestCategoryApi(BuildContext context ) async {

    setContestCategoriesList(ApiResponse.loading());
    _contestCategoryRepo.contestCategoryApi().then((value) {
      if (value.status == "200") {
        setContestCategoriesList(ApiResponse.completed(value));
      } else {
        if (kDebugMode) {
          print('value:');
        }
      }
    }).onError((error, stackTrace) {
      setContestCategoriesList(ApiResponse.error(error.toString()));
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}
