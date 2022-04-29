import 'package:flutter/material.dart';
import 'package:stocio_app/common/models/institute_model.dart';
import 'package:stocio_app/login/services/institute_service.dart';

class RegisterScreenModel with ChangeNotifier {
  List<InstituteModel>? _institutes;
  final InstituteService _instituteService = InstituteService();

  List<InstituteModel>? get institutes => _institutes;

  void getInstitutes() {
    _instituteService.getInstitutes().then((response) {
      _institutes = List<InstituteModel>.from(
          response.data.map((data) => InstituteModel.fromJson(data))).toList();
      debugPrint(institutes.toString());
      notifyListeners();
    });

  }
}
