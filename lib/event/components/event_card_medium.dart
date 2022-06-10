import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stocio_app/common/utils/utils.dart';

class EventCardMedium extends StatefulWidget {
  const EventCardMedium({Key? key}) : super(key: key);

  @override
  State<EventCardMedium> createState() => _EventCardMediumState();
}

class _EventCardMediumState extends State<EventCardMedium> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40.h,
      decoration: BoxDecoration(
        color: Utils.getColor(''),
        borderRadius: BorderRadius.circular(4.w)
      ),

    );
  }
}
