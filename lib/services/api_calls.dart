import 'package:assignment/global/global.dart';
import 'package:assignment/models/place_model.dart';
import 'package:assignment/provider_base/provider_helper.dart';
import 'package:assignment/provider_base/provider_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

abstract class ApiCalls {
//Available Astrologer API call.
  static Future<ProviderResponse<Map<String, dynamic>>>
      astrologerApiData() async {
    bool netCheck = await internetCheck();
    if (!netCheck) {
      ProviderResponse<Map<String, dynamic>> data = ProviderResponse(
        ProviderState.noInternet,
        ProviderEvent.astrologer,
        data: {},
        statusCode: 400,
        message: "No Internet Available",
      );
      return data;
    }
    var client = http.Client();
    Uri url = Uri.parse('https://www.astrotak.com/astroapi/api/agent/all');
    var response = await client.get(url);
    if (response.statusCode == 200) {
      ProviderResponse<Map<String, dynamic>> data = ProviderResponse(
        ProviderState.success,
        ProviderEvent.astrologer,
        data: json.jsonDecode(response.body),
        statusCode: response.statusCode,
        message: "Data Fetch Scuccessfully",
      );
      client.close();
      return data;
    }
    ProviderResponse<Map<String, dynamic>> data = ProviderResponse(
      ProviderState.failed,
      ProviderEvent.astrologer,
      data: {},
      statusCode: response.statusCode,
      message: "Error Fetching data",
    );
    return data;
  }

//Get Location API call
  static Future<List<PlaceModel>> getLocationSuggestion(String location) async {
    bool netCheck = await internetCheck();
    if(!netCheck){
      return [];
    }
    Uri url = Uri.https('www.astrotak.com', "/astroapi/api/location/place",
        {'inputPlace': location});
    var client = http.Client();
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var jsonData = json.jsonDecode(response.body);
      List<PlaceModel> dataList = [];
      if (jsonData["data"] != null) {
        dataList = List<PlaceModel>.from(
            jsonData["data"].map((x) => PlaceModel.fromJson(x)));
      }
      client.close();
      return dataList;
    }
    return [];
  }

//Panchang data API call.
  static Future<ProviderResponse<Map<String, dynamic>>> panchangDataApiCall(
      Map<String, dynamic> bodyParams) async {
    bool isConnected = await internetCheck();
    if (!isConnected) {
      return ProviderResponse(
        ProviderState.noInternet,
        ProviderEvent.panchang,
        data: {},
        statusCode: 400,
        message: "No Internet Available",
      );
    }
    var client = http.Client();
    Uri uri = Uri.parse(
        "https://www.astrotak.com/astroapi/api/horoscope/daily/panchang");

    var body = json.jsonEncode(bodyParams);
    var response = await client
        .post(uri, body: body, headers: {"Content-Type": "application/json"});
    printDebug(response.body);
    client.close();
    if (response.statusCode == 200) {
      return ProviderResponse(
        ProviderState.success,
        ProviderEvent.panchang,
        statusCode: 200,
        message: "Data fetched successfully",
        data: json.jsonDecode(response.body),
      );
    }
    return ProviderResponse(
      ProviderState.failed,
      ProviderEvent.panchang,
      statusCode: 400,
      message: "Error fetching data",
      data: {},
    );
  }
}
