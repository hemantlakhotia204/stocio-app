import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SIconButton extends StatefulWidget {
  final Icon icon;
  final void Function() onPressed;
  final void Function()? onLongPress;
  final Color? backgroundColor;
  final Size? size;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;

  const SIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.onLongPress,
    this.backgroundColor,
    this.size,
    this.borderRadius,
    this.padding,

  }) : super(key: key);

  @override
  State<SIconButton> createState() => _SIconButtonState();
}

class _SIconButtonState extends State<SIconButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      onLongPress: widget.onLongPress,
      child: Container(
        alignment: Alignment.center,
        padding: widget.padding,
        constraints: BoxConstraints.expand(
            width: widget.size != null ? widget.size!.width : 10.w,
            height: widget.size != null ? widget.size!.height : 10.w),
        decoration: BoxDecoration(
            borderRadius:
                widget.borderRadius ?? BorderRadius.all(Radius.circular(2.w)),
            color: widget.backgroundColor,
            boxShadow: (widget.backgroundColor != null || widget.backgroundColor == Colors.transparent)
                ? const [
                    BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 0.5,
                        blurRadius: 2,
                        offset: Offset(3, 3))
                  ]
                : null),
        child: widget.icon,
      ),
    );
  }
}
