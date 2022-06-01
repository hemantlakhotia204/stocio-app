import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stocio_app/common/utils/utils.dart';

class SText extends StatelessWidget {
  final String prefixText;
  final String suffixText;
  final double? fontSize;

  const SText(
      {Key? key,
      required this.prefixText,
      required this.suffixText,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 1.h, bottom: 2.h),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: prefixText,
            style: TextStyle(
                color: Colors.white,
                fontSize: fontSize ?? 20.sp,
                fontWeight: FontWeight.w600),
            children: [
              TextSpan(
                  style: TextStyle(
                      color: Utils.getColor('PT'),
                      fontSize: fontSize != null ? fontSize! + 4.sp : 24.sp,
                      fontWeight: FontWeight.w600),
                  text: suffixText)
            ]),
      ),
    );
  }
}
