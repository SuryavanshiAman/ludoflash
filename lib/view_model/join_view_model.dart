import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:ludo_flash/repo/join_contest_repo.dart';
import 'package:ludo_flash/utils/routes_name.dart';
import 'package:ludo_flash/utils/toast.dart';
import 'package:ludo_flash/view/Game/ludo_constant.dart';
import 'package:ludo_flash/view/Game/ludo_player.dart';
import 'package:ludo_flash/view/Game/ludo_provider.dart';
import 'package:ludo_flash/view_model/profile_view_model.dart';
import 'package:ludo_flash/view_model/user_view_model.dart';

import 'firebase_view_model.dart';

class JoinViewModel with ChangeNotifier {
  final _joinRepo = JoinRepository();

  bool _loading = false;
  int documentId = 1;
  bool get loading => _loading;


  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  ProfileViewModel profileViewModel = ProfileViewModel();
  Future<void> joinApi(dynamic tournamentID, dynamic tableId,dynamic prizePool, context)async{
    // final ludoProvider = Provider.of<LudoProvider>(context, listen: false);
    // final firebaseViewModel = Provider.of<FirebaseViewModel>(context, listen: false);
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();
    setLoading(true);
    Map data = {
      "userid": userId,
      "tournament_id": tournamentID,
      "table_id": tableId
    };
    print("tournament_id:$data");
    _joinRepo.joinApi(data).then((value) async {
      if (value['status'] == "200") {
        print("AAgya data");
        setLoading(false);
        if (!context.mounted) return;
        profileViewModel.getProfileApi(context);
        Navigator.pushNamed(context, RoutesName.timerScreen, arguments: prizePool);
        Utils.showSuccessToast(value['message']);
      } else {
        setLoading(false);
        Utils.showErrorToast(value['message']);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('joinApi: $error');
      }
    });
  }
}
