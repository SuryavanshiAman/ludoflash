import 'package:flutter/material.dart';
import 'package:ludo_flash/res/text_widget.dart';
import 'package:ludo_flash/utils/routes_name.dart';
import 'package:ludo_flash/view/Game/ludo_game_home_page.dart';
import 'package:ludo_flash/view/account/about/html_viewer_page.dart';
import 'package:ludo_flash/view/account/bank_Details_page.dart';
import 'package:ludo_flash/view/account/help_suppoort/chat_screen.dart';
import 'package:ludo_flash/view/account/kyc/kyc.dart';
import 'package:ludo_flash/view/account/kyc/pan_card_page.dart';
import 'package:ludo_flash/view/account/responsible_gaming/responsible_gaming.dart';
import 'package:ludo_flash/view/auth/login_page.dart';
import 'package:ludo_flash/view/auth/otp_page.dart';
import 'package:ludo_flash/view/auth/register_page.dart';
import 'package:ludo_flash/view/auth/splash_page.dart';
import 'package:ludo_flash/view/bottom_nav_bar.dart';
import 'package:ludo_flash/view/home/notification_page.dart';
import 'package:ludo_flash/view/home/tournament_page.dart';
import 'package:ludo_flash/view/profile/avtar_screen.dart';
import 'package:ludo_flash/view/profile/edit_profile_page.dart';
import 'package:ludo_flash/view/refer_earn_page/my_referrals_tab_page.dart';
import 'package:ludo_flash/view/refer_earn_page/refer_earn_page.dart';
import 'package:ludo_flash/view/wallet/bonus_details_page.dart';
import 'package:ludo_flash/view/wallet/cashback_details.dart';
import 'package:ludo_flash/view/wallet/deposit.dart';
import 'package:ludo_flash/view/wallet/transaction.dart';
import 'package:ludo_flash/view/wallet/wallet_page.dart';
import 'package:ludo_flash/view/wallet/withdraw_page.dart';

import '../view/Game/timer_page.dart';
import '../view/Game/winner_screen.dart';
import '../view/account/about/about_page.dart';
import '../view/account/help_suppoort/help_page.dart';
import '../view/account/kyc/aadhar_card_details_page.dart';
import '../view/account/responsible_gaming/loss_mamangement_page.dart';
import '../view/adda/leaderboard_page.dart';
import '../view/adda/players_profile_page.dart';
import '../view/profile/my_game_history.dart';
import '../view/profile/profile_page.dart';

class Routers {
  static WidgetBuilder generateRoute(String routeName) {
    switch (routeName) {
      case RoutesName.splashScreen:
        return (context) => const SplashScreen();
      case RoutesName.registerScreen:
        return (context) => const RegisterScreen();
    case RoutesName.loginScreen:
      return (context) => const LoginScreen();
      case RoutesName.bottomNevBar:
        return (context) => const BottomNevBar();
      case RoutesName.ludoSupreme:
        return (context) =>  const LudoSupreme();
      case RoutesName.verifyPage:
        return (context) =>  const VerifyPage();
      case RoutesName.walletScreen:
        return (context) =>  const WalletScreen();
      case RoutesName.depositScreen:
        return (context) =>  const DepositScreen();
      case RoutesName.withdrawScreen:
        return (context) =>  const WithdrawScreen();
      case RoutesName.cashbackDetailsScreen:
        return (context) =>  const CashbackDetailsScreen();
      case RoutesName.bonusDetailsScreen:
        return (context) =>  const BonusDetailsScreen();
      case RoutesName.transactionScreen:
        return (context) =>  const TransactionScreen();
      case RoutesName.referAndEarnScreen:
        return (context) =>  const ReferAndEarnScreen();
      case RoutesName.myReferralsTabScreen:
        return (context) =>  const MyReferralsTabScreen();
      case RoutesName.profileScreen:
        return (context) =>  const ProfileScreen();
      case RoutesName.editProfileScreen:
        return (context) =>  const EditProfileScreen();
      case RoutesName.kycCScreen:
        return (context) =>  const KYCScreen();
      case RoutesName.panCardScreen:
        return (context) =>  const PanCardScreen();
      case RoutesName.gameHistoryScreen:
        return (context) =>  const GameHistoryScreen();
      case RoutesName.aadharCard:
        return (context) =>  const AadharCard();
      case RoutesName.helpAndSupportScreen:
        return (context) =>  const HelpAndSupportScreen();
      case RoutesName.about:
        return (context) =>  const About();
      case RoutesName.responsibleGamingScreen:
        return (context) =>   const ResponsibleGamingScreen ();
      case RoutesName.lossManagementScreen:
        return (context) =>   const LossManagementScreen();
      case RoutesName.timerScreen:
        return (context) =>   const TimerScreen();
      case RoutesName.ludoHomeScreen:
        return (context) =>   const LudoHomeScreen();
      case RoutesName.leaderboardScreen:
        return (context) =>   const LeaderboardScreen();
      case RoutesName.userProfileScreen:
        return (context) =>   const UserProfileScreen();
      case RoutesName.htmlViewerScreen:
        return (context) =>   const HtmlViewerScreen();
      case RoutesName.bankDetailsScreen:
        return (context) =>   const BankDetailsScreen();
      case RoutesName.winnerScreen:
        return (context) =>   const WinnerScreen();
      case RoutesName.avatarSelectionScreen:
        return (context) =>   const AvatarSelectionScreen();
      case RoutesName.chatPage:
        return (context) =>   const ChatPage();
      case RoutesName.notificationScreen:
        return (context) =>   const NotificationScreen();
      default:
        return (context) => Scaffold(
              body: Center(
                child: textWidget(
                    text: 'No Route Found!',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            );
    }
  }
}