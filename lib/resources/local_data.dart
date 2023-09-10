import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static String _lid = "";
  static String get id => _lid;

  static String _ltoken = "";
  static String get token => _ltoken;

  static String _lname = "";
  static String get name => _lname;

  static String _laddress = "";
  static String get address => _laddress;
  static String _laddressId = "";
  static String get addressId => _laddressId;

  static String _lcnic = "";
  static String get cnic => _lcnic;

  static String _lphone = "";
  static String get phone => _lphone;

  static String _lsociety = "";
  static String get society => _lsociety;

  static setlValues(String id, String token, String name, String address,
      String addressId, String cnic, String phone, String society) {
    _lid = id;
    _ltoken = token;
    _lname = name;
    _laddress = address;
    _laddressId = addressId;
    _lcnic = cnic;
    _lphone = phone;
    _lsociety = society;
  }

  String _kid = "kid";
  String _token = 'token';
  String _name = 'name';
  String _address = 'address';
  String _addressId = 'kaddressId';
  String _cnic = "kcnic";
  String _kphone = "kphone";
  String _ksociety = "ksociety";
// Future<void> saveDataLocally(Data? data) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String jsonData = jsonEncode(data);
//   prefs.setString('data', jsonData);
// }

  Future<void> saveTokenLocally(
      String id,
      String token,
      String name,
      String address,
      String addressId,
      String cnic,
      String phone,
      String society) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_kid, id);
    prefs.setString(_token, token);
    prefs.setString(_name, name);
    prefs.setString(_address, address);
    prefs.setString(_addressId, addressId);
    prefs.setString(_cnic, cnic);
    prefs.setString(_kphone, phone);
    prefs.setString(_ksociety, society);
  }

  Future<void> saveContactLocally(String phone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(_kphone, phone);
  }

  Future<String?> getTokenLocally() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? i = prefs.getString(_kid);
    String? t = prefs.getString(_token);
    String? n = prefs.getString(_name);
    String? a = prefs.getString(_address);
    String? ai = prefs.getString(_addressId);
    String? c = prefs.getString(_cnic);
    String? p = prefs.getString(_kphone);
    String? s = prefs.getString(_ksociety);
    setlValues(i.toString(), t.toString(), n.toString(), a.toString(),
        ai.toString(), c.toString(), p.toString(), s.toString());
    // return prefs.getString('token');
  }

//  getDataLocally() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? jsonData = prefs.getString('data');
//   if (jsonData != null) {
//     Data data = jsonDecode(jsonData);
//     return data;
//   }
//   return null;
// }
}

// void saveLoginDataToSharedPreferences(LoginDataModel loginData) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String jsonString = loginData.toJson().toString();
//   await prefs. setString('login_data', jsonString);
// }

// Future<LoginDataModel?> getLoginDataFromSharedPreferences() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? jsonString = prefs.getString('login_data');
//   if (jsonString != null) {
//     Map<String, dynamic> json = Map<String, dynamic>.from(jsonString as Map);
//     return LoginDataModel.fromJson(json);
//   } else {
//     return null;
//   }
// }
