import 'dart:async';
import 'dart:io';

import 'package:CommunityApp/Model/edit_profile_data_model/edit_profile_data_model.dart';
import 'package:CommunityApp/data/response/api_response.dart';
import 'package:CommunityApp/repo/edit_profile_repo.dart';
import 'package:CommunityApp/resources/components/loading.dart';
import 'package:CommunityApp/resources/local_data.dart';
import 'package:CommunityApp/resources/utils.dart';
import 'package:flutter/cupertino.dart';

// import 'package:flutter/foundation.dart';

class EditProfileViewModel with ChangeNotifier {
  File? _selectedImage;

  File? get selectedImage => _selectedImage;

  void setSelectedImage(File? image) {
    _selectedImage = image;
    notifyListeners();
  }

  final _editProfileRepo = EditProfileRepo();

  ApiResponse<EditProfileDataModel> _editProfileResponse =
      ApiResponse.loading();
  ApiResponse<EditProfileDataModel> get editProfileResponse =>
      _editProfileResponse;

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    print(_loading);
    notifyListeners();
  }

  setEditProfileResponse(ApiResponse<EditProfileDataModel> response) {
    _editProfileResponse = response;
    print(_editProfileResponse);
    print("reload");
    notifyListeners();
  }

  Future<void> fetchEditProfileResponse(
      BuildContext context, File imgFile, Map data) async {
    setLoading(true);
    setEditProfileResponse(ApiResponse.loading());
    _editProfileRepo
        .fetchEditProfileResponse(imgFile, data)
        .then((value) async {
      setLoading(false);
      LocalData ld = LocalData();
      await ld.saveProfile(value.data!.first.userProfile.toString());
      await ld.getTokenLocally();
      Utils.snackBar(value.message.toString(), context);
      Timer(Duration(seconds: 2), () {
        Navigator.pop(context);
      });
      setEditProfileResponse(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setLoading(false);

      setEditProfileResponse(ApiResponse.error(error.toString()));
      Utils.snackBar(_editProfileResponse.message.toString(), context);
    });
  }
}
