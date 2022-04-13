import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stocio_app/common/utils/utils.dart';

class SText extends StatelessWidget {
  final String prefixText;
  final String suffixText;

  const SText({Key? key, required this.prefixText, required this.suffixText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 1.h, bottom: 2.h),
      child: RichText(
        text: TextSpan(
            text: prefixText,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600),
            children: [
              TextSpan(
                  style: TextStyle(
                      color: Utils.getColor('PT'),
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w600),
                  text: suffixText)
            ]),
      ),
    );
  }
}
