import 'dart:async';

import 'package:beam_tv_1/Model/address_data_model/address_data_model.dart';
import 'package:beam_tv_1/data/response/api_response.dart';
import 'package:beam_tv_1/repo/signup_repo.dart';
import 'package:beam_tv_1/repo/tanker_req_repo.dart';
import 'package:beam_tv_1/resources/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../resources/local_data.dart';

class TankerAlertViewModel with ChangeNotifier {
  final tankerReqRepo = TankerReqRepo();

  bool _loading = false;
  bool get loading => _loading;

  bool _type = false;
  bool get type => _type;

  int _category = 0;
  int get category => _category;

  int _typeIndex = 0;
  int get typeIndex => _typeIndex;

  bool _swapType = false;
  bool get swapType => _swapType;

  bool _orderResponse = false;
  bool get orderResponse => _orderResponse;

  bool _orderResponseStatus = false;
  bool get orderResponseStatus => _orderResponseStatus;

  String _orderResponseMsg = "";
  String get orderResponseMsg => _orderResponseMsg;

  List<String> categoryList = ["Quota", "Cash", "Swap"];

  // TankerAlertViewModel({bool initialType = false}) {
  //   setType(initialType);
  // }
  initializeType() {
    _type = false;
    _category = 0;
    _typeIndex = 0;
    _swapType = false;
    _orderResponse = false;
    _orderResponseStatus = false;
  }

  setOrderResponse(bool value, bool responseStatus, String msg) {
    _orderResponse = value;
    _orderResponseStatus = responseStatus;
    _orderResponseMsg = msg;
    notifyListeners();
  }

  setLoading(bool value) {
    _loading = value;
    print(_loading);
    notifyListeners();
  }

  setType(bool value, int index) {
    print(value);
    print(index);

    _type = value;
    setCategory(index);

    // notifyListeners();
    // Timer(const Duration(milliseconds: 0), () {
    //   _type = value;
    //   notifyListeners();
    // });
    //  _category = index;
  }

  Future<void> fetchReqTankerReponse(BuildContext context, dynamic data) async {
    setLoading(true);

    tankerReqRepo.fetchTankerReqReponse(data).then((value) {
      print(value);
      setLoading(false);
      //  final userPreference = Provider.of<UserViewModel>(context, listen: false);
      // userPreference.saveUser(UserModel(token: value['token'].toString()));
      print("Value$value");
      if (value.success.toString() == "false") {
        setOrderResponse(true, false, value.message.toString());
      } else if (value.success.toString() == "true") {
        setOrderResponse(true, true, value.message.toString());
      }
      // setOrderResponse(true);
      // Utils.snackBar('Requested Tanker Successfully', context);
      // Timer(Duration(seconds: 2), () {
      //   navigate(context, NavBarScreen());
      // });
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      setOrderResponse(true, false, error.toString());
      Utils.snackBar(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  ApiResponse<AddressDataModel> _addressList = ApiResponse.loading();
  ApiResponse<AddressDataModel> get addressList => _addressList;

  setAddressList(ApiResponse<AddressDataModel> response) {
    _addressList = response;
    print(_addressList);
    print("relaod");
    notifyListeners();
  }

  Future<void> fetchAddressList() async {
    Map<String, String> data = {"socityId": LocalData.societyId};
    setAddressList(ApiResponse.loading());
    tankerReqRepo.fetchAddressList(data).then((value) {
      // print(value);
      setAddressList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setAddressList(ApiResponse.error(error.toString()));
    });
  }

  String getAddressId(String add) {
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

  setTypeIndex(int index) {
    _typeIndex = index;
    notifyListeners();
    print("TypeIndex$_typeIndex");
  }

  setCategory(int index) {
    _category = index;
    notifyListeners();
    print("Category$_category");
  }

  setSwapType(bool value) {
    _swapType = value;
    notifyListeners();
  }

  String getType() {
    switch (category) {
      case 1:
        return getIndexType();
      case 2:
        return "Cash ${getIndexType()}";
      case 3:
        return "Swap ${getIndexType()}";
      default:
        return "Unknown";
    }
  }

  String getIndexType() {
    switch (typeIndex) {
      case 1:
        return "Single Tanker";
      case 2:
        return "Double Tanker";
      default:
        return "Unknown";
    }
  }
}
