import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/entities/quotation_entity.dart';
import '/ui/pages/customer_pages/customers_page.dart';
import '/ui/pages/home_page.dart';
import '/ui/pages/order_pages/orders_page.dart';
import '/ui/pages/quote_pages/quotes_page.dart';
import '/ui/pages/quote_pages/shopping_cart_page.dart';
import '/ui/pages/spalsh_page.dart';
import 'utils/routes_name_app.dart';

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _navigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      name: splashRouteName,
      path: '/',
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
      parentNavigatorKey: _navigatorKey,
      name: homeRouteName,
      path: '/home',
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
          name: quotationRouteName,
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
          routes: [
            GoRoute(
              name: shoppingCartRouteName,
              path: 'carrinho',
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  key: state.pageKey,
                  child: ShoppingCartPage(quotation: state.extra as QuotationEntity),
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
        GoRoute(
          name: customerRouteName,
          path: 'cliente',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: CustomersPage(),
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
          parentNavigatorKey: _navigatorKey,
          name: orderRouteName,
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
