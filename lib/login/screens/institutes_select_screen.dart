import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:stocio_app/common/models/institute_model.dart';
import 'package:stocio_app/common/utils/utils.dart';
import 'package:stocio_app/common/widgets/dropdown_search.dart';
import 'package:stocio_app/common/widgets/s_ios_back.dart';
import 'package:stocio_app/common/widgets/s_text.dart';
import 'package:stocio_app/login/models/register_screen_model.dart';

class InstitutesSelectScreen extends StatefulWidget {
  const InstitutesSelectScreen({Key? key}) : super(key: key);

  @override
  State<InstitutesSelectScreen> createState() => _InstitutesSelectScreenState();
}

class _InstitutesSelectScreenState extends State<InstitutesSelectScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _instituteController = TextEditingController();

  List<String> instituteNames = [
    "National Institute of Technology Kurukshetra",
    "National Institute of Technology Allahabad",
  ];

  /// dummy instance of instituteModel
  InstituteModel institute = InstituteModel(instituteName: '', domainId: '');

  @override
  void initState() {
    super.initState();

    ///set provider for {getInstitutes()} api
    Provider.of<RegisterScreenModel>(context, listen: false).getInstitutes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        heroTag: 'Next',
        onPressed: () {
          /// validate for field before saving data
          if (_key.currentState!.validate()) {
            _key.currentState!.save();

            /// navigate to next screen with institute details as arguments
            debugPrint(institute.toJson().toString());
            Navigator.pushNamed(context, '/register', arguments: institute);
          }
        },
        backgroundColor: Utils.getColor('PB'),
        elevation: 10,
        child: Icon(
          Icons.keyboard_return_rounded,
          size: 22.sp,
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: Utils.bgGradient(),
        child: Consumer<RegisterScreenModel>(
          builder: (context, instituteModel, child) {
            /// get data from institute service.
            List<InstituteModel>? institutes = instituteModel.institutes;

            /// check if the data is valid and not empty
            if (institutes != null && institutes.isNotEmpty) {
              /// get institute names from object list to pass in dropDown widget
              List<String> names = [];
              for (var element in institutes) {
                names.add(element.instituteName);
              }
              instituteNames = names;

              /// return this widget if everything is ok
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SBack(),
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
                              suffixText: 'institute',
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            DropDownSearch(
                                controller: _instituteController,
                                items: instituteNames,
                                hintText: 'Institute',
                                validator: (String? value) {
                                  if (value == null) {
                                    return 'This field cannot be empty';
                                  }

                                  if (!instituteNames
                                      .asMap()
                                      .containsValue(value)) {
                                    return 'Institute not found';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  for (var element in institutes) {
                                    if (element.instituteName.toString() ==
                                        value.toString().trim()) {
                                      setState(() {
                                        institute = element;
                                      });
                                    }
                                  }
                                })
                            // const SText(
                            //     prefixText: 'did not find your college in list, don’t worry,\n',
                            //     suffixText: 'let stocio invite them :)')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              /// return this widget if there is some issue
              return const SizedBox(child: Text('Some error, try again'));
            }
          },
        ),
      ),
    );
  }
}
