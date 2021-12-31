import 'package:assignment/app_utils/app_colors.dart';
import 'package:assignment/app_utils/app_strings.dart';
import 'package:assignment/app_utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//Home Page Panchang Header Widget
class PanChangHeader extends StatelessWidget {
  const PanChangHeader({Key key}) : super(key: key);

  Widget _headerIcon() {
    return Row(
      children: [
        const Icon(
          Icons.keyboard_arrow_left,
          size: 25.0,
          color: AppColors.black,
        ),
        Text(
          AppStrings.dailyPanchang,
          style: AppStyles.black16Bold,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: AppColors.whiteColor,
      child: Column(
        children: [
          _headerIcon(),
          const SizedBox(height: 10.0),
          Text(
            AppStrings.panchangHeaderText,
            style: AppStyles.black12Regular,
          )
        ],
      ),
    );
  }
}
