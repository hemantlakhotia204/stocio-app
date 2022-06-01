import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stocio_app/common/utils/utils.dart';
import 'package:stocio_app/common/widgets/s_text.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Utils.getColor('DB'),
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: Utils.bgGradient(),
        child: Column(
          children: [
            Container(
              padding: Utils.screenPadding(),
              child: Column(
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SText(prefixText: 'hello ', suffixText: 'username,'),
                      Container(
                        width: 15.w,
                        height: 15.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13.w),
                            // color: Colors.transparent,
                            border: Border.all(color: Utils.getColor('DB'))),
                        child: Image.asset('assets/images/login_bg.png'),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _menuItem(
                        () {},
                        'F',
                        Icons.calendar_today_rounded,
                      ),
                      SizedBox(width: 3.w,),
                      _menuItem(
                        () {},
                        'Discover',
                        Icons.search_rounded,
                      ),
                      SizedBox(width: 3.w,),
                      _menuItem(
                        () {},
                        'Doubt\nForum',
                        Icons.question_answer_rounded,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

InkWell _menuItem(void Function()? onTap, String label, IconData icon) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 15.h,
      width: 24.w,
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      margin: EdgeInsets.only(bottom: 1.h),
      decoration: BoxDecoration(
          color: Utils.getColor('PB'),
          borderRadius: BorderRadius.circular(6.w),
          boxShadow: [
            BoxShadow(
              color: Utils.getColor('SB').withOpacity(0.4),
              offset: Offset(0.5.w, 0.2.h),
              blurRadius: 3.sp,
              spreadRadius: 1.sp
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.values[5],
        children: [
          Icon(
            icon,
            size: 25.sp,
            color:Utils.getColor(''),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color:Utils.getColor(''),
            ),
          )
        ],
      ),
    ),
  );
}
