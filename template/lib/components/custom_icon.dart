import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomIcon extends StatelessWidget {
  VoidCallback? onPressed;
  Color? backgroundColor;
  Color? iconColor;
  dynamic  icon;
  AlignmentGeometry? alignment;
  CustomIcon({Key ? key,this.alignment, this.icon, this.onPressed,this.backgroundColor,this.iconColor}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          side: const BorderSide(width: 0, color: Colors.transparent),
          backgroundColor: backgroundColor ?? backgroundColor,
          padding: EdgeInsets.zero,
          alignment: alignment,

        ),
        onPressed: onPressed ?? onPressed,
        child: Icon(icon,color: iconColor ?? iconColor),
      ),
    );
  }
}