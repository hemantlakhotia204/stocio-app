import 'package:flutter/material.dart';
import 'package:stocio_app/common/utils/utils.dart';
import 'package:sizer/sizer.dart';
import 'package:stocio_app/common/widgets/s_button.dart';
import 'package:stocio_app/common/widgets/s_ios_back.dart';
import 'package:stocio_app/common/widgets/s_text.dart';
import 'package:stocio_app/common/widgets/s_text_form_field.dart';

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

    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _confirmController = TextEditingController();
    final TextEditingController _nameController = TextEditingController();

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
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    _welcomeText,
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  const SText(prefixText: 'enter your ', suffixText: 'details'),
                  SizedBox(
                    height: 2.h,
                  ),
                  STextFormField(
                    controller: _emailController,
                    icon: Icons.mail_rounded,
                    label: 'Email',
                    validator: (value) => _validator(value),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  STextFormField(
                    controller: _nameController,
                    icon: Icons.person_rounded,
                    label: 'Name',
                    validator: (value) => _validator(value),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  STextFormField(
                    controller: _passwordController,
                    icon: Icons.password_rounded,
                    label: 'Password',
                    validator: (value) => _validator(value),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  STextFormField(
                    controller: _confirmController,
                    icon: Icons.lock_rounded,
                    label: 'Confirm Password',
                    validator: (value) => _validator(value),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SButton(
                      text: 'Register',
                      onPressed: () {
                        Navigator.pushNamed(context, '/confirm_mail');
                      },
                      primaryColor: Utils.getColor('PBB')
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? _validator(String? value) {
    if (value != null) {
      return null;
    }
    return 'field cannot be empty';
  }
}
