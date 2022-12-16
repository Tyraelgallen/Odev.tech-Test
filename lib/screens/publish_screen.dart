// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:odev_test/databases/db1.dart';
import 'package:odev_test/databases/mockup_data.dart';
import 'package:odev_test/models/post_model.dart';
import 'package:odev_test/preferences/prefs_user.dart';
import 'package:odev_test/provider/provider_homepage.dart';
import 'package:odev_test/styles/styles.dart';
import 'package:odev_test/widgets/appbar.dart';
import 'package:odev_test/widgets/button_navigator.dart';
import 'package:odev_test/widgets/custom_button.dart';
import 'package:odev_test/widgets/popupmenu.dart';
import 'package:provider/provider.dart';

class PublishScreen extends StatefulWidget {
  const PublishScreen({super.key});

  @override
  State<PublishScreen> createState() => _PublishScreenState();
}

class _PublishScreenState extends State<PublishScreen> {
  bool isReadyToDraw = false;
  String textfield = "";
  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.endOfFrame.then(
      (_) {
        if (mounted) {
          Future.delayed(const Duration(milliseconds: 100)).then((v) {
            setState(() {
              isReadyToDraw = true;
            });
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RefreshHome>(
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            foregroundColor: Colors.black,
            elevation: 0,
            title: UserInfo(
              date: "",
              name: PrefsUser.name,
              usertag: false,
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Styles.searchIcon),
              const Popup(),
              const SizedBox(width: 10),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "New Post",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, "home");
                          },
                          icon: Styles.deleteIcon),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    width: double.infinity,
                    height: 265,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: UserInfo(
                            date: "",
                            name: PrefsUser.name,
                            usertag: true,
                          ),
                        ),
                        const Divider(),
                        Stack(children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextFormField(
                              onChanged: (value) {
                                textfield = value;
                              },
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter your text here..."),
                              maxLines: 7,
                              maxLength: 2500,
                            ),
                          ),
                          Positioned(
                            height: 350,
                            width: 50,
                            child: IconButton(
                                onPressed: () {},
                                color: Colors.grey[500],
                                icon: Styles.emojiIcon),
                          )
                        ]),
                      ],
                    ),
                  ),
                ),
                CustomButton(
                  fontsize: 16,
                  radius: 17,
                  wsize: 0.9,
                  text: "PUBLISH",
                  color: Styles.primaryColor,
                  function: () async {
                    FocusScope.of(context).unfocus();
                    final json = Post(
                        name: PrefsUser.name,
                        date: "Just Now",
                        text: textfield,
                        likes: 0,
                        shares: 0,
                        comments: 0);
                    await MyDatabase.instance.insert(json);
                    Navigator.pushReplacementNamed(context, "home");
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  fontsize: 16,
                  radius: 17,
                  wsize: 0.9,
                  text: "ADD MOCKUP DATA +5",
                  color: Styles.secondaryColor,
                  function: () async {
                    FocusScope.of(context).unfocus();
                    moreData();
                    await Future.delayed(const Duration(seconds: 1)).then(
                        (value) =>
                            Navigator.pushReplacementNamed(context, "home"));
                  },
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: const ButtonNavigator(
            navigate: "home",
          ),
          bottomNavigationBar: isReadyToDraw
              ? BottomAppBar(
                  color: Styles.primaryColor,
                  shape: const CircularNotchedRectangle(),
                  child: const Padding(
                    padding: EdgeInsets.all(30),
                  ),
                )
              : BottomAppBar(
                  color: Styles.primaryColor,
                  child: const Padding(
                    padding: EdgeInsets.all(30),
                  ),
                ),
        );
      },
    );
  }
}
