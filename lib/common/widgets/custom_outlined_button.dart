import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.onTap,
    required this.child,
  });

  final void Function() onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onTap, child: child);
  }
}
