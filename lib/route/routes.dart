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

  static const String textSettingPage = 'textSettingPage';
  static const String _textSettingRoute = '/textSettingRoute';

  static const String rulePage = 'rulePage';
  static const String _ruleRoute = '/ruleRoute';

  static const String notePage = 'notePage';
  static const String _noteRoute = '/noteRoute';

  static const String handRankingPage = 'handRankingPage';
  static const String _handRankingRoute = '/handRankingRoute';

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
        path: _textSettingRoute,
        name: textSettingPage,
        builder: (context, state) => const TextSettingPage(),
      ),
      GoRoute(
        path: _ruleRoute,
        name: rulePage,
        builder: (context, state) => const RulePage(),
      ),
      GoRoute(
        path: _noteRoute,
        name: notePage,
        builder: (context, state) => const NotePage(),
      ),
      GoRoute(
        path: _handRankingRoute,
        name: handRankingPage,
        builder: (context, state) => const HandRankingPage(),
      ),
      GoRoute(
        path: _settingRoute,
        name: settingPage,
        builder: (context, state) => const SettingPage(),
        // pageBuilder: (context, state) {
        //   return CustomTransitionPage(
        //     child: const SettingPage(),
        //     transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
        //       opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
        //       child: child,
        //     )
        //   );
        // },
      ),
    ],
  );
}