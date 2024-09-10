import 'package:alot_mobiledevelopment/config/routes.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeTab(),
        MapsTab(),
        BookingsTab(),
        ChatsTab(),
        ProfileTab(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (value) {
              tabsRouter.setActiveIndex(value);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map),
                label: 'Maps',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                label: 'Calendar',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}








// import 'package:alot_mobiledevelopment/config/routes.gr.dart';
// import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart'; // Example service for authentication status

// @RoutePage()
// class DashboardScreen extends StatelessWidget {
//   const DashboardScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const _DashboardView();
//   }
// }

// class _DashboardView extends StatefulWidget {
//   const _DashboardView();

//   @override
//   State<_DashboardView> createState() => _DashboardViewState();
// }

// class _DashboardViewState extends State<_DashboardView> {
//   final _routes = <PageRouteInfo>[
//     const HomeTab(),
//     const ChatsTab(),
//     if (AuthService().getUserLoggedIn('userLoggedIn')?.email != null)
//       const MapsTab(),
//     const BookingsTab(),
//     const ProfileTab(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return AutoTabsRouter(
//       routes: _routes,
//       transitionBuilder: (BuildContext context, Widget child, Animation<double> animation) => FadeTransition(
//         opacity: animation,
//         child: child,
//       ),
//       builder: (BuildContext context, Widget child) {
//         final TabsRouter tabsRouter = AutoTabsRouter.of(context);
//         return Scaffold(
//           body: child,
//           bottomNavigationBar: AnimatedBottomNavigationBar.builder(
//             itemCount: _routes.length,  // Ensure this matches the number of routes
//             tabBuilder: (int index, bool isActive) {
//               return Icon(
//                 _getBottomNavigationIcons(index),
//                 size: 24,
//                 color: tabsRouter.activeIndex == index ? Colors.purple : Colors.grey,
//               );
//             },
//             activeIndex: tabsRouter.activeIndex,
//             gapLocation: GapLocation.none,
//             notchSmoothness: NotchSmoothness.defaultEdge,
//             splashSpeedInMilliseconds: 200,
//             onTap: (index) {
//               tabsRouter.setActiveIndex(index);
//             },
//           ),
//         );
//       },
//     );
//   }

//   IconData _getBottomNavigationIcons(int index) {
//     switch (index) {
//       case 0:
//         return Icons.home_filled;
//       case 1:
//         return Icons.message;
//       case 2:
//         return (AuthService().getUserLoggedIn('userLoggedIn')?.email == null)
//             ? Icons.notifications_rounded
//             : Icons.map;
//       case 3:
//         return Icons.book;
//       default:
//         return Icons.person;
//     }
//   }
// }
