import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SButton extends StatefulWidget {
  final String text;
  final double? width;
  final Color? primaryColor;
  final Function() onPressed;

  const SButton(
      {Key? key,
      required this.text,
      this.width,
      this.primaryColor = Colors.white,
      required this.onPressed})
      : super(key: key);

  @override
  State<SButton> createState() => _SButtonState();
}

class _SButtonState extends State<SButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.primaryColor,
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
      width: widget.width ?? 60.w,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500
          ),
        ),
      ),
    );
  }
}
