import 'package:auto_route/auto_route.dart';

import 'routes.gr.dart';
// use flutter pub run build_runner build --delete-conflicting-outputs command to generate and comment the part again

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SignInRoute.page, initial: true),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: BookingRoute.page),
        AutoRoute(page: ChatRoute.page),
        AutoRoute(page: BarberHomeRoute.page),
        AutoRoute(page: ClientHomeRoute.page),
        AutoRoute(page: CompleteProfileRoute.page),
        AutoRoute(page: EnterLocationRoute.page),
        AutoRoute(page: MapRoute.page),
        AutoRoute(page: LocationAccessRoute.page),
      ];

  @override
  List<AutoRouteGuard> get guards => [
        // optionally add root guards here
      ];
}

// class Routes {
//   static Map<String, WidgetBuilder> getRoutes() {
//     return {
//       '/': (context) => SignInScreen(),
//       '/signup': (context) => SignUpScreen(),
//       '/signin': (context) => SignInScreen(),
//       '/completeProfile': (context) {
//         final args =
//             ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
//         final user = args['user'] as User;
//         final initialName = args['initialName'] as String;
//         return CompleteProfileScreen(user: user, initialName: initialName);
//       },
//       '/locationAccess': (context) {
//         final args =
//             ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
//         final role = args['role'] as String;
//         return LocationAccessScreen(role: role);
//       },
//       '/barberHome': (context) => const BarberHomeScreen(),
//       '/clientHome': (context) => const ClientHomeScreen(),
//     };
//   }
// }
