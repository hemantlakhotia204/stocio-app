import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EventCard extends StatefulWidget {
  const EventCard({Key? key}) : super(key: key);

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: double.infinity,
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 2.h),
      // padding: EdgeInsets,
    );
  }
}
