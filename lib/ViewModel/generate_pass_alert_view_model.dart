import 'dart:async';

import 'package:beam_tv_1/Model/add_contact_data_model/add_contact_data_model.dart';
import 'package:beam_tv_1/Model/gate_pass_data_model/gate_pass_data_model.dart';
import 'package:beam_tv_1/data/response/api_response.dart';
import 'package:beam_tv_1/repo/pass_repo.dart';
import 'package:beam_tv_1/resources/utils.dart';
import 'package:flutter/material.dart';

import '../Model/user_contact_list_data_model/user_contact_list_data_model.dart';

class GeneratePassAlertViewModel with ChangeNotifier {
  final _addContactRepo = PassRepo();
  final __userContactListRepo = PassRepo();

  int _selectedEventIndex = -1;
  int get selectedEventIndex => _selectedEventIndex;

    int _selectedPassTypeIndex = -1;
  int get selectedPassTypeIndex => _selectedPassTypeIndex;


  int _selectedDurantionIndex = -1;
  int get selectedDurantionIndex => _selectedDurantionIndex;

  int _selectedVisitorIndex = -1;
  int get selectedVisitorIndex => _selectedVisitorIndex;

  



   ApiResponse<AddContactDataModel> _addContactList = ApiResponse.loading();
  ApiResponse<AddContactDataModel> get addContactList => _addContactList;
  
    bool _addContactloading = false;
  bool get addContactloading => _addContactloading;

 

  setAddContactLoading(bool value) {
    _addContactloading = value;
    print(_addContactloading);
    notifyListeners();
  }


  ApiResponse<UserContactListDataModel> _userContactList = ApiResponse.loading();
  ApiResponse<UserContactListDataModel> get userContactList => _userContactList;
  
    bool _userContactListloading = false;
  bool get userContactloading => _userContactListloading;

 

  // setuserContactListLoading(bool value) {
  //   _userContactListloading = value;
  //   print(_userContactListloading);
  //   notifyListeners();
  // }

  setSelectedEventIndex(int value) {
    _selectedEventIndex = value;
    notifyListeners();
  }

  setSelectedPassTypeIndex(int value){
    _selectedPassTypeIndex = value;
    notifyListeners();
  }

  setSelectedDurationIndex(int value){
    _selectedDurantionIndex = value;
    notifyListeners();
  }

  setSelectedVisitorIndex(int value){
    _selectedVisitorIndex = value;
    notifyListeners();
  }
 
  setAddContactList(ApiResponse<AddContactDataModel> response) {
    _addContactList = response;
    notifyListeners();
  }

  Future<void> fetchAddContactResponse(BuildContext context, Map data) async {
    setAddContactLoading(true);
    setAddContactList(ApiResponse.loading());
    _addContactRepo.fetchAddContactResponse(data).then((value) {
      setAddContactList(ApiResponse.completed(value));
      setAddContactLoading(false);

      Utils.snackBar(value.message.toString(), context);
      // Utils.snackBar('Change Password succesfully', context);
      Timer(Duration(seconds: 1), () {
      Navigator.pop(context);
      });
    }).onError((error, stackTrace) {
      // print(value);
      Utils.snackBar(error.toString(), context);
      setAddContactLoading(false);
      setAddContactList(ApiResponse.error(error.toString()));
    });
  }
 setUserContactList(ApiResponse<UserContactListDataModel> response) {
    _userContactList = response;
    notifyListeners();
  }

  Future<void> fetchUserContactListResponse(BuildContext context) async {
    setUserContactList(ApiResponse.loading());
    __userContactListRepo.fetchUserContactListResponse().then((value){
      setUserContactList(ApiResponse.completed(value));
      // Utils.snackBar('Change Password succesfully', context);
    
    }).onError((error, StackTrace){
      // Utils.snackBar(error.toString(), context);
      setUserContactList(ApiResponse.error(error.toString()));
    }
    );

  }


}
