import 'package:flutter/material.dart';

class ButtonDesign extends StatelessWidget {
  void Function() onTap;
  String buttonText;
  bool? loading = false;

  ButtonDesign(
      {super.key, required this.buttonText, required this.onTap, this.loading});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.white,
      splashColor: Colors.white,
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(17),
        decoration: BoxDecoration(
            color: Colors.blue.shade900,
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Center(
            child: loading == false
                ? Text(
                    buttonText,
                    style: const TextStyle(color: Colors.white),
                  )
                : CircularProgressIndicator(
                    backgroundColor: Colors.blue.shade900,
                    color: Colors.white,
                  )),
      ),
    );
  }
}
