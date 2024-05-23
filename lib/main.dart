import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:poker_range/helper/logger/logger.dart';
import 'package:poker_range/model/position.dart';
import 'package:poker_range/model/position_range.dart';
import 'package:poker_range/model/ten_people_range_table.dart';
import 'package:poker_range/page/probability_page/bloc/probability_bloc.dart';
import 'package:poker_range/page/set_range_page/set_range_page.dart';
import 'package:poker_range/repository/probability/probability_impl.dart';
import 'package:poker_range/repository/theme/theme_repository.dart';
import 'package:poker_range/route/routes.dart';
import 'package:poker_range/theme/theme.dart';
import 'package:poker_range/theme/theme_cubit.dart';
import 'package:poker_range/widget/range_table/range_table.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runZonedGuarded(
    () async {
      Bloc.observer = const AppBlocObserver();
      WidgetsFlutterBinding.ensureInitialized();
      final prefs = await SharedPreferences.getInstance();
      runApp(App(prefs));
    },
    (error, stackTrace) =>
        Logger.error(error.toString(), stackTrace: stackTrace),
  );
}

class App extends StatelessWidget {
  const App(this.prefs, {super.key});

  final SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    // LocalJsonLocalization.delegate.directories = ['lib/i18n'];
    final c = List.generate(169, (_) => false);
    final d = List.generate(169, (_) => false);
    c[20] = true;
    c[50] = true;
    d[20] = true;
    d[100] = true;
    d[111] = true;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeCubit(ThemeRepository(prefs)),
        ),
        BlocProvider(create: (_) => ProbabilityBloc(ProbabilitySharedPreferenceImpl(prefs))..add(ProbabilitySetupRecordsEvent()))
      ],
      child: BlocBuilder<ThemeCubit, MyThemeData>(
        builder: (context, theme) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: theme.themeData,
            // localizationsDelegates: [
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalWidgetsLocalizations.delegate,
            //   GlobalCupertinoLocalizations.delegate,
            //   LocalJsonLocalization.delegate
            // ],
            routerConfig: Routes.router,
            // home: Scaffold(
            //   body: SafeArea(
            //     child: SetRangePage(data: PeopleRangeTable(
            //       peopleCount: 10,
            //       ranges: [
            //         PositionRange(
            //           position: Position.BB,
            //           range: c,
            //           paintColor: Colors.blue,
            //         ),
            //         PositionRange(
            //           position: Position.SB,
            //           range: d,
            //           paintColor: Colors.red,
            //         ),
            //       ],
            //     )),
            //   ),
            // ),
          );
        },
      ),
    );
  }
}

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    Logger.error('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    Logger.bloc('onEvent ${bloc.runtimeType}, ${event.runtimeType}');
  }
}
