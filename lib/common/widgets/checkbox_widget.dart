import 'package:flutter/material.dart';

class TCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;

  const TCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: onChanged,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith((states) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        return states.contains(MaterialState.selected)
            ? const Color(0xFFE91E63)
            : isDark ? Colors.grey.shade700 : Colors.grey.shade300;
      }),
    );
  }
}
