import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:sizer/sizer.dart';
import 'package:stocio_app/common/utils/utils.dart';
import 'package:stocio_app/common/widgets/s_text.dart';
import 'package:stocio_app/home/components/event_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isPressed1 = false;
  bool isPressed2 = false;
  bool isPressed3 = false;
  bool isPressed4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        decoration: Utils.bgGradient(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: Utils.contentPadding(horizontal: 8.w, vertical: 2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SText(prefixText: 'hi ', suffixText: 'username'),
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
            ),
            SizedBox(
              height: 18.h,
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 4.w),
                  _menuItem(() {
                    setState(() => {isPressed1 = !isPressed1});
                  }, 'Events', Icons.calendar_today_rounded, isPressed1),
                  _menuItem(() {
                    setState(() => {isPressed2 = !isPressed2});
                  }, 'Discover', Icons.search_rounded, isPressed2),
                  _menuItem(() {
                    setState(() => {isPressed3 = !isPressed3});
                  }, 'Forum', Icons.question_answer_rounded, isPressed3),
                  _menuItem(() {
                    setState(() => {isPressed4 = !isPressed4});
                  }, 'Forum', Icons.question_answer_rounded, isPressed4),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: Utils.contentPadding(),
                  child: const SText(
                    prefixText: 'popular events ',
                    suffixText: 'near you',
                  ),
                ),
                SizedBox(
                  height: 40.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return const EventCard();
                    },
                    itemCount: 3,

                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

InkWell _menuItem(
    void Function()? onTap, String label, IconData icon, bool isPressed) {
  Color btnBgColor = Utils.getColor('PB');
  Offset distance = isPressed ? Offset(3.sp, 3.sp) : Offset(4.sp, 4.sp);
  double blur = isPressed ? 4.sp : 5.sp;
  return InkWell(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      // height: 15.h,
      width: 24.w,
      padding: EdgeInsets.symmetric(vertical: 3.h),
      margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
      decoration: BoxDecoration(
          color: btnBgColor,
          borderRadius: BorderRadius.circular(5.w),
          boxShadow: [
            BoxShadow(
              color: Utils.getColor('SB').withOpacity(0.4),
              offset: -distance,
              blurRadius: blur,
              inset: isPressed,
            ),
            BoxShadow(
                color: Colors.black45,
                offset: distance,
                blurRadius: blur,
                inset: isPressed),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.values[5],
        children: [
          Icon(
            icon,
            size: 22.sp,
            color: Utils.getColor(''),
          ),
          Text(
            label,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Utils.getColor(''),
            ),
          )
        ],
      ),
    ),
  );
}
