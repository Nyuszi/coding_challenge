import 'package:auto_route/auto_route.dart';
import 'appRouter.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: EventRoute.page,
          path: '/',
        ),
        AutoRoute(
          path: '/detail',
          page: DetailedRoute.page,
        ),
      ];
}
