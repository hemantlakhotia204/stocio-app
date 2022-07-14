import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:sizer/sizer.dart';
import 'package:stocio_app/common/utils/utils.dart';
import 'package:stocio_app/common/widgets/s_text.dart';
import 'package:stocio_app/event/screens/event_screen.dart';
import 'package:stocio_app/home/components/event_card_small.dart';

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
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: Utils.bgGradient(),
        child: SingleChildScrollView(
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
                    _menuItem(
                        isPressed: isPressed1,
                        onPointerDown: (_) => setState(() => isPressed1 = true),
                        onPointerUp: (_) {
                          setState(() => isPressed1 = false);
                          Utils.navigatePush(
                              context, (p0, p1, p2) => const EventScreen());
                        },
                        label: 'Events',
                        icon: Icons.calendar_today_rounded),
                    _menuItem(
                        isPressed: isPressed2,
                        onPointerDown: (_) => setState(() => isPressed2 = true),
                        onPointerUp: (_) {
                          // Utils.navigatePush(
                          //     context, (p0, p1, p2) => const EventScreen());
                          setState(() => isPressed2 = false);
                        },
                        label: 'Forum',
                        icon: Icons.question_answer_rounded),
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
                        return const EventCardSmall();
                      },
                      itemCount: 3,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuItem(
      {void Function(PointerUpEvent)? onPointerUp,
      void Function(PointerDownEvent)? onPointerDown,
      required String label,
      IconData? icon,
      required bool isPressed}) {
    Color btnBgColor = Utils.getColor('PB');
    Offset distance = isPressed ? Offset(3.sp, 3.sp) : Offset(4.sp, 4.sp);
    double blur = isPressed ? 4.sp : 5.sp;
    return Listener(
      onPointerUp: onPointerUp,
      onPointerDown: onPointerDown,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
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
}
