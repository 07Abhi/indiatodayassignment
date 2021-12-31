import 'package:assignment/app_utils/app_colors.dart';
import 'package:assignment/app_utils/app_strings.dart';
import 'package:assignment/app_utils/app_styles.dart';
import 'package:assignment/controllers/homepage_controller.dart';
import 'package:assignment/global/global.dart';
import 'package:assignment/models/place_model.dart';
import 'package:assignment/provider_base/provider_consumer.dart';
import 'package:assignment/provider_base/provider_helper.dart';
import 'package:assignment/screen/widgets/custom_appbar.dart';
import 'package:assignment/screen/widgets/panchang_block.dart';
import 'package:assignment/screen/widgets/panchang_header.dart';
import 'package:assignment/services/api_calls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _locationEditingController =
      TextEditingController();
  final FocusNode _locationNode = FocusNode();
  String _selectedDateString = formatDate(DateTime.now());
  DateTime _pickedDateCal = DateTime.now();
  String _locationId = "";
  _pickedDate() async {
    DateTime date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (date != null) {
      setState(() {
        _selectedDateString = formatDate(date);
        _pickedDateCal = date;
      });
    }
  }

  _getBody() {
    return ProviderConsumer<HomePageController>(
      defaultView: (context, provider, child) => _getDefaultView(provider),
      loadingView: (context, provider, child) {
        if (provider.event == ProviderEvent.panchang) {
          return _getLodingView();
        }
        return _getDefaultView(provider);
      },
      failedView: (context, provider, child) {
        return failedView(retryFunction: () {
          provider.fetchPanchangDateData(
              bodyPara(dateTime: _pickedDateCal, placeId: _locationId));
        });
      },
      noInternetView: (context, provider, child) {
        return noInternetWork(
          noInternet: () {
            provider.fetchPanchangDateData(
              bodyPara(dateTime: _pickedDateCal, placeId: _locationId),
            );
          },
        );
      },
    );
  }

  _getLodingView() {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(AppColors.baseOrange),
      ),
    );
  }

  Widget _dateAndLocation(HomePageController provider) {
    return Container(
      height: 140.h,
      padding: const EdgeInsets.only(left: 20.0),
      width: MediaQuery.of(context).size.width,
      color: AppColors.orangefaded.withOpacity(0.4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.date,
                    style: AppStyles.black14Regular.copyWith(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    AppStrings.location,
                    style: AppStyles.black14Regular.copyWith(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10.0),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      _pickedDate();
                    },
                    child: Container(
                      height: 45.0,
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      width: MediaQuery.of(context).size.width * 0.65,
                      color: AppColors.whiteColor,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              _selectedDateString,
                              style: AppStyles.black14Regular.copyWith(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.arrow_drop_down,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Container(
                    height: 45.0,
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    width: MediaQuery.of(context).size.width * 0.65,
                    color: AppColors.whiteColor,
                    child: TypeAheadFormField<PlaceModel>(
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: _locationEditingController,
                        focusNode: _locationNode,
                        keyboardType: TextInputType.name,
                        maxLines: 1,
                        style: AppStyles.black14Regular,
                        cursorColor: AppColors.black.withOpacity(0.2),
                        maxLengthEnforced: true,
                        decoration: InputDecoration(
                          hintText: AppStrings.locationHint,
                          hintStyle: AppStyles.black14Regular
                              .copyWith(color: AppColors.grey0),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                        ),
                      ),
                      getImmediateSuggestions: false,
                      loadingBuilder: (context) {
                        return const CircularProgressIndicator(
                          strokeWidth: 2.0,
                          valueColor:
                              AlwaysStoppedAnimation(AppColors.baseOrange),
                        );
                      },
                      noItemsFoundBuilder: (context) {
                        return SizedBox(
                          height: 20.0,
                          child: Text(
                            AppStrings.noLocationFound,
                            style: AppStyles.black14Regular,
                          ),
                        );
                      },
                      onSuggestionSelected: (data) {
                        _locationEditingController.text = data.placeName;
                        _locationId = data.placeId;
                        Map<String, dynamic> param = bodyPara(
                            dateTime: _pickedDateCal, placeId: data.placeId);
                        provider.fetchPanchangDateData(param);
                      },
                      itemBuilder: (context, data) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 5.0),
                          child: Text(data.placeName ?? "",
                              style: AppStyles.black14Regular),
                        );
                      },
                      suggestionsBoxDecoration: const SuggestionsBoxDecoration(
                        constraints: BoxConstraints(
                          maxHeight: 150.0,
                          maxWidth: 200.0,
                        ),
                      ),
                      suggestionsCallback: (data) {
                        if (data.length > 2) {
                          return ApiCalls.getLocationSuggestion(
                              data.toString());
                        } else {
                          return [];
                        }
                      },
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _sunTimings(HomePageController provider) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 1.0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 3.0),
        height: 40.0,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 7.0),
        width: MediaQuery.of(context).size.width,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            sunAndMoonTiming(const Icon(Icons.wb_sunny_outlined),
                AppStrings.sunrise, provider.responseModel.sunrise),
            sunAndMoonTiming(const Icon(Icons.wb_sunny_outlined),
                AppStrings.sunset, provider.responseModel.sunset),
            sunAndMoonTiming(const Icon(Icons.dark_mode_outlined),
                AppStrings.moonrise, provider.responseModel.moonrise),
            sunAndMoonTiming(const Icon(Icons.dark_mode_outlined),
                AppStrings.moonset, provider.responseModel.moonset),
            sunAndMoonTiming(const Icon(Icons.wb_sunny_outlined),
                AppStrings.vedicSunrise, provider.responseModel.vedicSunrise),
            sunAndMoonTiming(const Icon(Icons.wb_sunny_outlined),
                AppStrings.vedicSunset, provider.responseModel.vedicSunset,
                isLast: true),
          ],
        ),
      ),
    );
  }

  Widget _getDefaultView(HomePageController provider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          const PanChangHeader(),
          const SizedBox(
            height: 10.0,
          ),
          _dateAndLocation(provider),
          if (provider.responseModel != null) _sunTimings(provider),
          const SizedBox(
            height: 20.0,
          ),
          if (provider.responseModel != null)
            Flexible(
              child: ListView(
                children: [
                  PanchangBlockTithi(panchangModel: provider.responseModel),
                  const SizedBox(height: 10.0),
                  NakshtraBlock(panchang: provider.responseModel),
                  const SizedBox(height: 10.0),
                  YogBlock(panchang: provider.responseModel),
                  const SizedBox(height: 10.0),
                  KaranBlock(panchang: provider.responseModel),
                  const SizedBox(height: 10.0),
                  HinduMaahBlock(panchang: provider.responseModel),
                  const SizedBox(height: 10.0),
                  OtherInformation(panchang: provider.responseModel),
                  const SizedBox(height: 10.0),
                  NakShoolBlock(
                    panchang: provider.responseModel,
                  ),
                  const SizedBox(height: 10.0),
                  AbhijitMuhuratBlock(
                    panchang: provider.responseModel,
                  ),
                  const SizedBox(height: 10.0),
                  RaguKaalBlock(
                    panchang: provider.responseModel,
                  ),
                  const SizedBox(height: 10.0),
                  GuliKaalBlock(
                    panchang: provider.responseModel,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  YamghantKaalBlock(
                    panchang: provider.responseModel,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: const CustomAppBar(),
        body: _getBody(),
      ),
    );
  }
}
