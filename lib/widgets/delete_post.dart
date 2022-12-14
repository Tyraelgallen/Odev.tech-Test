import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:odev_test/databases/db1.dart';
import 'package:odev_test/provider/provider_homepage.dart';
import 'package:odev_test/widgets/custom_button.dart';
import 'package:provider/provider.dart';

Future deleteDialog(context, int id) async {
  final refreshhome = Provider.of<RefreshHome>(context, listen: false);

  return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (_) => AlertDialog(
            elevation: 20,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  FluentSystemIcons.ic_fluent_delete_regular,
                  size: 50,
                ),
                const Text(
                  "Delete Post?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                CustomButton(
                  fontsize: 20,
                  radius: 17,
                  wsize: 0.4,
                  text: "Yes",
                  color: const Color.fromARGB(255, 145, 77, 209),
                  function: () async {
                    FocusScope.of(context).unfocus();
                    await MyDatabase.instance.deleteById(id);
                    Navigator.pop(context);
                    refreshhome.updateWidget();
                  },
                ),
                const SizedBox(height: 10),
                CustomButton(
                  fontsize: 20,
                  radius: 17,
                  wsize: 0.4,
                  text: "No",
                  color: const Color.fromARGB(255, 174, 90, 207),
                  function: () async {
                    FocusScope.of(context).unfocus();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ));
}
