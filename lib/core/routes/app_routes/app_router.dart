import 'package:aitebar/core/routes/app_routes/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  static const welcome = '/welcome';
  static const signIn = '/sign-in';
  static const signUp = '/sign-up';

// dashboard and  tabs
  static const dashboard = '/dashboard';
  static const home = 'home';
  static const profile = 'profile';
  static const requestedFunds = 'requested-funds';
  static const settings = 'settings';

  static var forgotPassword = '/forgot-password';
  static var mainPage = '/main';

  @override
  RouteType get defaultRouteType => const RouteType.cupertino();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, path: '/'),
    AutoRoute(page: WelcomeRoute.page, path: welcome),
    AutoRoute(path: dashboard, page: DashboardRoute.page, children: [
      AutoRoute(path: requestedFunds, page: RequestedFundsRoute.page),
      AutoRoute(path: settings, page: SettingsRoute.page),
    ]),
    AutoRoute(path: signIn, page: SignInRoute.page),
    AutoRoute(path: signUp, page: SignUpRoute.page),
    AutoRoute(path: forgotPassword, page: ForgotPasswordRoute.page),
    AutoRoute(path: '/create-funds-request', page: CreateFundsRequestRoute.page),
    AutoRoute(path: '/funds-request-details', page: AVFundsRequestDetailsRoute.page),
  ];
}
