import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:poker_range/model/ten_people_range_table.dart';
import 'package:poker_range/page/page.dart';

class Routes {
  Routes._();

  static const String menuPage = 'menuPage';
  static const String _menuRoute = '/menuRoute';

  static const String setRangePage = 'setRangePage';
  static const String _setRangeRoute = '/setRangeRoute';

  static const String probabilityPage = 'probabilityPage';
  static const String _probabilityRoute = '/probabilityRoute';

  static const String settingPage = 'settingPage';
  static const String _settingRoute = '/settingRoute';

  static const String themePage = 'themePage';
  static const String _themeRoute = '/themeRoute';

  static final router = GoRouter(
    initialLocation: _menuRoute,
    routes: [
      GoRoute(
        path: _menuRoute,
        name: menuPage,
        builder: (context, state) => const MenuPage(),
      ),
      GoRoute(
        path: _setRangeRoute,
        name: setRangePage,
        builder: (context, state) => SetRangePage(data: state.extra as PeopleRangeTable),
      ),
      GoRoute(
        path: _probabilityRoute,
        name: probabilityPage,
        builder: (context, state) => const ProbabilityPage(),
      ),
      GoRoute(
        path: _themeRoute,
        name: themePage,
        builder: (context, state) => const ThemePage(),
      ),
      GoRoute(
        path: _settingRoute,
        name: settingPage,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const SettingPage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            )
          );
        },
      ),
    ],
  );
}