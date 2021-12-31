import 'package:assignment/app_utils/app_colors.dart';
import 'package:flutter/material.dart';
//Loading Shimmer
class ShimmerWidget extends StatefulWidget {
  const ShimmerWidget({Key key}) : super(key: key);
  @override
  _ShimmerWidgetState createState() => _ShimmerWidgetState();
}

class _ShimmerWidgetState extends State<ShimmerWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animationValue;
  LinearGradient _gradient;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
    );
    _animationValue = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );
    _animationController
      ..forward()
      ..repeat();
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [AppColors.greyMedium, AppColors.greyLight, AppColors.greyMedium],
      stops: [0, _animationValue.value, 1],
    );

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyLight,
        borderRadius: BorderRadius.circular(
          5.0,
        ),
        gradient: _gradient,
      ),
    );
  }
}
