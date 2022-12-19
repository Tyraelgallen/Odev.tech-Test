import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev_test/data/preferences/prefs_user.dart';
import 'package:odev_test/logic/cubit/user_change_cubit.dart';
import 'package:odev_test/presentation/styles/styles.dart';
import 'package:odev_test/presentation/widgets/popupmenu.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Styles.secondaryColor,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      toolbarHeight: 80,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(25.0),
        bottomRight: Radius.circular(25.0),
      )),
      bottom: AppBar(
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Styles.primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25.0),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 5, left: 10),
              child: Text(
                "Latest Posts",
                textAlign: TextAlign.center,
              ),
            ),
            IconButton(
                onPressed: () {
                  scrollController.jumpTo(0);
                },
                icon: Styles.arrowupIcon)
          ],
        ),
      ),
      title: BlocBuilder<UserChangeCubit, UserChangeState>(
        builder: (context, state) {
          return UserInfo(
            name: PrefsUser.name,
            date: PrefsUser.tag,
          );
        },
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Styles.searchIcon),
        const Popup(),
        const SizedBox(width: 10),
      ],
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
    required this.name,
    required this.date,
  }) : super(key: key);

  final String name;
  final String date;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          SizedBox(
            width: size.width * 0.15,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Image.asset(
                "assets/$name.png",
                width: 42,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              Text(
                date,
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
