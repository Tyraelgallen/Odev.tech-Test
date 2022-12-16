import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:odev_test/logic/cubit/db_crud_cubit.dart';

import 'package:odev_test/presentation/styles/styles.dart';
import 'package:odev_test/presentation/widgets/custom_button.dart';

Future deleteDialog(context, int id) async {
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
                  color: Styles.primaryColor,
                  function: () async {
                    FocusScope.of(context).unfocus();
                    BlocProvider.of<DbCrudCubit>(context).delete(id);
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 10),
                CustomButton(
                  fontsize: 20,
                  radius: 17,
                  wsize: 0.4,
                  text: "No",
                  color: Styles.secondaryColor,
                  function: () async {
                    FocusScope.of(context).unfocus();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ));
}
