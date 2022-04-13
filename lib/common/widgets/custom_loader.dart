import 'package:flutter/material.dart';
import 'package:stocio_app/common/utils/utils.dart';

class CustomLoader extends StatefulWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  State<CustomLoader> createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: Center(
        child: LinearProgressIndicator(
          color: Utils.getColor("PBB"),
        ),
      ),
    );
  }
}

