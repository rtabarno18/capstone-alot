// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:alot_mobiledevelopment/dashboard/dashboard_screen.dart' as _i7;
import 'package:alot_mobiledevelopment/dashboard/dashboard_tabs.dart' as _i3;
import 'package:alot_mobiledevelopment/screens/auth/signin_screen.dart' as _i12;
import 'package:alot_mobiledevelopment/screens/auth/signup_screen.dart' as _i13;
import 'package:alot_mobiledevelopment/screens/booking/booking_screen.dart'
    as _i2;
import 'package:alot_mobiledevelopment/screens/chat/chat_screen.dart' as _i4;
import 'package:alot_mobiledevelopment/screens/home/barber_home.dart' as _i1;
import 'package:alot_mobiledevelopment/screens/home/client_home.dart' as _i5;
import 'package:alot_mobiledevelopment/screens/location/enter_location_screen.dart'
    as _i8;
import 'package:alot_mobiledevelopment/screens/location/location_access_screen.dart'
    as _i9;
import 'package:alot_mobiledevelopment/screens/map/map_screen.dart' as _i10;
import 'package:alot_mobiledevelopment/screens/profile/complete_profile_screen.dart'
    as _i6;
import 'package:alot_mobiledevelopment/screens/profile/profile_screen.dart'
    as _i11;
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:firebase_auth/firebase_auth.dart' as _i16;
import 'package:flutter/material.dart' as _i15;

/// generated route for
/// [_i1.BarberHomeScreen]
class BarberHomeRoute extends _i14.PageRouteInfo<void> {
  const BarberHomeRoute({List<_i14.PageRouteInfo>? children})
      : super(
          BarberHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'BarberHomeRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i1.BarberHomeScreen();
    },
  );
}

/// generated route for
/// [_i2.BookingScreen]
class BookingRoute extends _i14.PageRouteInfo<void> {
  const BookingRoute({List<_i14.PageRouteInfo>? children})
      : super(
          BookingRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookingRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i2.BookingScreen();
    },
  );
}

/// generated route for
/// [_i3.BookingsTabScreen]
class BookingsTab extends _i14.PageRouteInfo<void> {
  const BookingsTab({List<_i14.PageRouteInfo>? children})
      : super(
          BookingsTab.name,
          initialChildren: children,
        );

  static const String name = 'BookingsTab';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i3.BookingsTabScreen();
    },
  );
}

/// generated route for
/// [_i4.ChatScreen]
class ChatRoute extends _i14.PageRouteInfo<void> {
  const ChatRoute({List<_i14.PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i4.ChatScreen();
    },
  );
}

/// generated route for
/// [_i3.ChatsTabScreen]
class ChatsTab extends _i14.PageRouteInfo<void> {
  const ChatsTab({List<_i14.PageRouteInfo>? children})
      : super(
          ChatsTab.name,
          initialChildren: children,
        );

  static const String name = 'ChatsTab';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i3.ChatsTabScreen();
    },
  );
}

/// generated route for
/// [_i5.ClientHomeScreen]
class ClientHomeRoute extends _i14.PageRouteInfo<void> {
  const ClientHomeRoute({List<_i14.PageRouteInfo>? children})
      : super(
          ClientHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'ClientHomeRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i5.ClientHomeScreen();
    },
  );
}

/// generated route for
/// [_i6.CompleteProfileScreen]
class CompleteProfileRoute
    extends _i14.PageRouteInfo<CompleteProfileRouteArgs> {
  CompleteProfileRoute({
    _i15.Key? key,
    required _i16.User user,
    required String initialName,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          CompleteProfileRoute.name,
          args: CompleteProfileRouteArgs(
            key: key,
            user: user,
            initialName: initialName,
          ),
          initialChildren: children,
        );

  static const String name = 'CompleteProfileRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CompleteProfileRouteArgs>();
      return _i6.CompleteProfileScreen(
        key: args.key,
        user: args.user,
        initialName: args.initialName,
      );
    },
  );
}

class CompleteProfileRouteArgs {
  const CompleteProfileRouteArgs({
    this.key,
    required this.user,
    required this.initialName,
  });

  final _i15.Key? key;

  final _i16.User user;

  final String initialName;

  @override
  String toString() {
    return 'CompleteProfileRouteArgs{key: $key, user: $user, initialName: $initialName}';
  }
}

/// generated route for
/// [_i7.DashboardScreen]
class DashboardRoute extends _i14.PageRouteInfo<void> {
  const DashboardRoute({List<_i14.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i7.DashboardScreen();
    },
  );
}

/// generated route for
/// [_i8.EnterLocationScreen]
class EnterLocationRoute extends _i14.PageRouteInfo<void> {
  const EnterLocationRoute({List<_i14.PageRouteInfo>? children})
      : super(
          EnterLocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'EnterLocationRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i8.EnterLocationScreen();
    },
  );
}

/// generated route for
/// [_i3.HomeTabScreen]
class HomeTab extends _i14.PageRouteInfo<void> {
  const HomeTab({List<_i14.PageRouteInfo>? children})
      : super(
          HomeTab.name,
          initialChildren: children,
        );

  static const String name = 'HomeTab';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeTabScreen();
    },
  );
}

/// generated route for
/// [_i9.LocationAccessScreen]
class LocationAccessRoute extends _i14.PageRouteInfo<LocationAccessRouteArgs> {
  LocationAccessRoute({
    _i15.Key? key,
    required String role,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          LocationAccessRoute.name,
          args: LocationAccessRouteArgs(
            key: key,
            role: role,
          ),
          initialChildren: children,
        );

  static const String name = 'LocationAccessRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LocationAccessRouteArgs>();
      return _i9.LocationAccessScreen(
        key: args.key,
        role: args.role,
      );
    },
  );
}

class LocationAccessRouteArgs {
  const LocationAccessRouteArgs({
    this.key,
    required this.role,
  });

  final _i15.Key? key;

  final String role;

  @override
  String toString() {
    return 'LocationAccessRouteArgs{key: $key, role: $role}';
  }
}

/// generated route for
/// [_i10.MapScreen]
class MapRoute extends _i14.PageRouteInfo<void> {
  const MapRoute({List<_i14.PageRouteInfo>? children})
      : super(
          MapRoute.name,
          initialChildren: children,
        );

  static const String name = 'MapRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i10.MapScreen();
    },
  );
}

/// generated route for
/// [_i3.MapsTabScreen]
class MapsTab extends _i14.PageRouteInfo<void> {
  const MapsTab({List<_i14.PageRouteInfo>? children})
      : super(
          MapsTab.name,
          initialChildren: children,
        );

  static const String name = 'MapsTab';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i3.MapsTabScreen();
    },
  );
}

/// generated route for
/// [_i11.ProfileScreen]
class ProfileRoute extends _i14.PageRouteInfo<void> {
  const ProfileRoute({List<_i14.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i11.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i3.ProfileTabScreen]
class ProfileTab extends _i14.PageRouteInfo<void> {
  const ProfileTab({List<_i14.PageRouteInfo>? children})
      : super(
          ProfileTab.name,
          initialChildren: children,
        );

  static const String name = 'ProfileTab';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i3.ProfileTabScreen();
    },
  );
}

/// generated route for
/// [_i12.SignInScreen]
class SignInRoute extends _i14.PageRouteInfo<void> {
  const SignInRoute({List<_i14.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i12.SignInScreen();
    },
  );
}

/// generated route for
/// [_i13.SignUpScreen]
class SignUpRoute extends _i14.PageRouteInfo<void> {
  const SignUpRoute({List<_i14.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i13.SignUpScreen();
    },
  );
}
