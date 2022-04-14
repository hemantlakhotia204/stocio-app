import 'package:flutter/material.dart';
import 'package:stocio_app/common/utils/utils.dart';
import 'package:sizer/sizer.dart';

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.getColor('SB'),
      body: Container(
        padding: Utils.contentPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.h, bottom: 5.h),
              child: Text(
                'we have sent a confirmation \nmail to you', //Change this text
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                    // color: Utils.getColor(''),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Image.asset('assets/images/man_with_tablet.png'),
            )
          ],
        ),
      ),
    );
  }
}
