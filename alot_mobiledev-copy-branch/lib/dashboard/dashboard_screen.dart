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
  // Define the routes for the bottom navigation tabs.
  final _routes = <PageRouteInfo>[
    const HomeTabScreenRoute(), // Home screen
    const MapsTabScreenRoute(), // Maps screen
    const BookingsTabScreenRoute(), // Bookings screen
    const ChatsTabScreenRoute(), // Chats screen
    const ProfileTabScreenRoute(), // Profile screen
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
          body: child, // Displays the active tab screen
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            itemCount: _routes.length, // Number of tabs
            tabBuilder: (int index, bool isActive) {
              return Icon(
                _getBottomNavigationIcons(index), // Get the appropriate icon
                size: 24,
                color: tabsRouter.activeIndex == index
                    ? Colors.blue // Active tab color
                    : Colors.grey, // Inactive tab color
              );
            },
            activeIndex: tabsRouter.activeIndex, // Active tab index
            gapLocation: GapLocation.none,
            notchSmoothness: NotchSmoothness.defaultEdge,
            splashSpeedInMilliseconds: 200,
            onTap: (index) {
              tabsRouter.setActiveIndex(index); // Navigate to the tapped tab
            },
          ),
        );
      },
    );
  }

  // Method to get the icons for the bottom navigation tabs.
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
