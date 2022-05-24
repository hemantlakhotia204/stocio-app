import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stocio_app/common/utils/utils.dart';

class STextFormField extends StatefulWidget {

  final TextEditingController controller;
  final String? label;
  final IconData icon;
  final String? Function(String?) validator;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final bool? obscureText;


  const STextFormField({Key? key, required this.controller, this.label, required this.icon, required this.validator, this.focusNode, this.textInputType, this.obscureText}) : super(key: key);

  @override
  State<STextFormField> createState() => _STextFormFieldState();
}

class _STextFormFieldState extends State<STextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscuringCharacter: '*',
      keyboardType: widget.textInputType,
      obscureText: widget.obscureText ?? false,
      autocorrect: widget.obscureText ?? true,
      enableSuggestions: widget.obscureText ?? true,
      style: TextStyle(
        color: Utils.getColor(''),
        fontSize: 14.sp,
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
