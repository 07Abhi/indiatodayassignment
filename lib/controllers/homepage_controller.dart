import 'package:assignment/models/panchang_model.dart';
import 'package:assignment/provider_base/provider_base.dart';
import 'package:assignment/provider_base/provider_helper.dart';
import 'package:assignment/provider_base/provider_response.dart';
import 'package:assignment/services/api_calls.dart';

class HomePageController extends ProviderBase {
  Panchang _panchangModel;
  Panchang get responseModel => _panchangModel;
  fetchPanchangDateData(Map<String, dynamic> bodyParams) async {
    changeState(
      ProviderResponse(ProviderState.loading, ProviderEvent.panchang),
    );
    var response = await ApiCalls.panchangDataApiCall(bodyParams);
    if (response.state == ProviderState.success) {
      _panchangModel = Panchang.fromJson(response.data["data"]);
    }
    changeState(response);
  }
}
