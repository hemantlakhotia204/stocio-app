import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SIconButton extends StatefulWidget {
  final Icon icon;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Size? size;

  const SIconButton(
      {Key? key,
      required this.icon,
      required this.onPressed,
      this.backgroundColor,
      this.size})
      : super(key: key);

  @override
  State<SIconButton> createState() => _SIconButtonState();
}

class _SIconButtonState extends State<SIconButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        constraints: BoxConstraints.tight(widget.size ?? Size(10.w, 10.w)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(2.w)),
            color: widget.backgroundColor,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 0.5,
                  blurRadius: 2,
                  offset: Offset(3, 3))
            ]
        ),
        child: widget.icon,
      ),
    );
  }
}
