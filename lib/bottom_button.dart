import 'package:flutter/material.dart';
import 'constants.dart';

class Bottom_Button extends StatelessWidget {
  const Bottom_Button({required this.buttonName, required this.ontapFunction});
  final String buttonName;
  final Function ontapFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontapFunction();
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(buttonName, style: KLargeButtonTextStyle),
        width: double.infinity,
        color: KBottomContainerColor,
        height: 80,
      ),
    );
  }
}
