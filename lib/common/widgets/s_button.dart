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
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: widget.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(3.w)),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 0.5,
              blurRadius: 2,
              offset: Offset(3, 3)
            )
          ]
        ),
        padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 5.w),
        margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
        width: widget.width ?? 40.w,
        child: Text(
          widget.text,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: widget.primaryColor == Colors.white
                  ? Colors.black
                  : Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
