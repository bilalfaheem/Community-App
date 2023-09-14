import 'dart:async';

import 'package:beam_tv_1/Function/Navigation/navigate.dart';
import 'package:beam_tv_1/Model/add_contact_data_model/add_contact_data_model.dart';
import 'package:beam_tv_1/Model/generate_pass_data_model/generate_pass_data_model.dart';
import 'package:beam_tv_1/Model/user_contact_list_data_model/user_contact_list_data_model.dart';
import 'package:beam_tv_1/data/response/api_response.dart';
import 'package:beam_tv_1/repo/pass_repo.dart';
import 'package:beam_tv_1/resources/utils.dart';
import 'package:beam_tv_1/view/pass_detail_screen.dart';
import 'package:flutter/material.dart';

class GeneratePassViewModel with ChangeNotifier {
  final _passRepo = PassRepo();

  ApiResponse<UserContactListDataModel> _userContactList =
      ApiResponse.loading();
  ApiResponse<UserContactListDataModel> get userContactList => _userContactList;

  ApiResponse<AddContactDataModel> _addContactList = ApiResponse.loading();
  ApiResponse<AddContactDataModel> get addContactList => _addContactList;

  ApiResponse<GeneratePassDataModel> _generatePassResponse =
      ApiResponse.loading();
  ApiResponse<GeneratePassDataModel> get generatePassResponse =>
      _generatePassResponse;
  // GeneratePassViewModel() {
  //   initialize();
  // }
  bool _userContactListloading = false;
  bool get userContactloading => _userContactListloading;

  bool _addContactloading = false;
  bool get addContactloading => _addContactloading;

  bool _generatePassLoading = false;
  bool get generatePassLoading => _generatePassLoading;

  setAddContactLoading(bool value) {
    _addContactloading = value;
    notifyListeners();
  }

  setGeneratePassLoading(bool value) {
    _generatePassLoading = value;
    notifyListeners();
  }

  bool _contactField = false;
  bool get contactField => _contactField;

  int _selectedEventIndex = -1;
  int get selectedEventIndex => _selectedEventIndex;

  int _selectedPassTypeIndex = -1;
  int get selectedPassTypeIndex => _selectedPassTypeIndex;

  int _selectedDurantionIndex = -1;
  int get selectedDurantionIndex => _selectedDurantionIndex;

  int _selectedVisitorIndex = -1;
  int get selectedVisitorIndex => _selectedVisitorIndex;

  int _selectedContactIndex = -1;
  int get selectedContactIndex => _selectedContactIndex;

  void initialize() {
    print("Initializes");
    _contactField = false;
  }

  setStep(bool status) {
    _contactField = status;
    notifyListeners();
  }

  setSelectedEventIndex(int value) {
    _selectedEventIndex = value;
    notifyListeners();
  }

  setSelectedPassTypeIndex(int value) {
    _selectedPassTypeIndex = value;
    notifyListeners();
  }

  setSelectedDurationIndex(int value) {
    _selectedDurantionIndex = value;
    notifyListeners();
  }

  setSelectedVisitorIndex(int value) {
    _selectedVisitorIndex = value;
    notifyListeners();
  }

  setSelectedContactIndex(int value) {
    _selectedContactIndex = value;
    notifyListeners();
  }

  setAddContactList(ApiResponse<AddContactDataModel> response) {
    _addContactList = response;
    notifyListeners();
  }

  setGeneratePassResponse(ApiResponse<GeneratePassDataModel> response) {
    _generatePassResponse = response;
    notifyListeners();
  }

  setUserContactList(ApiResponse<UserContactListDataModel> response) {
    _userContactList = response;
    notifyListeners();
  }

  Future<void> fetchAddContactResponse(BuildContext context, Map data,
      GeneratePassViewModel generatePassViewModel) async {
    setAddContactLoading(true);
    setAddContactList(ApiResponse.loading());
    _passRepo.fetchAddContactResponse(data).then((value) {
      setAddContactList(ApiResponse.completed(value));
      setAddContactLoading(false);

      Utils.snackBar(value.message.toString(), context);
      // Utils.snackBar('Change Password succesfully', context);
      generatePassViewModel.fetchUserContactListResponse(context);
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

  Future<void> fetchUserContactListResponse(BuildContext context) async {
    print("fetch contact>>>>>>>>>>>>>>>>>>>>>>>>");
    setUserContactList(ApiResponse.loading());
    _passRepo.fetchUserContactListResponse().then((value) {
      setUserContactList(ApiResponse.completed(value));
      // Utils.snackBar('Change Password succesfully', context);
    }).onError((error, StackTrace) {
      // Utils.snackBar(error.toString(), context);
      print(error.toString());
      setUserContactList(ApiResponse.error(error.toString()));
    });
  }

  Future<void> fetchGeneratePassResponse(
      BuildContext context, dynamic data) async {
    setGeneratePassLoading(true);
    setGeneratePassResponse(ApiResponse.loading());
    _passRepo.fetchGeneratePassResponse(data).then((value) {
      setGeneratePassResponse(ApiResponse.completed(value));
      setGeneratePassLoading(false);

      Utils.snackBar(value.message.toString(), context);
      // Utils.snackBar('Change Password succesfully', context);
      // generatePassViewModel.fetchUserContactListResponse(context);
      Timer(Duration(seconds: 1), () {
        Navigator.pop(context);
        navigate(context, PassDetailScreen(data: value.data!,));
      });
    }).onError((error, stackTrace) {
      // print(value);
      Utils.snackBar(error.toString(), context);
      setGeneratePassLoading(false);
      setGeneratePassResponse(ApiResponse.error(error.toString()));
    });
  }
}
