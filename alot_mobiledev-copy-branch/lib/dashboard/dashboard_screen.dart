import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:alot_mobiledevelopment/config/routes.gr.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _DashboardView();
  }
}

class _DashboardView extends StatefulWidget {
  const _DashboardView();

  @override
  State<_DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<_DashboardView> {
  final _routes = <PageRouteInfo>[
    const HomeTabScreenRoute(),
    const MapsTabScreenRoute(),
    const BookingsTabScreenRoute(),
    const ChatsTabScreenRoute(),
    const ProfileTabScreenRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: _routes,
      transitionBuilder:
          (BuildContext context, Widget child, Animation<double> animation) =>
              FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (BuildContext context, Widget child) {
        final TabsRouter tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            itemCount: _routes.length,
            tabBuilder: (int index, bool isActive) {
              return Icon(
                _getBottomNavigationIcons(index),
                size: 24,
                color:
                    tabsRouter.activeIndex == index ? Colors.blue : Colors.grey,
              );
            },
            activeIndex: tabsRouter.activeIndex,
            gapLocation: GapLocation.none,
            notchSmoothness: NotchSmoothness.defaultEdge,
            splashSpeedInMilliseconds: 200,
            onTap: (index) {
              tabsRouter.setActiveIndex(index);
            },
          ),
        );
      },
    );
  }

  IconData _getBottomNavigationIcons(int index) {
    switch (index) {
      case 0:
        return Icons.home;
      case 1:
        return Icons.map;
      case 2:
        return Icons.calendar_today;
      case 3:
        return Icons.chat;
      case 4:
        return Icons.person;
      default:
        return Icons.home;
    }
  }
}
