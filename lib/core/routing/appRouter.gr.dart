// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:coding_challenge/features/event_list/presentation/pages/detail_page.dart'
    as _i1;
import 'package:coding_challenge/features/event_list/presentation/pages/event_page.dart'
    as _i2;
import 'package:flutter/material.dart' as _i4;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    DetailedRoute.name: (routeData) {
      final args = routeData.argsAs<DetailedRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.DetailedPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    EventRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.EventPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.DetailedPage]
class DetailedRoute extends _i3.PageRouteInfo<DetailedRouteArgs> {
  DetailedRoute({
    _i4.Key? key,
    required String id,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          DetailedRoute.name,
          args: DetailedRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailedRoute';

  static const _i3.PageInfo<DetailedRouteArgs> page =
      _i3.PageInfo<DetailedRouteArgs>(name);
}

class DetailedRouteArgs {
  const DetailedRouteArgs({
    this.key,
    required this.id,
  });

  final _i4.Key? key;

  final String id;

  @override
  String toString() {
    return 'DetailedRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i2.EventPage]
class EventRoute extends _i3.PageRouteInfo<void> {
  const EventRoute({List<_i3.PageRouteInfo>? children})
      : super(
          EventRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
