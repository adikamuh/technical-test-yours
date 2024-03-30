import 'package:flutter/material.dart';
import 'package:yours_technical_test/features/menu/model/size.dart';

class SizeItemWidget extends StatelessWidget {
  final MenuSize menuSize;
  final MenuSize groupValue;
  final void Function(MenuSize?) onChanged;
  const SizeItemWidget({
    Key? key,
    required this.menuSize,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Radio<MenuSize>(
          value: menuSize,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Text(menuSize.name),
      ],
    );
  }
}
