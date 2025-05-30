//
// import 'dart:math';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:ludo_flash/view/Game/ludo_constant.dart';
// import 'package:ludo_flash/view/Game/ludo_player.dart';
//
// class LudoProvider extends ChangeNotifier {
//   bool _isMoving = false;
//   bool _stopMoving = false;
//   bool _isPlayer1Turn = true;
//   bool get isPlayer1Turn => _isPlayer1Turn;
//   LudoGameState _gameState = LudoGameState.throwDice;
//   LudoGameState get gameState => _gameState;
//   LudoPlayerType _currentTurn = LudoPlayerType.yellow;
//   LudoPlayer get currentPlayer => player(_currentTurn);
//   int _diceResult = 0;
//   int? _previousDiceResult;
//   int _totalPoints = 0;
//   int get totalPoints => _totalPoints;
//   bool _loading = false;
//   bool get loading => _loading;
//   final DocumentReference<Map<String, dynamic>> gameDoc =
//   FirebaseFirestore.instance.collection('ludo').doc('1');
//
//   LudoProvider() {
//     // Listen to changes in Firestore and update the state
//     gameDoc.snapshots().listen((snapshot) {
//       if (snapshot.exists) {
//         _diceResult = snapshot.data()?['diceResult'] ?? 1;
//         notifyListeners();
//       }
//     });
//   }
//   setLoading(bool value) {
//     _loading = value;
//     notifyListeners();
//   }
//   int get diceResult {
//     if (_diceResult < 1) {
//       return 1;
//     } else {
//       if (_diceResult > 6) {
//         return 6;
//       } else {
//         return _diceResult;
//       }
//     }
//   }
//   int? get previousDiceResult => _previousDiceResult;
//   bool _diceStarted = false;
//   bool get diceStarted => _diceStarted;
// setDiceStarted(bool value){
//   _diceStarted=value;
//   notifyListeners();
// }
//   void switchPlayerTurn() {
//     _isPlayer1Turn = !_isPlayer1Turn;
//     notifyListeners();
//   }
//   final List<LudoPlayer> players = [
//     LudoPlayer(LudoPlayerType.blue),
//     LudoPlayer(LudoPlayerType.red),
//     LudoPlayer(LudoPlayerType.green),
//     LudoPlayer(LudoPlayerType.yellow),
//   ];
//   final List<LudoPlayerType> winners = [];
//   LudoPlayer player(LudoPlayerType type) => players.firstWhere((element) => element.type == type);
//   void throwDice() async {
//     // if (_gameState != LudoGameState.throwDice) return;
//     _diceStarted = true;
//     notifyListeners();
//     // Audio.rollDice();
//     LudoPlayer currentPlayer = player(_currentTurn);
//     if (winners.contains(currentPlayer.type)) {
//       await Future.delayed(const Duration(seconds: 1),(){
//         nextTurn();
//       });
//       return;
//     }
//     currentPlayer.highlightAllPawns(false);
//     await Future.delayed(const Duration(seconds: 1));
//     _diceStarted = false;
//     _previousDiceResult = _diceResult;
//     var random = Random();
//     _diceResult = random.nextBool() ? 5  : random.nextInt(6) + 1; //Random between 1 - 6
//     notifyListeners();
//     // Move this line here to avoid adding _diceResult twice
//     _totalPoints += (_previousDiceResult ?? 0);
//     if (diceResult==6) {
//       currentPlayer.highlightAllPawns();
//       _gameState = LudoGameState.pickPawn;
//       notifyListeners();
//       _totalPoints += _diceResult; // Add only when diceResult is 6
//     } else {
//       if (currentPlayer.pawnInsideCount != 4) {
//         currentPlayer.highlightOutside();
//         _gameState = LudoGameState.pickPawn;
//         await Future.delayed(const Duration(seconds: 1),(){
//           nextTurn();
//         });
//       } else {
//         currentPlayer.highlightOutside();
//         _gameState = LudoGameState.pickPawn;
//         notifyListeners();
//       }
//     }
//     for (var i = 0; i < currentPlayer.pawns.length; i++) {
//       var pawn = currentPlayer.pawns[i];
//       if ((pawn.step + diceResult) > currentPlayer.path.length - 1) {
//         currentPlayer.highlightPawn(i, false);
//       }
//     }
//     var moveablePawn = currentPlayer.pawns.where((e) => e.highlight).toList();
//     if (moveablePawn.length > 1) {
//       var biggestStep = moveablePawn.map((e) => e.step).reduce(max);
//       if (moveablePawn.every((element) => element.step == biggestStep)) {
//         var random = 1 + Random().nextInt(moveablePawn.length - 1);
//         if (moveablePawn[random].step == -1) {
//           var thePawn = moveablePawn[random];
//           move(thePawn.type, thePawn.index, (thePawn.step + 1) + 1);
//           return;
//         } else {
//           var thePawn = moveablePawn[random];
//           move(thePawn.type, thePawn.index, (thePawn.step + 1) + diceResult);
//           return;
//         }
//       }
//     }
//     if (currentPlayer.pawns.every((element) => !element.highlight)) {
//       if (loading==true) {
//         _gameState = LudoGameState.throwDice;
//       } else {
//         await Future.delayed(const Duration(seconds: 1),(){
//           nextTurn();
//         });
//         return;
//       }
//     }
//     if (currentPlayer.pawns.where((element) => element.highlight).length == 1) {
//       var index = currentPlayer.pawns.indexWhere((element) => element.highlight);
//       move(currentPlayer.type, index, (currentPlayer.pawns[index].step + 1) + diceResult);
//     }
//   }
//
//
//
//   void move(LudoPlayerType type, int index, int step) async {
//     if (_isMoving) return;
//     _isMoving = true;
//     _gameState = LudoGameState.moving;
//     LudoPlayer currentPlayer = player(type);
//     currentPlayer.highlightAllPawns(false);
//     int currentStep = currentPlayer.pawns[index].step;
//
//     // for (int i = currentStep + 1; i <= step; i++) {
//     //   if (_stopMoving) break;
//     //
//     //   currentPlayer.movePawn(index, i); // Move pawn step-by-step
//     //   notifyListeners();
//     //
//     //   await Future.delayed(const Duration(milliseconds: 300)); // Adjust the delay for desired animation speed
//     //
//     //   if (_stopMoving) break;
//     // }
//     for (int i = currentPlayer.pawns[index].step; i < step; i++) {
//       if (_stopMoving) break;
//       if (currentPlayer.pawns[index].step == i) continue;
//       currentPlayer.movePawn(index, i);
//       await Future.delayed(const Duration(milliseconds:300));
//       // await Audio.playMove();
//       notifyListeners();
//       if (_stopMoving) break;
//     }
//     if (checkToKill(type, index, step, currentPlayer.path)) {
//       _gameState = LudoGameState.throwDice;
//       _isMoving = false;
//       // Audio.playKill();
//       notifyListeners();
//       return;
//     }
//     validateWin(type);
//     if (loading==true) {
//       _gameState = LudoGameState.throwDice;
//       notifyListeners();
//     } else {
//       Future.delayed(const Duration(seconds: 2),(){
//         nextTurn();
//       });
//       notifyListeners();
//     }
//     _isMoving = false;
//   }
//   bool checkToKill(LudoPlayerType type, int index, int step, List<List<double>> path) {
//     bool killSomeone = false;
//     for (int i = 0; i < 4; i++) {
//       var redElement = player(LudoPlayerType.red).pawns[i];
//       var yellowElement = player(LudoPlayerType.yellow).pawns[i];
//       if ((yellowElement.step > -1 && !LudoPath.safeArea.map((e) => e.toString()).contains(player(LudoPlayerType.yellow).path[yellowElement.step].toString())) && type != LudoPlayerType.yellow) {
//         if (player(LudoPlayerType.yellow).path[yellowElement.step].toString() == path[step - 1].toString()) {
//           killSomeone = true;
//           player(LudoPlayerType.yellow).movePawn(i, -1);
//           notifyListeners();
//         }
//       }
//       if ((redElement.step > -1 && !LudoPath.safeArea.map((e) => e.toString()).contains(player(LudoPlayerType.red).path[redElement.step].toString())) && type != LudoPlayerType.red) {
//         if (player(LudoPlayerType.red).path[redElement.step].toString() == path[step - 1].toString()) {
//           killSomeone = true;
//           player(LudoPlayerType.red).movePawn(i, -1);
//           notifyListeners();
//         }
//       }
//     }
//     return killSomeone;
//   }
//   void validateWin(LudoPlayerType color) {
//     if (winners.map((e) => e.name).contains(color.name)) return;
//     if (player(color).pawns.map((e) => e.step).every((element) => element == player(color).path.length - 1)) {
//       winners.add(color);
//       notifyListeners();
//     }
//     if (winners.length == 3) {
//       _gameState = LudoGameState.finish;
//     }
//   }
//   void nextTurn() {
//     switch (_currentTurn) {
//       case LudoPlayerType.blue:
//         _currentTurn = LudoPlayerType.green;
//         break;
//       case LudoPlayerType.yellow:
//         _currentTurn = LudoPlayerType.red;
//         break;
//       case LudoPlayerType.green:
//         _currentTurn = LudoPlayerType.blue;
//         break;
//       case LudoPlayerType.red:
//         _currentTurn = LudoPlayerType.yellow;
//         break;
//     }
//     if (winners.contains(_currentTurn)) return nextTurn();
//     _gameState = LudoGameState.throwDice;
//     notifyListeners();
//   }
//   @override
//   void dispose() {
//     _stopMoving = true;
//     super.dispose();
//   }
// }