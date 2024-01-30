// import 'dart:async';
// import 'dart:io';

// import 'package:CommunityApp/Model/edit_profile_data_model/edit_profile_data_model.dart';
// import 'package:CommunityApp/data/response/api_response.dart';
// import 'package:CommunityApp/repo/edit_profile_repo.dart';
// import 'package:CommunityApp/resources/components/loading.dart';
// import 'package:CommunityApp/resources/utils.dart';
// import 'package:flutter/cupertino.dart';

// // import 'package:flutter/foundation.dart';

// class ImageViewModel with ChangeNotifier {
//   File? selectedImage;

//   File? get _selectedImage => selectedImage;

//   void setSelectedImage(File? image) {
//     selectedImage = image;
//     notifyListeners();
//   }

//   final _editProfileRepo = EditProfileRepo();

//   ApiResponse<EditProfileDataModel> _editProfileList = ApiResponse.loading();
//   ApiResponse<EditProfileDataModel> get editProfileList => _editProfileList;

//   bool _loading = false;
//   bool get loading => _loading;

//   setLoading(bool value) {
//     _loading = value;
//     print(_loading);
//     notifyListeners();
//   }

//   setEditProfileList(ApiResponse<EditProfileDataModel> response) {
//     _editProfileList = response;
//     print(_editProfileList);
//     print("reload");
//     notifyListeners();
//   }

//   Future<void> fetchEditProfileList(BuildContext context, Map data) async {
//     setLoading(true);
//     setEditProfileList(ApiResponse.loading());
//     _editProfileRepo.fetchEditProfileList(data).then((value) async {
//       setLoading(false);
//       print(value);
//       Utils.snackBar(value.message.toString(), context);
//       Timer(Duration(seconds: 2), () {
//         Navigator.pop(context);
//       });
//       setEditProfileList(ApiResponse.completed(value));
//     }).onError((error, stackTrace) {
//       setLoading(false);

//       setEditProfileList(ApiResponse.error(error.toString()));
//       Utils.snackBar(_editProfileList.message.toString(), context);
//     });
//   }
// }
