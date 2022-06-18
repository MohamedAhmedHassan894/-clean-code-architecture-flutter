import '../../core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import '../../features/random_snippets/presentation/screens/snippets_screen.dart';

class Routes {
  static const initialRoute = '/';
  static const favouriteSnippetRoute = '/favourite-snippet';
}

// named routes strategy
final routes = {
  Routes.initialRoute: (Context) => const SnippetsScreen(),
  // Routes.favouriteSnippetRoute: (Context) => FavouriteScreen(),
};

// generated routes strategy
class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const SnippetsScreen());
    }
    return undefinedRoute();
  }

  static Route<dynamic> undefinedRoute() => MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text((AppStrings.noRouteFound)),
          ),
        ),
      );
}
