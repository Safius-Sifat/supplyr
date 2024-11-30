import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../constants/constants.dart';

// Stateful navigation based on:
// https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: navigationShell,
        bottomNavigationBar:
            NavBar(pageIndex: navigationShell.currentIndex, onTap: _goBranch));
  }
}

class NavBar extends ConsumerWidget {
  final int pageIndex;
  final void Function(int) onTap;

  const NavBar({
    super.key,
    required this.pageIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SvgPicture svgIcon(String src, {Color? color}) {
      return SvgPicture.asset(
        src,
        height: 24,
        colorFilter: ColorFilter.mode(
            color ??
                Theme.of(context).iconTheme.color!.withOpacity(
                    Theme.of(context).brightness == Brightness.dark ? 0.3 : 1),
            BlendMode.srcIn),
      );
    }

    return Container(
      padding: const EdgeInsets.only(top: defaultPadding / 2),
      color: Theme.of(context).brightness == Brightness.light
          ? Colors.white
          : const Color(0xFF101015),
      child: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: onTap,
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : const Color(0xFF101015),
        type: BottomNavigationBarType.fixed,
        // selectedLabelStyle: TextStyle(color: primaryColor),
        selectedFontSize: 12,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.transparent,
        items: [
          BottomNavigationBarItem(
            icon: svgIcon("assets/icons/Shop.svg"),
            activeIcon: svgIcon("assets/icons/Shop.svg", color: primaryColor),
            label: "Shop",
          ),
          BottomNavigationBarItem(
            icon: svgIcon("assets/icons/Bag.svg"),
            activeIcon: svgIcon("assets/icons/Bag.svg", color: primaryColor),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: svgIcon("assets/icons/Category.svg"),
            activeIcon:
                svgIcon("assets/icons/Category.svg", color: primaryColor),
            label: "Discover",
          ),
        ],
      ),
    );
  }
}
