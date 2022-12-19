// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev_test/data/databases/db1.dart';

import 'package:odev_test/data/models/post_model.dart';
import 'package:odev_test/data/preferences/prefs_user.dart';
import 'package:odev_test/logic/cubit/db_crud_cubit.dart';
import 'package:odev_test/logic/cubit/user_change_cubit.dart';
import 'package:odev_test/presentation/screens/home_screen.dart';

import 'package:odev_test/presentation/styles/styles.dart';
import 'package:odev_test/presentation/widgets/appbar.dart';
import 'package:odev_test/presentation/widgets/button_navigator.dart';
import 'package:odev_test/presentation/widgets/custom_button.dart';
import 'package:odev_test/presentation/widgets/popupmenu.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: BlocBuilder<UserChangeCubit, UserChangeState>(
          builder: (context, state) {
            return UserInfo(
              date: PrefsUser.tag,
              name: PrefsUser.name,
            );
          },
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Styles.searchIcon),
          const Popup(),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<UserChangeCubit, UserChangeState>(
          builder: (context, state) {
            return Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      "assets/back3small.jpg",
                      width: double.infinity,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          "assets/${PrefsUser.name}.png",
                          width: 130,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Styles.shareIcon2,
                        const SizedBox(width: 10),
                        Styles.editIcon,
                        const SizedBox(width: 25),
                      ],
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        PrefsUser.name,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.only(top: 30),
                        child: Text(
                          PrefsUser.tag,
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Styles.location,
                      Text(
                        "Washington,DC",
                        style: Styles.profiledescript,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Styles.company,
                      Text(
                        "Company Name",
                        style: Styles.profiledescript,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Styles.cellphone,
                      Text(
                        "5434563728",
                        style: Styles.profiledescript,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/quotes.png",
                      width: 60,
                      color: Styles.primaryColor,
                    ),
                    const SizedBox(
                        width: 250,
                        child: Text(
                          "Working on a Multi-layered client-server neutral-net",
                          textAlign: TextAlign.center,
                        )),
                    const SizedBox(
                      width: 50,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25, right: 15, top: 30, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Lastest Post of ${PrefsUser.name.split(" ")[0]}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: BlocBuilder<DbCrudCubit, DbCrudState>(
                    builder: (context, state) {
                      return FutureBuilder(
                        future: MyDatabase.instance.getAllbyName(),
                        builder: ((context, snapshot) {
                          if (snapshot.hasData) {
                            List<Post> registro = snapshot.data!;
                            return registro.isEmpty
                                ? const Center(
                                    child: Text(
                                      "No hay Posts para mostrar",
                                    ),
                                  )
                                : ListView.separated(
                                    scrollDirection: Axis.vertical,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    primary: false,
                                    shrinkWrap: true,
                                    itemBuilder: ((context, index) {
                                      return ItemPost(
                                        index: index,
                                        registro: registro[index],
                                      );
                                    }),
                                    separatorBuilder: ((context, index) =>
                                        const SizedBox(height: 10)),
                                    itemCount: registro.length);
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        }),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30)
              ],
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
  }
}
