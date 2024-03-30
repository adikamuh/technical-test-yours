import 'package:flutter/material.dart';
import 'package:yours_technical_test/features/menu/model/menu.dart';

class MenuItemWidget extends StatelessWidget {
  final Menu menu;
  final Menu groupValue;
  final void Function(Menu?) onChanged;
  const MenuItemWidget({
    Key? key,
    required this.menu,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            menu.imageAsset,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Text(menu.name),
          Text("\$ ${menu.price.toStringAsFixed(0)}"),
          const SizedBox(height: 8),
          Radio<Menu>(
            value: menu,
            groupValue: groupValue,
            onChanged: onChanged,
          )
        ],
      ),
    );
  }
}
