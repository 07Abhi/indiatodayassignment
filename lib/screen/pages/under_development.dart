import 'package:assignment/app_utils/app_colors.dart';
import 'package:assignment/app_utils/app_images.dart';
import 'package:assignment/app_utils/app_strings.dart';
import 'package:assignment/app_utils/app_styles.dart';
import 'package:assignment/screen/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class UnderDevelopment extends StatelessWidget {
  bool isAppBar;
  UnderDevelopment({Key key, this.isAppBar = false}) : super(key: key);

  _getBody() {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.underDevelopment,
              height: 80.0,
              width: 90.0,
            ),
            Text(
              AppStrings.underDevelopment,
              style: AppStyles.black18Bold,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: isAppBar
          ? const CustomAppBar()
          : AppBar(
              backgroundColor: AppColors.whiteColor,
              automaticallyImplyLeading: false,
              elevation: 0.0,
              shadowColor: AppColors.whiteColor,
            ),
      body: _getBody(),
    );
  }
}
