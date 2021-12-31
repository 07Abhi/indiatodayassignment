import 'package:assignment/app_utils/app_colors.dart';
import 'package:assignment/app_utils/app_images.dart';
import 'package:assignment/app_utils/app_strings.dart';
import 'package:assignment/app_utils/app_styles.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

String formatDate(DateTime dateTime) {
  String date = dateTime.day.toString();
  String mon = month[dateTime.month];
  String abbrevation = checkAbbrevation(dateTime.day);
  String year = dateTime.year.toString();
  return date + abbrevation + " " + mon + " , " + year;
}

Future<bool> internetCheck() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}

printDebug(Object object) {
  if (kDebugMode) {
    // ignore: avoid_print
    print(object ?? "");
  }
}

Map<int, String> month = {
  1: "January",
  2: "Febuary",
  3: "March",
  4: "April",
  5: "May",
  6: "June",
  7: "July",
  8: "August",
  9: "September",
  10: "October",
  11: "November",
  12: "December",
};
String checkAbbrevation(int number) {
  switch (number) {
    case 1:
    case 21:
    case 31:
      return "st";
      break;
    case 2:
    case 22:
      return "nd";
      break;
    case 3:
    case 23:
      return "rd";
      break;
    default:
      return "th";
      break;
  }
}

Map<String, dynamic> bodyPara({DateTime dateTime, String placeId}) {
  return {
    "day": dateTime.day,
    "month": dateTime.month,
    "year": dateTime.year,
    "placeId": placeId,
  };
}

Widget infoRow(String infoName, String desc) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(flex: 1, child: Text(infoName, style: AppStyles.black12Regular)),
      Expanded(flex: 2, child: Text(desc, style: AppStyles.black12Regular)),
    ],
  );
}

Widget sunAndMoonTiming(Icon iconData, String starName, String time,
    {bool isLast = false}) {
  return SizedBox(
    width: 100.0,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        iconData,
        const SizedBox(
          width: 10.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              starName,
              style: AppStyles.black8Regular.copyWith(
                color: AppColors.blueColor,
              ),
            ),
            const SizedBox(
              height: 3.0,
            ),
            Text(time, style: AppStyles.black8Regular)
          ],
        ),
        !isLast
            ? Padding(
                padding: const EdgeInsets.only(left: 10.0, bottom: 3.0),
                child: verticalDivider(),
              )
            : const SizedBox()
      ],
    ),
  );
}

verticalDivider() {
  return Container(
    height: 25.0,
    width: 1.0,
    color: AppColors.black.withOpacity(0.3),
  );
}

noInternetWork({Function noInternet, bool notShowTry = false}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppImages.noInternet, height: 80.0, width: 80.0),
        const SizedBox(height: 20.0),
        !notShowTry
            ? GestureDetector(
                onTap: () {
                  noInternet();
                },
                child: Container(
                  height: 40.0,
                  width: 80.0,
                  color: AppColors.baseOrange,
                  alignment: Alignment.center,
                  child: Text(
                    AppStrings.tryAgain,
                    style: AppStyles.black14Bold.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    ),
  );
}

failedView({Function retryFunction}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.failedPng,
          height: 80.0,
          width: 80.0,
        ),
        const SizedBox(
          height: 20.0,
        ),
        GestureDetector(
          onTap: () {
            retryFunction();
          },
          child: Container(
            height: 40.0,
            width: 80.0,
            color: AppColors.baseOrange,
            alignment: Alignment.center,
            child: Text(
              AppStrings.tryAgain,
              style: AppStyles.black14Bold.copyWith(
                color: AppColors.whiteColor,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
