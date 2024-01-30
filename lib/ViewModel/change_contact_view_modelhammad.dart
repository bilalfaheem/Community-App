import 'dart:async';
import 'package:CommunityApp/data/response/api_response.dart';
import 'package:CommunityApp/resources/local_data.dart';
import 'package:flutter/material.dart';
import '../Model/edit_contact_data_model/edit_contact_data_model.dart';
import '../repo/edit_contact_repohammad.dart';
import '../resources/utils.dart';

class ChangeContactViewModel with ChangeNotifier {
  final _editContactRepo = EditContactRepo();

  ApiResponse<EditContactDataModel> _editContactList = ApiResponse.loading();
  ApiResponse<EditContactDataModel> get editContactList => _editContactList;

  bool _loading = false;
  bool get loading => _loading;

  setInitLoading() {
    _loading = false;
  }

  setLoading(bool value) {
    _loading = value;
    print(_loading);
    notifyListeners();
  }

  setEditContactList(ApiResponse<EditContactDataModel> response) {
    _editContactList = response;
    print(_editContactList);
    print("relaod");
    notifyListeners();
  }

  Future<void> fetchEditContactList(BuildContext context, Map data) async {
    setLoading(true);
    setEditContactList(ApiResponse.loading());
    _editContactRepo.fetchEditContactList(data).then((value) async {
      LocalData ld = LocalData();
      await ld.saveContactLocally(value.data!.first.contact.toString());
      await ld.getTokenLocally();
      setLoading(false);
      print(value);
      Utils.snackBar(value.message.toString(), context);
      Timer(Duration(seconds: 2), () {
        Navigator.pop(context);
      });
      setEditContactList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setLoading(false);

      setEditContactList(ApiResponse.error(error.toString()));
      Utils.snackBar(_editContactList.message.toString(), context);
    });
  }
}
