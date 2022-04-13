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

  List<String> collegeNames = [
    "National Institute of Technology Kurukshetra",
    "National Institute of Technology Allahabad",
    "National Institute of Technology Allahabad",
    "National Institute of Technology Allahabad",
    "National Institute of Technology Allahabad",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.getColor('PB'),
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Utils.getColor('SB'),
        elevation: 10,
        child: Icon(
          Icons.arrow_forward_ios_sharp,
          size: 24.sp,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 2.w, top: 6.h),
              height: 40.sp,
              width: 40.sp,
              child: FloatingActionButton(
                onPressed: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back,
                  size: 25.sp,
                ),
                backgroundColor: Colors.transparent,
                // backgroundColor: Colors.white.withOpacity(0.25),
              ),
            ),
            Container(
              padding: Utils.screenPadding(),
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    const SText(
                      prefixText: 'choose your ',
                      suffixText: 'college',
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    DropDownSearch(
                      controller: _collegeController,
                      items: collegeNames,
                      hintText: 'College',
                    )
                    // const SText(
                    //     prefixText: 'did not find your college in list, don’t worry,\n',
                    //     suffixText: 'let stocio invite them :)')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
