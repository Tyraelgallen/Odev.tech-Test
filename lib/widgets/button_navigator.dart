import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        child: navigate == "home"
            ? const Icon(CupertinoIcons.home)
            : const Icon(CupertinoIcons.add),
      ),
    );
  }
}
