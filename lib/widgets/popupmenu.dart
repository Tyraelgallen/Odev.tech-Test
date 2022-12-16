import 'package:flutter/material.dart';
import 'package:odev_test/preferences/prefs_user.dart';
import 'package:odev_test/provider/provider_homepage.dart';
import 'package:odev_test/styles/styles.dart';
import 'package:provider/provider.dart';

class Popup extends StatelessWidget {
  const Popup({super.key});

  @override
  Widget build(BuildContext context) {
    final refreshhome = Provider.of<RefreshHome>(context, listen: false);
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
            PrefsUser.name = "Jane Doe";
            PrefsUser.tag = "@janedoe_29";

            refreshhome.updateWidget();
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
            PrefsUser.name = "John Doe";
            PrefsUser.tag = "@johndoe_27";
            refreshhome.updateWidget();
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
            PrefsUser.name = "David Smith";
            PrefsUser.tag = "@davidsmith_32";
            refreshhome.updateWidget();
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
