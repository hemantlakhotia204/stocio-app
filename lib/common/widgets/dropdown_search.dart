import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stocio_app/common/utils/utils.dart';

class DropDownSearch extends StatefulWidget {
  /// list of items to be queried
  final List<String> items;

  /// textController for textFormField
  final TextEditingController controller;

  /// hint text to be displayed when widget is in unfocused mode
  final String? hintText;

  /// validator for textFormField
  final String? Function(String? value)? validator;

  /// when form is saved
  final FormFieldSetter<String>? onSaved;

  ///constructor
  const DropDownSearch(
      {Key? key,
      required this.items,
      required this.controller,
      this.hintText,
      this.validator,
      this.onSaved})
      : super(key: key);

  @override
  State<DropDownSearch> createState() => _DropDownSearchState();
}

class _DropDownSearchState extends State<DropDownSearch> {
  //show state of searched item list
  bool _listVisibility = false;
  final FocusNode _focusNode = FocusNode();
  List<String> items = [];

  @override
  void initState() {
    ///assigning data to list
    items = widget.items;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? hintText = widget.hintText;

    return WillPopScope(
      onWillPop: () async {
        /// when back button is pressed in android
        if (_focusNode.hasFocus) {
          _focusNode.unfocus();
          setState(() {
            _listVisibility = false;
          });
          return false;
        }
        return true;
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1500),
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
                height: widget.controller.text.isEmpty ? 8.h : 10.h,
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Stack(
                  children: [
                    TextFormField(
                      onSaved: widget.onSaved,
                      validator: widget.validator,

                      /// when textFormField is clicked
                      onTap: () {
                        if (!_listVisibility) {
                          setState(() {
                            _listVisibility = !_listVisibility;
                          });
                        }
                      },
                      onChanged: (String? value) {
                        if (value != null) {
                          _sortCollege(value);
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
                        contentPadding: EdgeInsets.only(
                            left: 2.w,
                            top: 2.h,
                            right: 2.w,
                            bottom: widget.controller.text.isEmpty ? 0 : 2.h),
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
                        /// when drop down icon is clicked
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
                          _listVisibility
                              ? Icons.arrow_drop_up_outlined
                              : Icons.arrow_drop_down_outlined,
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
              child: SizedBox(
                // height: 40.h,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: items.length < 5 ? items.length : 5,
                    itemBuilder: (context, index) {
                      return InkWell(
                        ///when an item is selected from the list
                        onTap: () {
                          widget.controller.text = items[index];
                          if (_focusNode.hasFocus) {
                            _focusNode.unfocus();
                          }
                          if (_listVisibility) {
                            setState(() {
                              _listVisibility = false;
                            });
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 1.h),
                          padding: Utils.contentPadding(vertical: 1.h),
                          child: Text(
                            items[index],
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
            ),
          ],
        ),
      ),
    );
  }

  void _sortCollege(String value) {
    List<String> _sortedItems = [];
    items = widget.items;
    for (var element in items) {
      if (element.contains(value)) {
        _sortedItems.add(element);
      }
    }
    setState(() {
      items = _sortedItems;
    });
  }
}
