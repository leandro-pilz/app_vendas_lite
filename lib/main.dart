import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get_it/get_it.dart';

import '/initializer.dart';
import 'ui/pages/auth_pages/auth_bloc.dart';
import 'ui/router.dart';
import 'ui/utils/theme_custom.dart';

GetIt getIt = GetIt.instance;

void main() {
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  final initializer = Initializer();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc(dataBase: initializer.getDataBase())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'App vendas lite',
      theme: themeCustom,
      routerConfig: router,
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
