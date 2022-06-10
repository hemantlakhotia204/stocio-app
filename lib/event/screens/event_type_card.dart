import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EventTypeCard extends StatelessWidget {
  final String label;
  final String src;
  final void Function()? onTap;
  final Color? textColor;

  const EventTypeCard(
      {Key? key,
      required this.label,
      required this.src,
        this.onTap,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 20.h,
        decoration: BoxDecoration(
          // color: Utils.getColor('SB').withOpacity(0.8),
          borderRadius: BorderRadius.circular(4.w),
          image: DecorationImage(
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
            image: NetworkImage(src),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
