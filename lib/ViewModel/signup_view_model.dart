import 'dart:convert';

import 'package:CommunityApp/Function/Navigation/navigate.dart';
import 'package:CommunityApp/Model/address_data_model/datum.dart';
import 'package:CommunityApp/Model/society_data_model/society_data_model.dart';
import 'package:CommunityApp/Model/unregistered_address_data_model/unregistered_address_data_model.dart';
import 'package:CommunityApp/data/app_excaptions.dart';
import 'package:CommunityApp/data/response/api_response.dart';
import 'package:CommunityApp/repo/signup_repo.dart';
import 'package:CommunityApp/resources/utils.dart';
import 'package:CommunityApp/view/signup_successfull_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignupViewModel with ChangeNotifier {
  final signupRepo = SignupRepo();

  static String _projectId = "";
  static String get projectId => _projectId;

  static String _addressId = "";
  static String get addressId => _addressId;

  // bool _loading = false;
  // bool get loading => _loading;

  ApiResponse<SocietyDataModel> _societyList = ApiResponse.loading();
  ApiResponse<SocietyDataModel> get societyList => _societyList;

  ApiResponse<UnregisteredAddressDataModel> _addressList =
      ApiResponse.loading();
  ApiResponse<UnregisteredAddressDataModel> get addressList => _addressList;

  // setLoading(bool value) {
  //   _loading = value;
  //   print(_loading);
  //   notifyListeners();
  // }

  setSliderLoading(BuildContext context, bool value, classs) {
    // SliderProvider sliderProvider =
    //     Provider.of<SliderProvider>(context, listen: false);
    classs.setLoadings(value);
  }

  setSocietyList(ApiResponse<SocietyDataModel> response) {
    _societyList = response;
    print(_societyList);
    print("relaod");
    notifyListeners();
  }

  setAddressList(ApiResponse<UnregisteredAddressDataModel> response) {
    _addressList = response;
    print(_addressList);
    print("relaod");
    notifyListeners();
  }

  Future<void> fetchSocietyList() async {
    setSocietyList(ApiResponse.loading());
    signupRepo.fetchSocietyList().then((value) {
      print(value);
      setSocietyList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setSocietyList(ApiResponse.error(error.toString()));
    });
  }

  Future<void> fetchUnregisteredAddressList() async {
    setAddressList(ApiResponse.loading());
    signupRepo.fetchUnregisteredAddressList(projectId).then((value) {
      // print(value);
      setAddressList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setAddressList(ApiResponse.error(error.toString()));
    });
  }

  // Future<void> fetchAddressList() async {
  //   Map<String, String> data = {"socityId": projectId};
  //   setAddressList(ApiResponse.loading());
  //   signupRepo.fetchAddressList(data).then((value) {
  //     // print(value);
  //     setAddressList(ApiResponse.completed(value));
  //   }).onError((error, stackTrace) {
  //     setAddressList(ApiResponse.error(error.toString()));
  //   });
  // }

  setProjectId(String id) {
    _projectId = id;
    print("$_projectId project id");
    print("${SignupViewModel._projectId} project id");
    fetchUnregisteredAddressList();
    // notifyListeners()
  }

  String getSocietyId(String pp) {
    final project = _societyList.data!.data;
    for (var i in project!) {
      if (i.projectTitle!.toLowerCase() == pp.toLowerCase()) {
        return i.id.toString();
      }
    }
    return "";
  }

  setAddressId(String id) {
    _addressId = id;
    print("$_addressId Address id");
    // print("${SignupViewModel._addressId} Adress id");
    // notifyListeners()
  }

  String getAddressId(String add) {
    print("$_projectId project id in get address");
    print(_addressList.data);
    var addressData = _addressList.data!.data;
    if (addressData == null) {
      addressData = [];
    }
    print("address data$addressData");
    for (var i in addressData) {
      if (i.address!.toLowerCase() == add.toLowerCase()) {
        return i.id.toString();
      }
    }
    return "";
  }

  static Future<List<Datum>> getUnRegisteredAddresses(String query) async {
    if (_projectId != "") {
      final url = Uri.parse(AppUrl.unRegisteredAddressUrl + _projectId);
      final response = await http.get(url);
      SignupViewModel svm = SignupViewModel();
      if (response.statusCode == 200) {
        var dat = {"socityId": _projectId};
        // svm.fetchAddressList();
        var res = json.decode(response.body);
        final List responseData = res["data"];
        print(responseData);
        if (responseData.length == 0) {
          print("nulllllllllllllllllllllllllllllllllllllllll");
          throw NoDataException("");
        } else {
          return responseData
              .map((json) => Datum.fromJson(json))
              .where((iteration) {
            final i = iteration.address?.toLowerCase();
            final queryLower = query.toLowerCase();
            return i!.contains(queryLower);
          }).toList();
        }
      } else {
        throw Exception("else");
      }
    } else {
      print("select society");
      throw AppException("Select Society", "");
    }
  }

  Future<bool> fetchsignUpReponse(
      BuildContext context, dynamic data, classs) async {
    // setLoading(true);
    setSliderLoading(context, true, classs);
    signupRepo.fetchSignupResponse(data).then((value) async {
      print(value);
      // setLoading(false);
      setSliderLoading(context, false, classs);
      print("Value$value");
      // Utils.snackBar(value.message.toString(), context);
      navigatePushReplace(
          context, SignupSuccessfullScreen(msg: value.message.toString()));
      // Timer(Duration(seconds: 2), () {
      //   navigate(context, NavBarScreen());
      // });

      if (kDebugMode) {
        print(value.toString());
      }
      return true;
    }).onError((error, stackTrace) {
      // setLoading(false);
      setSliderLoading(context, false, classs);
      Utils.snackBar(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
      return false;
    });
    return false;
  }
}

//   setSocietyList(ApiResponse<UnregisteredAddressDataModel> response) {
//   _societyList = response;
//   print(_societyList);
//   print("relaod");
//   notifyListeners();
// }

// // fetSocietyList(ApiResponse<UnregisteredAddressDataModel> response) {}
// Future<void> fetchSocietyList() async {
//   setSocietyList(ApiResponse.loading());
//   signupRepo.fetchSocietyList().then((value) {
//     print(value);
//     setSocietyList(ApiResponse.completed(value));
//   }).onError((error, stackTrace) {
//     setSocietyList(ApiResponse.error(error.toString()));
//   });
// }
