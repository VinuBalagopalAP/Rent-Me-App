import 'package:flutter/material.dart';
import '../../../utils/theme.dart';

class SelectionButton<T> extends StatelessWidget {
  final T value;
  final T selectedValue;
  final ValueChanged<T> updateValue;
  const SelectionButton({
    Key? key,
    required this.value,
    required this.selectedValue,
    required this.updateValue,
  }) : super(key: key);

  bool get isColor => value is Color;
  bool get isInt => value is int;
  bool get isSame => value == selectedValue;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        updateValue(value);
      },
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) =>
              value is Color ? StoreTheme.primaryColor : StoreTheme.black,
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => isColor ? value as Color : null,
        ),
        shape: MaterialStateProperty.resolveWith(
          (states) => CircleBorder(side: side()),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child(),
      ),
    );
  }

  Widget child() {
    return isSame
        ? isColor
            ? const Icon(Icons.done)
            : Text("$value")
        : isColor
            ? const Text("")
            : Text("$value");
  }

  BorderSide side() {
    return isInt
        ? BorderSide(
            color: isSame ? StoreTheme.primaryColor : StoreTheme.grey,
            width: 2,
          )
        : const BorderSide(
            color: Colors.transparent,
          );
  }
}
