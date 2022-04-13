import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stocio_app/common/utils/utils.dart';
import 'package:stocio_app/common/widgets/dropdown_search.dart';
import 'package:stocio_app/common/widgets/s_text.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _collegeController = TextEditingController();

  List<String> collegeNames = ["National Institute of Technology Kurukshetra", "National Institute of Technology Allahabad"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.getColor('PB'),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          padding: Utils.screenPadding(),
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 3.h,),
                SizedBox(
                  height: 40.sp,
                  width: 40.sp,
                  child: FloatingActionButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back),
                    backgroundColor: Colors.white.withOpacity(0.25),
                  ),
                ),
                SizedBox(height: 10.h,),
                const SText(
                  prefixText: 'choose your ',
                  suffixText: 'college',
                ),
                SizedBox(
                  height: 4.h,
                ),
                DropDownSearch(controller: _collegeController,items: collegeNames, hintText: 'College',)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
