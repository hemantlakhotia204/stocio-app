import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Utils {
  Widget bgGradient({required Widget child}) {
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff191b20), Color(0xff1f2128)])),
      child: child,
    );
  }

  static toast(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  static contentPadding({double? horizontal, double? vertical}) {
    return EdgeInsets.symmetric(
        horizontal: horizontal ?? 5.w, vertical: vertical ?? 2.5.h);
  }

  static screenPadding() {
    return EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h);
  }

  static inputDecoration({String? label, Widget? icon}) {
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
        borderSide: BorderSide(color: getColor('PT'), width: 0.5.w),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2.w),
        borderSide: BorderSide(color: getColor('PT'), width: 0.5.w),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2.w),
        borderSide: BorderSide(color: Colors.redAccent, width: 0.5.w),
      ),
      prefixIcon: icon,
    );
  }

  static Color getColor(String type) {
    Color color = Colors.white;
    switch (type) {
      case 'PB':
        //primary bg
        color = const Color(0xff1F2128);
        break;
      case 'SB':
        color = const Color(0xffb6aef0);
        break;
      case 'DB':
        //dark bg
        color = const Color(0xff191B20);
        break;
      case 'PT':
        //primary text
        color = const Color(0xff7142d6);
        break;
      case 'PBB':
        //primary button bg
        // color = const Color(0xff246bfd);
        color = const Color(0xff7737ff);
        break;
    }
    return color;
  }

  static Widget CustomLoader() {
    return LinearProgressIndicator(
      color: getColor('PBB'),
    );
  }
}
