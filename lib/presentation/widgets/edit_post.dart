import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:odev_test/data/models/post_model.dart';
import 'package:odev_test/logic/cubit/db_crud_cubit.dart';

import 'package:odev_test/presentation/styles/styles.dart';
import 'package:odev_test/presentation/widgets/custom_button.dart';

Future editDialog(context, Post item) async {
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
                      // await MyDatabase.instance.update(item);
                      BlocProvider.of<DbCrudCubit>(context).edit(item);
                      Navigator.pop(context);
                    },
                  ),
                ],
              )
            ],
          ));
}
