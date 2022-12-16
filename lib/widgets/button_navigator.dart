import 'package:flutter/material.dart';
import 'package:odev_test/styles/styles.dart';

class ButtonNavigator extends StatelessWidget {
  const ButtonNavigator({
    Key? key,
    required this.navigate,
  }) : super(key: key);

  final String navigate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, navigate);
          },
          backgroundColor: const Color.fromARGB(255, 174, 90, 207),
          child: navigate == "home" ? Styles.homeIcon : Styles.addIcon),
    );
  }
}
