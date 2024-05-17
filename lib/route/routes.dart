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
    ],
  );
}