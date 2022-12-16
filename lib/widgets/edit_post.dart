import 'package:flutter/material.dart';
import 'package:odev_test/databases/db1.dart';
import 'package:odev_test/models/post_model.dart';
import 'package:odev_test/provider/provider_homepage.dart';
import 'package:odev_test/styles/styles.dart';
import 'package:odev_test/widgets/custom_button.dart';
import 'package:provider/provider.dart';

Future editDialog(context, Post item) async {
  final refreshhome = Provider.of<RefreshHome>(context, listen: false);
  final size = MediaQuery.of(context).size;

  return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (_) => AlertDialog(
            elevation: 20,
            title: SizedBox(
              width: size.width * 0.95,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Edit Post"),
                  Styles.editIcon,
                ],
              ),
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    onChanged: (value) {
                      item.text = value;
                    },
                    maxLines: 12,
                    maxLength: 2500,
                    initialValue: item.text,
                  ),
                ],
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    fontsize: 14,
                    radius: 10,
                    wsize: 0.35,
                    text: "DON´T EDIT",
                    color: Styles.secondaryColor,
                    function: () async {
                      FocusScope.of(context).unfocus();
                      Navigator.pop(context);
                    },
                  ),
                  CustomButton(
                    fontsize: 14,
                    radius: 10,
                    wsize: 0.3,
                    text: "SAVE AND PUBLISH",
                    color: Styles.primaryColor,
                    function: () async {
                      FocusScope.of(context).unfocus();
                      await MyDatabase.instance.update(item);
                      Navigator.pop(context);
                      refreshhome.updateWidget();
                    },
                  ),
                ],
              )
            ],
          ));
}
