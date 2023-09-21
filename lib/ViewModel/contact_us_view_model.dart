


import 'package:beam_tv_1/Model/contact_us_data_model/contact_us_data_model.dart';
import 'package:beam_tv_1/data/response/api_response.dart';
import 'package:beam_tv_1/data/response/api_response.dart';
import 'package:beam_tv_1/resources/components/security_alert.dart';
import 'package:flutter/material.dart';

import '../data/response/api_response.dart';
import '../repo/contact_us_repo.dart';

class ContactUsViewModel with ChangeNotifier{

  final _contactUsRepo = ContactUsrepo();

  ApiResponse<ContactUsDataModel> _contactUsList = ApiResponse.loading();

  ApiResponse<ContactUsDataModel> get contactUsList => _contactUsList;


  setContactusList(ApiResponse<ContactUsDataModel> response){
    _contactUsList= response;
    print(_contactUsList);
    notifyListeners();
  }

Future<void> fetchContactUsList() async {
  setContactusList(ApiResponse.loading());
  _contactUsRepo.fetchContactUsList().then((value){
    print(value);
    setContactusList(ApiResponse.completed(value));
  }).onError((error, StackTrace){
    setContactusList(ApiResponse.error(error.toString()));
  });
}

}