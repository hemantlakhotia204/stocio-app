import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stocio_app/common/utils/utils.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final Duration _animationDuration = const Duration(milliseconds: 1500);
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  List<String> collegeNames = ["National Institute of Technology Kurukshetra"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          padding: Utils.screenPadding(),
          child: Form(
            key: _key,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    height: 100.h,
                    duration: _animationDuration,
                    child: Column(
                      children: [
                        SizedBox(height: 25.h,),
                        Text(
                          'choose your college',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: Utils.getColor('PT'),
                          ),
                        ),
                        SizedBox(height: 2.h,),
                        DropdownSearch<String>(
                          items: collegeNames,
                          showSearchBox: true,
                          mode: Mode.MENU,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
