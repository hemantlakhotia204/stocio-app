import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stocio_app/common/utils/utils.dart';

class SBack extends StatelessWidget {
  final void Function()? onPressed;

  const SBack({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 2.w, top: 6.h),
      height: 40.sp,
      width: 40.sp,
      child: FloatingActionButton(
        heroTag: 'Back',
        onPressed: onPressed ?? () => Navigator.pop(context),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 24.sp,
          color: Utils.getColor('').withOpacity(0.9),
        ),
        elevation: 10,
        backgroundColor: Colors.transparent,
        // backgroundColor: Colors.white.withOpacity(0.25),
      ),
    );
  }
}
