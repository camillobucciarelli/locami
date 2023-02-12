import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'core/dependency_injection/dependency_injection.dart';
import 'core/router/app_router.dart';
import 'core/theme/breakpoints.dart';
import 'core/theme/theme.dart';
import 'modules/user/presentation/state/user_cubit.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (context) => injector(),
      child: MaterialApp.router(
        routerConfig: appRouter,
        builder: (context, child) {
          return ResponsiveWrapper.builder(
            child,
            defaultScale: true,
            breakpoints: BreakPoints.responsiveBreakpoints,
          );
        },
        title: 'Locami',
        theme: lightTheme,
        themeMode: ThemeMode.system,
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
      ),
    );
  }
}
