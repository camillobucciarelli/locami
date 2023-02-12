import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../modules/user/presentation/state/user_cubit.dart';

import '../../modules/home_page/guest/home_page.dart';
import '../../modules/home_page/signed_in/dashboard.dart';
import '../../modules/user/presentation/login/login_page.dart';
import '../../modules/user/presentation/profile/profile_page.dart';
import '../../modules/user/presentation/register/register_page.dart';

part '../../modules/home_page/home_route.dart';

part '../../modules/user/presentation/user_routes.dart';

part 'app_router.g.dart';

final appRouter = GoRouter(
  routes: $appRoutes,
  redirect: (BuildContext context, GoRouterState state) {
    final isSignedIn = context.read<UserCubit>().state is UserSignedInState;
    final loggingInOrRegistering =
        state.subloc == const LoginPageRoute().location || state.subloc == const RegisterPageRoute().location;
    if (!isSignedIn && !loggingInOrRegistering) {
      return const HomeRoute().location;
    }

    return null;
  },
  debugLogDiagnostics: true,
);
