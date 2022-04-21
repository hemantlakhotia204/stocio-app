import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stocio_app/common/utils/utils.dart';

class STextFormField extends StatefulWidget {

  final TextEditingController controller;
  final String? label;
  final IconData icon;
  final String? Function(String?) validator;
  final FocusNode? focusNode;


  const STextFormField({Key? key, required this.controller, this.label, required this.icon, required this.validator, this.focusNode}) : super(key: key);

  @override
  State<STextFormField> createState() => _STextFormFieldState();
}

class _STextFormFieldState extends State<STextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Utils.getColor(''),
        fontSize: 15.sp,
      ),
      controller: widget.controller,
      decoration: Utils.inputDecoration(
          label: widget.label ?? "",
          icon: Icon(
            widget.icon,
            size: 20.sp,
            color: Colors.white,
          )),
      validator: widget.validator,
      focusNode: widget.focusNode,
    );
  }
}
