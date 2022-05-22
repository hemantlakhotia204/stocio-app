import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SBack extends StatelessWidget {
  const SBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 2.w, top: 6.h),
      height: 40.sp,
      width: 40.sp,
      child: FloatingActionButton(
        heroTag: 'Back',
        onPressed: () => Navigator.pop(context),
        child: Icon(
          Icons.arrow_back,
          size: 25.sp,
        ),
        backgroundColor: Colors.transparent,
        // backgroundColor: Colors.white.withOpacity(0.25),
      ),
    );
  }
}
