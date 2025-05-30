import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:ludo_flash/generated/assets.dart';
import 'package:ludo_flash/main.dart';
import 'package:ludo_flash/res/app_colors.dart';
import 'package:ludo_flash/res/check_network/network_message.dart';
import 'package:ludo_flash/utils/toast.dart';
import 'package:ludo_flash/view/account/account.dart';
import 'package:ludo_flash/view/refer_earn_page/refer_earn_page.dart';

import 'adda/adda_page.dart';
import 'home/home_page.dart';

class BottomNevBar extends StatefulWidget {
  const BottomNevBar({super.key});

  @override
  State<BottomNevBar> createState() => _BottomNevBarState();
}

class _BottomNevBarState extends State<BottomNevBar> {
  final pages = [
    const HomeScreen(),
    const ReferAndEarnScreen(),
    const AddaScreen(),
    const AccountScreen(),
  ];

  int pageIndex = 0;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final routeArgs = ModalRoute.of(context)?.settings.arguments;
      if (routeArgs != null && routeArgs is Map<String, dynamic>) {
        setState(() {
          pageIndex = (routeArgs['index'] ?? pageIndex);
        });
      }
    });
  }


  Future<bool> _onWillPop() async {
    if (pageIndex > 0) {
      setState(() {
        pageIndex = 0;
      });
      return false;
    } else {
      return await Utils.showExitConfirmation(context) ?? false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (v) {
        _onWillPop();
      },
      child: Scaffold(
        body:  pages[pageIndex] ,
        bottomNavigationBar: buildMyNavBar(context),
      ),
    );
  }

  Widget buildMyNavBar(BuildContext context) {
    return Container(
      height: height * 0.085,
      decoration: const BoxDecoration(
        color: white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                pageIndex = 0;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                pageIndex == 0
                    ? Image.asset(
                        Assets.iconHome,
                        height: 32,
                      )
                    : Image.asset(
                        Assets.iconHomeTwo,
                        height: 30,
                      ),
                pageIndex == 0
                    ? Text(
                        'Home'.tr,
                        style: const TextStyle(
                            fontSize: 11,
                            color: tertiary,
                            fontWeight: FontWeight.bold),
                      )
                    : Text(
                        'Home'.tr,
                        style: const TextStyle(
                            fontSize: 10,
                            color: labelColor,
                            fontWeight: FontWeight.bold),
                      ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                pageIndex = 1;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                pageIndex == 1
                    ? Image.asset(
                        Assets.iconRefer,
                        height: 32,
                      )
                    : Image.asset(
                        Assets.iconReferTwo,
                        height: 30,
                      ),
                pageIndex == 1
                    ? Text(
                        'Refer'.tr,
                        style: const TextStyle(
                            fontSize: 11,
                            color: tertiary,
                            fontWeight: FontWeight.bold),
                      )
                    : Text(
                        'Refer'.tr,
                        style: const TextStyle(
                            fontSize: 10,
                            color: labelColor,
                            fontWeight: FontWeight.bold),
                      ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                pageIndex = 2;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                pageIndex == 2
                    ? Image.asset(
                        Assets.iconAdda,
                        height: 32,
                      )
                    : Image.asset(
                        Assets.iconAddaTwo,
                        height: 30,
                      ),
                pageIndex == 2
                    ? Text(
                        'Adda'.tr,
                        style: const TextStyle(
                            fontSize: 11,
                            color: tertiary,
                            fontWeight: FontWeight.bold),
                      )
                    : Text(
                        'Adda'.tr,
                        style: const TextStyle(
                            fontSize: 10,
                            color: labelColor,
                            fontWeight: FontWeight.bold),
                      ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                pageIndex = 3;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                pageIndex == 3
                    ? Image.asset(
                        Assets.iconAccount,
                        height: 32,
                      )
                    : Image.asset(
                        Assets.iconAccountTwo,
                        height: 30,
                      ),
                pageIndex == 3
                    ? Text(
                        'Account'.tr,
                        style: const TextStyle(
                            fontSize: 11,
                            color: tertiary,
                            fontWeight: FontWeight.bold),
                      )
                    : Text(
                        'Account'.tr,
                        style: const TextStyle(
                            fontSize: 10,
                            color: labelColor,
                            fontWeight: FontWeight.bold),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
