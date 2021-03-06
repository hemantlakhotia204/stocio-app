import 'package:flutter/material.dart';
import 'package:stocio_app/common/models/institute_model.dart';
import 'package:stocio_app/common/models/s_response.dart';
import 'package:stocio_app/common/models/user_model.dart';
import 'package:stocio_app/common/utils/utils.dart';
import 'package:sizer/sizer.dart';
import 'package:stocio_app/common/widgets/s_button.dart';
import 'package:stocio_app/common/widgets/s_ios_back.dart';
import 'package:stocio_app/common/widgets/s_loader.dart';
import 'package:stocio_app/common/widgets/s_text.dart';
import 'package:stocio_app/common/widgets/s_text_form_field.dart';
import 'package:stocio_app/login/services/register_service.dart';

class FormScreen extends StatefulWidget {
  ///Institute details passed from register_screen
  final InstituteModel? arguments;

  const FormScreen({Key? key, this.arguments}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  ///controllers for the form fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _confirmController = TextEditingController();

  ///focus nodes for the form fields
  final FocusNode _emailNode = FocusNode();
  final FocusNode _nameNode = FocusNode();
  final FocusNode _passNode = FocusNode();
  final FocusNode _confirmNode = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey();
  final RegisterService registerService = RegisterService();

  late SLoader loader = SLoader(context: context);

  @override
  Widget build(BuildContext context) {
    String? abbr = widget.arguments?.abbr;
    String _welcomeText = "$abbr and Stocio \nwelcomes you 😁.";

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Utils.getColor('PB'),
      body: GestureDetector(
        onTap: () {
          _emailNode.unfocus();
          _nameNode.unfocus();
          _passNode.unfocus();
          _confirmNode.unfocus();
        },
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                        height: 2.h,
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
                        height: 6.h,
                      ),
                      const SText(
                          prefixText: 'enter your ', suffixText: 'details👇'),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: STextFormField(
                              controller: _emailController,
                              icon: Icons.mail_rounded,
                              label: 'Email',
                              validator: (value) => _validator(value),
                              focusNode: _emailNode,
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Expanded(
                            child: Text(
                              widget.arguments!.domainId,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      STextFormField(
                        textInputType: TextInputType.text,
                        controller: _nameController,
                        icon: Icons.person_rounded,
                        label: 'Name',
                        validator: (value) => _validator(value),
                        focusNode: _nameNode,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      STextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        icon: Icons.password_rounded,
                        label: 'Password',
                        validator: (value) => _validator(value),
                        focusNode: _passNode,
                      ),
                      // SizedBox(
                      //   height: 2.h,
                      // ),
                      // STextFormField(
                      //   controller: _confirmController,
                      //   icon: Icons.lock_rounded,
                      //   label: 'Confirm Password',
                      //   validator: (value) => _validator(value),
                      //   focusNode: _confirmNode,
                      // ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SButton(
                            text: 'Register',
                            onPressed: _handleRegisterUser,
                            primaryColor: Utils.getColor('PBB')),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///validator for the form fields
  String? _validator(String? value) {
    if (value != null) {
      return null;
    }
    return 'field cannot be empty';
  }

  ///handle register user
  _handleRegisterUser() async {
    var state = _formKey.currentState;
    if (state != null) {
      ///validate state of form
      if (state.validate()) {
        loader.showLoaderDialog();

        UserModel user = UserModel(
            name: _nameController.text.trim(),
            email: _emailController.text.trim(),
            instituteRef: widget.arguments!.id!.trim(),
            password: _passwordController.text.trim());

        try {
          SResponse res = await registerService.registerUser(user);
          if (res.code == 200) {
            Navigator.pushNamed(context, '/confirm_mail');
          }
        } catch (e) {
          debugPrint(e.toString());
          Utils.handleError(e, context);
        }
        loader.hideLoader();
      }
    }
  }
}
