import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../modules/home_page/guest/home_page.dart';
import '../../modules/home_page/signed_in/dashboard.dart';
import '../../modules/projects/presentation/create/create_project_page.dart';
import '../../modules/user/presentation/profile/profile_page.dart';
import '../../modules/user/presentation/register/register_page.dart';
import '../../modules/user/presentation/sign_in/sign_in_page.dart';
import '../../modules/user/presentation/state/user_cubit.dart';

part '../../modules/home_page/home_route.dart';

part '../../modules/projects/presentation/projects_routes.dart';

part '../../modules/user/presentation/user_routes.dart';

part 'app_router.g.dart';

final appRouter = GoRouter(
  routes: $appRoutes,
  redirect: (BuildContext context, GoRouterState state) {
    final isSignedIn = context.read<UserCubit>().state is UserSignedInState;
    final loggingInOrRegistering =
        state.subloc == const SignInPageRoute().location || state.subloc == const RegisterPageRoute().location;
    if (!isSignedIn && !loggingInOrRegistering) {
      return const SignInPageRoute().location;
    }

    return null;
  },
  debugLogDiagnostics: true,
);
