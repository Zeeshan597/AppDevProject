import 'package:aitebar/core/routes/app_routes/app_router.dart';
import 'package:aitebar/core/routes/navigation_observer.dart';
import 'package:aitebar/core/theme/theme_provider.dart';
import 'package:aitebar/core/theme/theme_light.dart';
import 'package:aitebar/core/theme/theme_dark.dart';
import 'package:aitebar/mobile/features/auth/presentation/blocs/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

final _appRouter = AppRouter();

class AitebarApp extends StatelessWidget {
  const AitebarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(create: (_) => UserCubit()),
      ],
      child: ChangeNotifierProvider(
        create: (_) => ThemeProvider(ThemeLight()),
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return MaterialApp.router(
              theme: themeProvider.currentTheme.theme,
              routeInformationParser: _appRouter.defaultRouteParser(),
              routerDelegate: _appRouter.delegate(navigatorObservers: () => [NavigationObserver()]),
              debugShowCheckedModeBanner: false,
            );
          },
        ),
      ),
    );
  }
}
