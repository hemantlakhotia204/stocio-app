import 'package:flutter/material.dart';
import 'package:stocio_app/common/utils/utils.dart';
import 'package:sizer/sizer.dart';
import 'package:stocio_app/common/widgets/s_ios_back.dart';
import 'package:stocio_app/common/widgets/s_text.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String collegeName = "NIT Kurukshetra";

  @override
  Widget build(BuildContext context) {
    String _welcomeText = "$collegeName and Stocio \nwelcomes you.";

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Utils.getColor('PB'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const SBack(),
            Container(
              padding: Utils.contentPadding(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  SizedBox(height: 3.h,),
                  Text(
                    _welcomeText,
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  const SText(prefixText: 'enter your ', suffixText: 'details'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
