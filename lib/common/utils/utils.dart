import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stocio_app/common/models/s_response.dart';

class Utils {
  static BoxDecoration bgGradient() {
    return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            getColor('PB'),
            getColor('DB'),
            getColor('PB'),
          ],
          stops: const [
            0.1,
            0.4,
            1
          ]),
    );
  }

  static toast(BuildContext context, String message, {bool? success = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
        ),
        backgroundColor: success != null && success
            ? Colors.grey.shade400
            : Colors.redAccent,
        duration: const Duration(milliseconds: 2000),
      ),
    );
  }

  static contentPadding({double? horizontal, double? vertical}) {
    return EdgeInsets.symmetric(
        horizontal: horizontal ?? 5.w, vertical: vertical ?? 2.5.h);
  }

  static screenPadding() {
    return EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h);
  }

  //for textFormFields
  static inputDecoration({String? label, Widget? prefixIcon, Widget? suffixIcon, Widget? suffix}) {
    return InputDecoration(
      label: label != null
          ? Text(
              label,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            )
          : const SizedBox(),
      labelStyle: label != null
          ? TextStyle(
              color: getColor(''), fontWeight: FontWeight.w500, fontSize: 16.sp)
          : null,
      contentPadding: contentPadding(),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2.w),
        borderSide: BorderSide(color: getColor('PBB'), width: 0.5.w),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2.w),
        borderSide: BorderSide(color: getColor('PBB'), width: 0.5.w),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2.w),
        borderSide: BorderSide(color: Colors.redAccent, width: 0.5.w),
      ),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      suffix: suffix
    );
  }

  //Global colors defined here
  static Color getColor(String type) {
    Color color = Colors.white;
    switch (type) {
      case 'PB':
        //primary bg
        // color = const Color(0xff2C2A3C);
        //1a182c
        color = const Color(0xff1f1c36);

        break;
      case 'SB':
        color = const Color(0xffb6aef0);
        break;
      case 'DB':
        //dark bg
        color = const Color(0xff181a20);
        break;
      case 'PT':
        //primary text
        color = const Color(0xffa2467a);
        break;
      case 'PBB':
        //primary button bg
        color = const Color(0xffa2467a);
        // color = const Color(0xff7142d6);
        // color = const Color(0xff7737ff);
        break;
    }
    return color;
  }

  //Add gradient to shimmering widgets while loading
  static const shimmerGradient = LinearGradient(
    colors: [
      Color(0xFFEBEBF4),
      Color(0xFFF4F4F4),
      Color(0xFFEBEBF4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );

  static dynamic handleError(e, context) {
    return toast(context, (e.message as SResponse).msg!);
  }

  // navigation animation to other page
  static Future navigatePushReplace(
      BuildContext context,
      Widget Function(BuildContext, Animation<double>, Animation<double>)
          pageBuilder) async {
    return await Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: pageBuilder,
        transitionDuration: const Duration(milliseconds: 600),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  static Future navigatePush(
      BuildContext context,
      Widget Function(BuildContext, Animation<double>, Animation<double>)
          pageBuilder) async {
    return await Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: pageBuilder,
        transitionDuration: const Duration(milliseconds: 600),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }
}
