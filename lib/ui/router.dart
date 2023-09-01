import 'package:app_vendas_lite/ui/pages/customer_pages/customers_page.dart';
import 'package:app_vendas_lite/ui/pages/home_page.dart';
import 'package:app_vendas_lite/ui/pages/order_pages/orders_page.dart';
import 'package:app_vendas_lite/ui/pages/quote_pages/quotes_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _navigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          name: 'cotacao',
          path: 'cotacao',
          // builder: (context, state) => const QuotesPage(),
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const QuotesPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutSine).animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          name: 'cliente',
          path: 'cliente',
          // builder: (context, state) => const CustomersPage(),
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const CustomersPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutSine).animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          name: 'pedido',
          path: 'pedido',
          // builder: (context, state) => const OrdersPage(),
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const OrdersPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutSine).animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
      ],
    ),
  ],
);
