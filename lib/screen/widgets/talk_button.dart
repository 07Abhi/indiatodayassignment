import 'package:assignment/app_utils/app_colors.dart';
import 'package:assignment/app_utils/app_strings.dart';
import 'package:assignment/app_utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//Talk To Astro Button widget
class TalkButton extends StatelessWidget {
  const TalkButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      width: 100.0,
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      alignment: Alignment.center,
      color: AppColors.baseOrange,
      child: Row(
        children: [
          const Icon(
            Icons.local_phone_outlined,
            size: 15.0,
            color: AppColors.whiteColor,
          ),
          const SizedBox(width: 10.0),
          Text(
            AppStrings.talkOnCall,
            style: AppStyles.black10Regular.copyWith(
              color: AppColors.whiteColor,
            ),
          )
        ],
      ),
    );
  }
}
