import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:odev_test/logic/cubit/user_change_cubit.dart';

import 'package:odev_test/presentation/styles/styles.dart';

class Popup extends StatelessWidget {
  const Popup({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return PopupMenuButton<int>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      icon: Styles.barsIcon,
      itemBuilder: (context) => [
        // popupmenu item 1
        PopupMenuItem(
          value: 1,
          onTap: () {
            // PrefsUser.name = "Jane Doe";
            // PrefsUser.tag = "@janedoe_29";

            // refreshhome.updateWidget();
            BlocProvider.of<UserChangeCubit>(context).toJane();
          },
          child: Row(
            children: [
              SizedBox(
                width: size.width * 0.15,
                child: CircleAvatar(
                  child: Image.asset("assets/Jane Doe.png"),
                ),
              ),
              const SizedBox(width: 10),
              const Text("Jane Doe")
            ],
          ),
        ),
        // popupmenu item 2
        PopupMenuItem(
          value: 2,
          onTap: () {
            // PrefsUser.name = "John Doe";
            // PrefsUser.tag = "@johndoe_27";
            // refreshhome.updateWidget();
            BlocProvider.of<UserChangeCubit>(context).toJohn();
          },
          child: Row(
            children: [
              SizedBox(
                width: size.width * 0.15,
                child: CircleAvatar(
                  child: Image.asset("assets/John Doe.png"),
                ),
              ),
              const SizedBox(width: 10),
              const Text("John Doe")
            ],
          ),
        ),
        PopupMenuItem(
          value: 3,
          onTap: () {
            // PrefsUser.name = "David Smith";
            // PrefsUser.tag = "@davidsmith_32";
            // refreshhome.updateWidget();
            BlocProvider.of<UserChangeCubit>(context).toDavid();
          },
          child: Row(
            children: [
              SizedBox(
                width: size.width * 0.15,
                child: CircleAvatar(
                  child: Image.asset("assets/David Smith.png"),
                ),
              ),
              const SizedBox(width: 10),
              const Text("David Smith")
            ],
          ),
        ),
      ],
      offset: const Offset(0, 60),
      color: Colors.white,
      elevation: 2,
    );
  }
}
