part of 'package:locami/core/router/app_router.dart';

@TypedGoRoute<ProjectsRoutes>(
  path: '/projects',
  routes: [
    TypedGoRoute<CreateProjectPageRoute>(
      path: 'create',
    ),
  ],
)
class ProjectsRoutes extends GoRouteData {
  const ProjectsRoutes();

  @override
  String? redirect(BuildContext context, GoRouterState state) {
    if(state.location == const ProjectsRoutes().location) {
      return const HomeRoute().location;
    }

    return null;
  }
}

class CreateProjectPageRoute extends GoRouteData {
  const CreateProjectPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const CreateProjectPage();
}
