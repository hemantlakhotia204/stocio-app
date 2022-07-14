import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stocio_app/common/utils/utils.dart';
import 'package:stocio_app/common/widgets/s_icon_button.dart';
import 'package:stocio_app/common/widgets/s_ios_back.dart';
import 'package:stocio_app/common/widgets/s_text.dart';
import 'package:stocio_app/common/widgets/s_text_button.dart';
import 'package:stocio_app/common/widgets/s_text_form_field.dart';

class AddEventScreen extends StatefulWidget {
  final List<dynamic>? images;

  const AddEventScreen({Key? key, this.images}) : super(key: key);

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _buttonLabelController = TextEditingController();
  final TextEditingController _buttonValueController = TextEditingController();

  final FocusNode _titleNode = FocusNode();
  final FocusNode _descNode = FocusNode();
  final FocusNode _buttonLabelNode = FocusNode();
  final FocusNode _buttonValueNode = FocusNode();

  final Duration _animationDuration = const Duration(milliseconds: 500);

  String postType = 'Intra';
  bool _isAdditionalOpen = false;
  bool _addButton = false;

  String _locationText = '';
  String _dateTimeText = '';

  @override
  Widget build(BuildContext context) {
    String _locationTimeText = '';
    if (_locationText.isNotEmpty && _dateTimeText.isNotEmpty) {
      _locationTimeText = "$_locationText | $_dateTimeText";
    } else if (_locationText.isEmpty || _dateTimeText.isEmpty) {
      _locationTimeText = "$_locationText$_dateTimeText";
    }

    return WillPopScope(
      onWillPop: () async {
        if (_titleNode.hasFocus) {
          _titleNode.unfocus();
          return false;
        } else if (_descNode.hasFocus) {
          _descNode.unfocus();
          return false;
        } else if (_buttonLabelNode.hasFocus) {
          _buttonLabelNode.unfocus();
          return false;
        } else if (_buttonValueNode.hasFocus) {
          _buttonValueNode.unfocus();
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: Utils.bgGradient(),
          child: GestureDetector(
            onTap: () {
              if (_titleNode.hasFocus) {
                _titleNode.unfocus();
              } else if (_descNode.hasFocus) {
                _descNode.unfocus();
              } else if (_buttonLabelNode.hasFocus) {
                _buttonLabelNode.unfocus();
              } else if (_buttonValueNode.hasFocus) {
                _buttonValueNode.unfocus();
              }
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SBack(),
                  Padding(
                    padding: Utils.contentPadding(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SText(
                          prefixText: 'create your ',
                          suffixText: 'own event',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              postType,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Switch(
                              value: postType == 'Intra' ? true : false,
                              onChanged: (bool value) {
                                if (_descNode.hasFocus) {}
                                String type = value ? 'Intra' : 'Inter';
                                setState(() {
                                  postType = type;
                                });
                              },
                            ),
                          ],
                        ),
                        STextFormField(
                          focusNode: _titleNode,
                          label: 'Title',
                          controller: _titleController,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'form field cannot be empty';
                            }
                            return '';
                          },
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        STextFormField(
                          maxLines: 3,
                          focusNode: _descNode,
                          label: 'Description',
                          controller: _descController,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'form field cannot be empty';
                            }
                            return '';
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            SIconButton(
                              icon: Icon(
                                Icons.add_location_alt_rounded,
                                size: 24.sp,
                              ),
                              backgroundColor: Utils.getColor('PBB'),
                              onLongPress: () {
                                // return
                              },
                              size: Size(12.w, 12.w),
                              onPressed: () {},
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            STextButton(
                              text: '➕  Start Day',
                              onPressed: () async {
                                DateTime _dateTime =
                                    await _handleDateTimePicker();
                                debugPrint(_dateTime.toString().split(".")[0]);
                                setState(() {
                                  _dateTimeText =
                                      _dateTime.toString().split(".")[0];
                                });
                              },
                              primaryColor: Utils.getColor('PBB'),
                              width: 40.w,
                              height: 12.w,
                              padding: EdgeInsets.zero,
                              fontSize: 12.sp,
                            ),
                          ],
                        ),
                        SizedBox(height: 0.5.h),
                        Visibility(
                          visible: _locationTimeText.isNotEmpty,
                          child: Text(
                            _locationTimeText,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                                color: Utils.getColor('PT')),
                          ),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Row(
                          children: [
                            SIconButton(
                              icon: Icon(
                                Icons.add_a_photo_rounded,
                                size: 24.sp,
                              ),
                              backgroundColor: Utils.getColor('PBB'),
                              onLongPress: () {
                                // return
                              },
                              size: Size(12.w, 12.w),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _isAdditionalOpen = !_isAdditionalOpen;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Additional Options',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Icon(
                                  _isAdditionalOpen
                                      ? Icons.arrow_drop_up_rounded
                                      : Icons.arrow_drop_down_rounded,
                                  size: 30.sp,
                                )
                              ],
                            ),
                          ),
                        ),
                        AnimatedSwitcher(
                          duration: _animationDuration,
                          transitionBuilder:
                              (Widget child, Animation<double> animation) =>
                                  FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                          child: _isAdditionalOpen
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 8.w,
                                      child: Checkbox(
                                          activeColor: Utils.getColor('PT'),
                                          value: _addButton,
                                          onChanged: (bool? value) {
                                            if (value != null) {
                                              setState(
                                                  () => _addButton = value);
                                            }
                                          }),
                                    ),
                                    SizedBox(width: 2.w),
                                    Text(
                                      'Add Button',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                        ),
                        AnimatedSwitcher(
                          duration: _animationDuration,
                          child: _addButton
                              ? Column(
                                  children: [
                                    STextFormField(
                                      focusNode: _buttonLabelNode,
                                      controller: _buttonLabelController,
                                      validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Field cannot be empty!';
                                        }
                                        return '';
                                      },
                                      label: 'Button label',
                                    ),
                                    SizedBox(
                                      height: 1.5.h,
                                    ),
                                    STextFormField(
                                      focusNode: _buttonValueNode,
                                      controller: _buttonValueController,
                                      validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Field cannot be empty!';
                                        }
                                        return '';
                                      },
                                      label: 'Button value',
                                    )
                                  ],
                                )
                              : const SizedBox.shrink(),
                        ),
                        SizedBox(height: 10.h),
                        Center(
                          child: STextButton(
                            text: 'Submit',
                            primaryColor: Utils.getColor('PBB'),
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<DateTime> _handleDateTimePicker() async {
    DateTime _dateTime = DateTime.now();
    DateTime? _date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (_date != null) {
      TimeOfDay? _time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay(
              hour: DateTime.now().hour, minute: DateTime.now().minute));
      if (_time != null) {
        _dateTime =
            _date.add(Duration(hours: _time.hour, minutes: _time.minute));
      }
    }
    return _dateTime;
  }
}
