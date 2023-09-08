import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/ui/widgets/app_scaffold.dart';
import '../utils/routes_name_app.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(milliseconds: 2000),
      () {
        Router.neglect(context, () => context.goNamed(shoppingCartRouteName));
      },
    );
    return const AppScaffold(
      useAppBar: false,
      body: Center(
        child: Text('Ola Mundo'),
      ),
    );
  }
}
