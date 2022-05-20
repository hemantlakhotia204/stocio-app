import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stocio_app/common/utils/utils.dart';
import 'package:stocio_app/common/widgets/s_text.dart';

class Event extends StatefulWidget {
  const Event({Key? key}) : super(key: key);

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.getColor('PB'),
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SText(prefixText: 'hello, ', suffixText: 'username'),
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
          Divider(
            height: 1.h,
            color: Utils.getColor('SB'),
          ),
          Padding(
            padding: Utils.screenPadding(),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 7,
                        child: Container(
                          padding: Utils.contentPadding(vertical: 1.h),
                          margin: EdgeInsets.only(right: 5.w),
                          alignment: Alignment.centerLeft,
                          width: 60.w,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10.w),
                            border: Border.all(color: Utils.getColor('PBB'))
                          ),
                          child: Icon(
                            Icons.search_rounded,
                            size: 25.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.filter_list_rounded,
                            size: 25.sp,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],

                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
