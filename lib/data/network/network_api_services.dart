import 'dart:convert';
import 'dart:io';
import 'package:beam_tv_1/data/app_excaptions.dart';
import 'package:beam_tv_1/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, data) async {
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: data);
      // .timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseErrorJson = jsonDecode(response.body);
        throw ErrorMsgException(responseErrorJson["message"]);
      // throw BadRequestException(response.body.toString());
      case 401:
        dynamic responseErrorJson = jsonDecode(response.body);
        throw ErrorMsgException(responseErrorJson["message"]);
      // throw UnauthorizedException(jsonDecode(response.body));
      case 404:
        // throw BadRequestException(response.body.toString());
        dynamic responseErrorJson = jsonDecode(response.body);
        throw ErrorMsgException(responseErrorJson["message"]);
      case 403:
        dynamic responseErrorJson = jsonDecode(response.body);
        throw ErrorMsgException(responseErrorJson["message"]);
      //  UnauthorizedException(response.body.toString());
      default:
        throw FetchDataException(
            "Error accured while communication with server" +
                "with status code" +
                response.statusCode.toString());
    }
  }
}
