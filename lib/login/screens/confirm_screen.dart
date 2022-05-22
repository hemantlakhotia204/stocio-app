import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stocio_app/common/utils/utils.dart';
import 'package:sizer/sizer.dart';
import 'package:stocio_app/common/widgets/s_button.dart';
import 'package:stocio_app/common/widgets/s_text.dart';


///Enter OTP SCREEN
class ConfirmScreen extends StatefulWidget {
  const ConfirmScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {

  ///for otp error handler vibration animation
  ///package used here: pin_code_fields
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Utils.getColor('SB'),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              padding: Utils.contentPadding(),
              child: Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Image.asset('assets/images/man_with_tablet.png'),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              width: 100.w,
              decoration: BoxDecoration(
                color: Utils.getColor('PB'),
                borderRadius: BorderRadius.vertical(top: Radius.circular(8.w)),
              ),
              padding: Utils.contentPadding(),
              margin: EdgeInsets.only(top: 55.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 2.h, bottom: 5.h),
                    child: const SText(
                      prefixText: 'we have sent otp\n',
                     suffixText: 'to your mail',
                    ),
                  ),
                  Container(
                    margin: Utils.contentPadding(horizontal: 2.w, vertical: 0),
                    child: PinCodeTextField(
                      validator: (value) {

                        if(value!=null && value.isNotEmpty) {
                          return '       Otp field cannot be empty';
                        }
                        return '';
                      },
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      autovalidateMode: AutovalidateMode.disabled,
                      length: 5,
                      textStyle: TextStyle(color: Utils.getColor('')),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      obscureText: true,
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      animationDuration: const Duration(milliseconds: 300),
                      errorAnimationController: errorController,
                      onChanged: (value) {
                        ///for testing // errorController.add(ErrorAnimationType.shake);
                        setState(() {
                          // currentText = value;
                        });
                      },
                      appContext: context,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        inactiveColor: Utils.getColor('PBB'),
                        activeColor: Utils.getColor(''),
                        selectedColor: Utils.getColor('')
                      ),
                    ),
                  ),
                  SButton(
                    text: 'Submit OTP',
                    onPressed: () {},
                    primaryColor: Utils.getColor('PBB'),
                    width: 55.w,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
