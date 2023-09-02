import 'package:app_vendas_lite/ui/pages/spalsh_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/ui/pages/customer_pages/customers_page.dart';
import '/ui/pages/home_page.dart';
import '/ui/pages/order_pages/orders_page.dart';
import '/ui/pages/quote_pages/quotes_page.dart';

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _navigatorKey,
  initialLocation: '/splash',
  routes: [
    GoRoute(
      name: 'splash',
      path: '/splash',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const SplashPage(),
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
      name: 'home',
      path: '/',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOutSine).animate(animation),
              child: child,
            );
          },
        );
      },
      routes: [
        GoRoute(
          name: 'cotacao',
          path: 'cotacao',
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
