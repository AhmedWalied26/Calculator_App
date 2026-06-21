import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonItem extends StatelessWidget {
  double height;
  double width;
  String label;
  bool isIcon;
  Color color;
  Color textColor;
  Function onClick;

  ButtonItem({
    super.key,
    required this.onClick,
    this.height = 78,
    this.width = 80,
    required this.label,
    required this.color,
    this.isIcon = false,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20, bottom: 22),
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: () {
          onClick(label);
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: color,
        ),
        child: isIcon
            ? Icon(Icons.backspace_outlined, size: 24, color: Colors.white)
            : Text(
                label,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 32,
                ),
              ),
      ),
    );
  }
}
