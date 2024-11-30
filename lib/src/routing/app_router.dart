import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supplyr/src/features/auth/presentation/register/signup_screen.dart';
import 'package:supplyr/src/features/cart/presentation/shopping_cart/shopping_cart_screen.dart';
import 'package:supplyr/src/features/checkout/presentation/checkout_screen/checkout_screen.dart';
import 'package:supplyr/src/features/order/presentation/orders_list/orders_list_screen.dart';
import 'package:supplyr/src/features/product/product_detail/product_buy_now_screen.dart';
import 'package:supplyr/src/features/product/product_list/home_screen.dart';
import 'package:supplyr/src/routing/scaffold_with_nested_navigation.dart';

import '../features/auth/presentation/login/login_screen.dart';
import '../features/product/domain/product_model.dart';
import 'not_found_screen.dart';

part 'app_router.g.dart';

enum AppRoute {
  login,
  register,
  product,
  productDetail,
  cart,
  order,
  checkout,
}

final _cartNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'cart');

final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _orderNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'order');
final _rootNavigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter goRouter(Ref ref) {
  // final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: '/login',
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/login',
        name: AppRoute.login.name,
        pageBuilder: (context, state) => const MaterialPage(
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: '/register',
        name: AppRoute.register.name,
        pageBuilder: (context, state) => const MaterialPage(
          child: SignUpScreen(),
        ),
      ),
      // ]),
      StatefulShellRoute.indexedStack(
        pageBuilder: (context, state, navigationShell) => MaterialPage(
          child: ScaffoldWithNestedNavigation(navigationShell: navigationShell),
        ),
        branches: [
          StatefulShellBranch(navigatorKey: _homeNavigatorKey, routes: [
            GoRoute(
                path: '/',
                name: AppRoute.product.name,
                pageBuilder: (context, state) => const MaterialPage(
                      child: HomeScreen(),
                    ),
                routes: [
                  GoRoute(
                    path: 'productDetail',
                    name: AppRoute.productDetail.name,
                    pageBuilder: (context, state) => MaterialPage(
                      child: ProductBuyNowScreen(
                        product: state.extra! as Product,
                      ),
                    ),
                  ),
                ]),
          ]),
          StatefulShellBranch(
            navigatorKey: _cartNavigatorKey,
            routes: [
              GoRoute(
                path: '/cart',
                name: AppRoute.cart.name,
                pageBuilder: (context, state) => const MaterialPage(
                  child: ShoppingCartScreen(),
                ),
                routes: [
                  GoRoute(
                    path: 'checkout',
                    name: AppRoute.checkout.name,
                    pageBuilder: (context, state) => const MaterialPage(
                      child: CheckoutScreen(),
                    ),
                  )
                ],
              ),
            ],
          ),
          StatefulShellBranch(navigatorKey: _orderNavigatorKey, routes: [
            GoRoute(
              path: '/order',
              name: AppRoute.order.name,
              pageBuilder: (context, state) => const MaterialPage(
                child: OrdersListScreen(),
              ),
            ),
          ]),
        ],
      )
    ],
    errorPageBuilder: (context, state) => const MaterialPage(
      child: NotFoundScreen(),
    ),
  );
}
