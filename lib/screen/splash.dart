import 'package:assignment/app_utils/app_colors.dart';
import 'package:assignment/app_utils/app_images.dart';
import 'package:assignment/app_utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//Application splash screen.
class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, AppRoutes.appNaviagtor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Container(
          height: 120.h,
          width: 120.w,
          alignment: Alignment.center,
          child: Image.asset(
            AppImages.logoImage,
            height: 120.h,
            width: 120.h,
          ),
        ),
      ),
    );
  }
}
