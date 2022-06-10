import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stocio_app/common/utils/utils.dart';
import 'package:stocio_app/common/widgets/s_icon_button.dart';
import 'package:stocio_app/common/widgets/s_text_button.dart';

class EventCardSmall extends StatefulWidget {
  const EventCardSmall({Key? key}) : super(key: key);

  @override
  State<EventCardSmall> createState() => _EventCardSmallState();
}

class _EventCardSmallState extends State<EventCardSmall> {
  bool bookmarked = false, liked = false;

  @override
  Widget build(BuildContext context) {
    var cardWidth = 70.w;
    var cardHeight = 40.h;
    return Container(
      margin: EdgeInsets.only(left: 5.w),
      width: cardWidth,
      height: cardHeight,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Utils.getColor('SB'),
              borderRadius: BorderRadius.circular(4.w),
            ),
            margin: EdgeInsets.only(top: 5.h, right: 5.w),
          ),
          Container(
            constraints:
                BoxConstraints(maxHeight: cardHeight / 2, maxWidth: cardWidth),
            margin: EdgeInsets.only(left: 5.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.w),
              color: Colors.transparent,
              image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/default_event_image.jpeg'),
              ),
              boxShadow: [
                BoxShadow(
                    color: Utils.getColor('PB'),
                    offset: Offset(-6.sp, 8.sp),
                    blurRadius: 9.sp,
                    spreadRadius: 1.sp)
              ],
            ),
          ),
          Positioned(
            top: cardHeight / 2 - 3.h,
            right: 8.w,
            child: Row(
              children: [
                SIconButton(
                  onPressed: () {
                    setState(() {
                      liked = !liked;
                    });
                    Utils.toast(
                      context,
                      liked ? 'marked as favourite' : 'marked as un-favourite',
                      success: true,
                    );
                  },
                  backgroundColor: Utils.getColor('PBB'),
                  icon: Icon(
                    // addedToList ? Icons.done_rounded : Icons.add_rounded,
                    liked
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_rounded,
                    size: 22.sp,
                    color: Utils.getColor('').withOpacity(0.9),
                  ),
                ),
                SizedBox(
                  width: 3.w,
                ),
                SIconButton(
                  onPressed: () {
                    setState(() {
                      bookmarked = !bookmarked;
                    });
                    Utils.toast(
                      context,
                      bookmarked ? 'added to your list' : 'removed from list',
                      success: true,
                    );
                  },
                  backgroundColor: Utils.getColor('PBB'),
                  icon: Icon(
                    // addedToList ? Icons.done_rounded : Icons.add_rounded,
                    bookmarked
                        ? Icons.bookmark_rounded
                        : Icons.bookmark_border_rounded,
                    size: 22.sp,
                    color: Utils.getColor('').withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            top: cardHeight / 2,
            child: Container(
              constraints: BoxConstraints(maxHeight: cardHeight / 2),
              padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'DateTime',
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: Utils.getColor('PT')),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Text(
                    'Title is a thing which everybody thinks of',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Utils.getColor('DB'),
                    ),
                    softWrap: true,
                  ),
                  Text(
                    '📍 Location',
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 10.sp,
                        color: Utils.getColor("DB").withOpacity(0.75)),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 1.h,
            right: 8.w,
            left: 4.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 10,
                  child: Text(
                    '30 people interested',
                    softWrap: true,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w500,
                      fontSize: 10.sp,
                      color: Utils.getColor('DB').withOpacity(0.75),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: STextButton(
                    fontSize: 12.sp,
                    text: 'Join',
                    onPressed: () {},
                    primaryColor: Utils.getColor('PBB'),
                    height: 5.h,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
