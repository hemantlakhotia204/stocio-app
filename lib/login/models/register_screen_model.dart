import 'package:flutter/material.dart';
import 'package:stocio_app/common/models/institute_model.dart';
import 'package:stocio_app/login/services/institute_service.dart';

class RegisterScreenModel with ChangeNotifier {
  ///instance of list of institute model
  List<InstituteModel>? _institutes;

  ///instance of institute service class
  final InstituteService _instituteService = InstituteService();

  List<InstituteModel>? get institutes => _institutes;

  void getInstitutes() {
    //calling api to get all institutes
    _instituteService.getInstitutes().then((response) {

      //decoding data received from json
      if (response.statusCode == 200) {
        _institutes = List<InstituteModel>.from(
                response.data.map((data) => InstituteModel.fromJson(data)))
            .toList();
      }

      // updating all classes using this data
      notifyListeners();
    });
  }
}
