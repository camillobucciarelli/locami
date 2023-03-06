part of 'package:locami/core/router/app_router.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserSignedInState) {
          return const Dashboard();
        }

        return const HomePage();
      },
      buildWhen: (previous, current) => current is UserStatusState && previous != current,
    );
  }
}
