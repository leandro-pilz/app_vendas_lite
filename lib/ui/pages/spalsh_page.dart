import 'package:app_vendas_lite/ui/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      useAppBar: false,
      child: Center(
        child: TextButton(
          onPressed: () => Router.neglect(context, () => context.goNamed('home')),
          // onPressed: () => context.pushReplacementNamed('home'),
          child: Text('Ola Mundo'),
        ),
      ),
    );
  }
}
