import 'package:flutter/material.dart';

const double kButtonSize = 45;
get onPressed => null;

class RoundIconButton extends StatelessWidget {
  final Icon? child;
  final VoidCallback? onPress;
  const RoundIconButton(
      {super.key, required this.child, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RawMaterialButton(
        elevation: 6.0,
        constraints: const BoxConstraints.tightFor(
            width: kButtonSize, height: kButtonSize),
        fillColor: Colors.blue,
        shape: const CircleBorder(),
        onPressed: onPress,
        child: child,
      ),
    );
  }
}
