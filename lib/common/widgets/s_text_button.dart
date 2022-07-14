import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stocio_app/common/utils/utils.dart';

class STextButton extends StatefulWidget {
  final String text;
  final double? width;
  final double? height;
  final Color? primaryColor;
  final Function() onPressed;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;

  const STextButton({
    Key? key,
    required this.text,
    this.width,
    this.height,
    this.primaryColor = Colors.white,
    required this.onPressed,
    this.fontSize,
    this.padding,
  }) : super(key: key);

  @override
  State<STextButton> createState() => _STextButtonState();
}

class _STextButtonState extends State<STextButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        padding: widget.padding ?? Utils.contentPadding(vertical: 2.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: widget.primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(3.w)),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 0.5,
                  blurRadius: 2,
                  offset: Offset(3, 3))
            ]),
        width: widget.width ?? 40.w,
        height: widget.height,
        child: Text(
          widget.text,
          style: TextStyle(
              fontSize: widget.fontSize ?? 16.sp,
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



