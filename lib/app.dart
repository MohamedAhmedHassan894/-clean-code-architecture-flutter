import 'src/config/routes/app_routes.dart';
import 'src/config/themes/app_theme.dart';
import 'src/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'src/features/random_snippets/presentation/screens/snippets_screen.dart';

class SnippetsApp extends StatelessWidget {
  const SnippetsApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 730),
      builder: (BuildContext context, Widget? child) => MaterialApp(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: appTheme(),
        home: SnippetsScreen(),
        // named routes strategy
        // routes: routes,
        // generated routes strategy
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
