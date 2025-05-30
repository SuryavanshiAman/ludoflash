import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:ludo_flash/model/ContestCategoryModel.dart';
// import 'package:ludo_flash/model/medical_model.dart';

import '../helper/response/api_response.dart';
import '../model/tournament_list_model.dart';
import '../repo/tournament_repo.dart';

class TournamentViewModel with ChangeNotifier {
  final _tournamentRepo =TournamentRepository();

  ApiResponse<TournamentModel> tournamentList = ApiResponse.loading();

  setTournamentList(ApiResponse<TournamentModel> response) {
    tournamentList = response;
    notifyListeners();
  }

  Future<void>tournamentApi(BuildContext context,dynamic data ) async {
    setTournamentList(ApiResponse.loading());
    _tournamentRepo.tournamentApi(data).then((value) {
      if (value.status == "200") {
        setTournamentList(ApiResponse.completed(value));
      } else {
        setTournamentList(ApiResponse.completed(value));
        if (kDebugMode) {
          print('value:');
        }
      }
    }).onError((error, stackTrace) {
      setTournamentList(ApiResponse.error(error.toString()));
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}
