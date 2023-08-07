import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String buttonName;
  final Function? onPress;

  final double? maxWidth;
  final Color? buttonColor;
  final TextStyle? textStyle;

  const AppButton({
    Key? key,
    required this.buttonName,
    required this.onPress,
    this.maxWidth,
    this.buttonColor,
    this.textStyle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress?.call(),
      child: Container(
        height: 100,
        width: 100,
        constraints:
            (maxWidth != null) ? BoxConstraints(maxWidth: maxWidth!) : null,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Row(
          children: [
            Expanded(
              child: Text(buttonName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18, color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
