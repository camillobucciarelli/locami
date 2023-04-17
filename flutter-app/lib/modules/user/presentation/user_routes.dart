part of 'package:locami/core/router/app_router.dart';

@TypedGoRoute<UserRoutes>(
  path: '/user',
  routes: [
    TypedGoRoute<ProfilePageRoute>(
      path: ':uid/profile',
    ),
  ],
)
class UserRoutes extends GoRouteData {
  const UserRoutes();

  @override
  String? redirect(BuildContext context, GoRouterState state) {
    final userState = context.read<UserCubit>().state;
    if (userState is UserSignedInState) {
      return ProfilePageRoute(uid: userState.user.uid).location;
    }

    return const HomeRoute().location;
  }

  @override
  Widget build(BuildContext context, GoRouterState state) => const SizedBox.shrink();
}

class ProfilePageRoute extends GoRouteData {
  final String uid;

  const ProfilePageRoute({required this.uid});

  @override
  Widget build(BuildContext context, GoRouterState state) => ProfilePage(uid: uid);
}

@TypedGoRoute<SignInPageRoute>(
  path: '/sign-in',
)
class SignInPageRoute extends GoRouteData {
  const SignInPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SignInPage();
}

@TypedGoRoute<RegisterPageRoute>(
  path: '/register',
)
class RegisterPageRoute extends GoRouteData {
  const RegisterPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const RegisterPage();
}
