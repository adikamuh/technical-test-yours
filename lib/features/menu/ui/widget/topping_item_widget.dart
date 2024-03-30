import 'package:flutter/material.dart';
import 'package:yours_technical_test/features/menu/model/topping.dart';

class ToppingItemWidget extends StatefulWidget {
  final Topping topping;
  final bool value;
  final bool enable;
  final Function(bool, Topping) onChanged;
  const ToppingItemWidget({
    Key? key,
    required this.topping,
    required this.value,
    required this.enable,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<ToppingItemWidget> createState() => _ToppingItemWidgetState();
}

class _ToppingItemWidgetState extends State<ToppingItemWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Row(
        children: [
          IgnorePointer(
            ignoring: widget.enable ? false : true,
            child: Checkbox(
              fillColor: widget.enable
                  ? MaterialStateProperty.all(Colors.green)
                  : MaterialStateProperty.all(Colors.grey),
              value: widget.value,
              onChanged: (value) {
                widget.onChanged(value!, widget.topping);
              },
            ),
          ),
          Expanded(child: Text(widget.topping.name)),
        ],
      ),
    );
  }
}
