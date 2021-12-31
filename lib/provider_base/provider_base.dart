import 'package:assignment/provider_base/provider_helper.dart';
import 'package:assignment/provider_base/provider_response.dart';
import 'package:flutter/material.dart';

class ProviderBase with ChangeNotifier {
  ProviderResponse _providerResponse;
  ProviderResponse _previousResponse;

  /// get the current state of the api response
  ProviderState get state => _providerResponse?.state ?? ProviderState.none;

  /// get the previous state of the api response
  ProviderState get previousState =>
      _previousResponse?.state ?? ProviderState.none;

  /// get the api event
  ProviderEvent get event => _providerResponse?.event ?? ProviderEvent.none;

  /// get the previous event of the api response
  ProviderEvent get previousEvent =>
      _previousResponse?.event ?? ProviderEvent.none;

  ///get the response data
  get data => _providerResponse.data;

  ///get the previous response data
  get previousData => _previousResponse?.data;

  ///get the message of the api response
  String get message => _providerResponse?.message ?? '';

  ///get the previous message of the api response
  String get previousMessage => _previousResponse?.message ?? '';

  ///get the status code of the api response
  int get statusCode => _providerResponse?.statusCode;

  ///get the previous status code of the api response
  int get previousStatusCode => _previousResponse?.statusCode;

  /// get the complete api response
  ProviderResponse get response => _providerResponse;

  /// get the previous api response
  ProviderResponse get previousResponse => _previousResponse;

  ///called when api state changes to loading
  void onLoad() {}

  ///called when api state changes to no-internet
  void onNoInternet() {}

  ///called when api state changes to success
  void onSuccess() {}

  ///called when api state changes to failed
  void onFailed() {}

  void changeState(ProviderResponse response) {
    if (_providerResponse?.state == response?.state &&
        _providerResponse?.event == response?.event) return;
    _previousResponse = _providerResponse;
    _providerResponse = response;

    try {
      notifyListeners();
    } catch (e) {}
  }

  void onCallbackComplete() {
    _previousResponse = _providerResponse;
  }
}
