import 'package:flutter/material.dart';

import '../../../../constants/color_constants.dart';

class ToggleButton extends StatelessWidget {
  const ToggleButton({
    super.key,
    required this.label,
    required this.onTap,
    required this.isSelected,
  });

  final String label;
  final bool isSelected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(6),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? white : lightGrey,
        ),
        child: Text(
          textAlign: TextAlign.center,
          label,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}