import 'package:assignment/app_utils/app_colors.dart';
import 'package:assignment/app_utils/app_images.dart';
import 'package:assignment/app_utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//App's Appbar 
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key key}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      child: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        leading: Image.asset(
          AppImages.hamburgerImage,
          height: 20.0,
          width: 20.0,
        ),
        title: Image.asset(
          AppImages.logoImage,
          height: 70.0,
          width: 70.0,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:15.0),
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamed(AppRoutes.underDev, arguments: false);
              },
              child: Image.asset(
                AppImages.profile,
                height: 25.0,
                width: 25.0,
              ),
            ),
          )
        ],
        elevation: 0.0,
        shadowColor: AppColors.whiteColor,
      ),
      preferredSize: const Size.fromHeight(60.0),
    );
  }
}
