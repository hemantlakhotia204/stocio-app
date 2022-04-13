import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stocio_app/common/utils/utils.dart';

class DropDownSearch extends StatefulWidget {
  final List<String> items;
  final TextEditingController controller;
  final String? hintText;

  const DropDownSearch(
      {Key? key, required this.items, required this.controller, this.hintText})
      : super(key: key);

  @override
  State<DropDownSearch> createState() => _DropDownSearchState();
}

class _DropDownSearchState extends State<DropDownSearch> {
  bool _listVisibility = false;
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    String? hintText = widget.hintText;

    return WillPopScope(
      onWillPop: () async {
        if (_focusNode.hasFocus) {
          _focusNode.unfocus();
          setState(() {
            _listVisibility = false;
          });
          return false;
        }
        return true;
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.w),
            border: Border.all(color: Utils.getColor('PT'))),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  _listVisibility = !_listVisibility;
                });
              },
              child: Container(
                height: 10.h,
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Stack(
                  children: [
                    TextFormField(
                      onTap: () {
                        if (!_listVisibility) {
                          setState(() {
                            _listVisibility = !_listVisibility;
                          });
                        }
                      },
                      maxLines: 3,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Utils.getColor('PT'))),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Utils.getColor('PT'))),
                        hintText: hintText ?? "",
                        hintStyle: hintText != null
                            ? TextStyle(
                                color: Colors.white38,
                                fontWeight: FontWeight.w300,
                                fontSize: 15.sp)
                            : null,
                        contentPadding:
                            EdgeInsets.only(left: 2.w, top: 2.h, right: 2.w),
                      ),
                      focusNode: _focusNode,
                      controller: widget.controller,
                      style: TextStyle(
                        color: Utils.getColor('`'),
                        fontSize: 15.sp,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          if (_focusNode.hasFocus) {
                            _focusNode.unfocus();
                          } else {
                            _focusNode.requestFocus();
                          }
                          setState(() {
                            _listVisibility = !_listVisibility;
                          });
                        },
                        child: Icon(
                          Icons.arrow_drop_down_outlined,
                          size: 24.sp,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // SizedBox(height: 1.h),
            Visibility(
              visible: _listVisibility,
              child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.items.length < 5 ? widget.items.length : 5,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        widget.controller.text = widget.items[index];
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 1.h),
                        padding: Utils.contentPadding(vertical: 1.h),
                        child: Text(
                          widget.items[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
