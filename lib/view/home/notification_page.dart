import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ludo_flash/helper/response/status.dart';
import 'package:ludo_flash/main.dart';
import 'package:ludo_flash/res/app_colors.dart';
import 'package:ludo_flash/view_model/notification_view_model.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    Provider.of<NotificationViewModel>(context, listen: false)
        .notificationApi(context,"3");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        leadingWidth: 200,
        leading: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.keyboard_arrow_left_rounded,
                color: black,
                size: 30,
              ),
            ),
            Text(
              "Notification".tr,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      body: Consumer<NotificationViewModel>(
        builder: (context, notification, _) {
          switch (notification.notificationList.status) {
            case Status.LOADING:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case Status.ERROR:
              return Container();
            case Status.COMPLETED:
              final data = notification.notificationList.data!.data;
              if (data != null && data.isNotEmpty) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 3,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: gray, //New
                                  blurRadius: 5.0,
                                  spreadRadius: 1)
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                leading: const CircleAvatar(
                                  child: Icon(
                                    Icons.notifications_none,
                                    color: tertiary,
                                    size: 30,
                                  ),
                                ),
                                title: Text(data[index].type??"",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: black.withOpacity(0.7),
                                        fontWeight: FontWeight.w600
                                        // fontWeight: FontWeight.bold
                                        )),
                                subtitle:  Text(data[index].message??"",
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: labelColor,
                                        fontWeight: FontWeight.w500
                                        // fontWeight: FontWeight.bold
                                        )),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: width * 0.2),
                                child:  Text(
                                  DateFormat("d MMM, hh:mm a").format(DateTime.parse(data[index].createdAt.toString())),
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: labelColor,
                                        fontWeight: FontWeight.w500
                                        // fontWeight: FontWeight.bold
                                        )),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }
              else {
                return const Center(
                  child: Text(
                    "No Notification Found!",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                );
              }
            default:
              return const Center(
                child: Text(
                  "No Notification Found!",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              );
          }
        },
      ),
    );
  }
}
