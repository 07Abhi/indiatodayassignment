import 'package:assignment/app_utils/app_routes.dart';
import 'package:assignment/controllers/homepage_controller.dart';
import 'package:assignment/screen/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'app_utils/app_colors.dart';
import 'controllers/agents_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AgentController>(
            create: (context) => AgentController()),
        ChangeNotifierProvider<HomePageController>(
            create: (context) => HomePageController()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ajj-Tak',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: AppColors.whiteColor,
            
          ),
          home: const Splash(),
          onGenerateRoute: AppRoutesSettings().onGenerateRoute(),
        ),
      ),
    );
  }
}
