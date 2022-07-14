import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stocio_app/common/utils/utils.dart';
import 'package:stocio_app/common/widgets/s_icon_button.dart';
import 'package:stocio_app/common/widgets/s_text_button.dart';

class EventCardMedium extends StatefulWidget {
  const EventCardMedium({Key? key}) : super(key: key);

  @override
  State<EventCardMedium> createState() => _EventCardMediumState();
}

class _EventCardMediumState extends State<EventCardMedium> {
  bool bookmarked = false, liked = false;
  var cardHeight = 50.h;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: cardHeight,
      margin: EdgeInsets.symmetric(vertical: 2.h),
      decoration: BoxDecoration(
        color: Utils.getColor('SB').withOpacity(0.7),
        borderRadius: BorderRadius.circular(4.w),
      ),
      child: Stack(
        children: [
          Container(
            height: 28.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.w),
              boxShadow: [
                BoxShadow(
                    color: Utils.getColor('PB'),
                    blurRadius: 5.sp,
                    offset: Offset(0, 1.h))
              ],
              image: const DecorationImage(
                image: AssetImage('assets/images/default_event_image.jpeg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: 24.h,
            right: 5.w,
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
                  width: 2.w,
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
                SizedBox(
                  width: 2.w,
                ),
                STextButton(
                  fontSize: 12.sp,
                  text: 'Join',
                  onPressed: () {},
                  primaryColor: Utils.getColor('PBB'),
                  height: 5.h,
                  width: 20.w,
                  padding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
          Positioned.fill(
            top: 28.h,
            child: Container(
              padding: Utils.contentPadding(vertical: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DateTime | Location, My Home Avatar',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: Utils.getColor('PT'),
                    ),
                  ),
                  Text(
                    'Title is a thing which everybody thinks of',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Utils.getColor('ST'),
                    ),
                    softWrap: true,
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Text(
                    'Desc is like a thing which you want to but cannot read because of time boundaries which is like a menace to the society',
                    style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w600,
                        color: Utils.getColor('ST').withOpacity(0.9)),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                  Container(
                    // alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 2.h),
                    width: double.infinity,
                    child: Stack(
                      children: [
                        _imageContainer(),
                        Positioned(left: 6.w, child: _imageContainer()),
                        Positioned(left: 12.w, child: _imageContainer()),
                        Positioned(
                          left: 25.w,
                          top: 1.h,
                          child: Text(
                            '3 people are interested',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 10.sp,
                                color: Utils.getColor('ST').withOpacity(0.75)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _imageContainer() {
    return Container(
      height: 10.w,
      width: 10.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.w),
          image: const DecorationImage(
            image: AssetImage('assets/images/default_event_image.jpeg'),
            fit: BoxFit.fill,
          )),
    );
  }
}
