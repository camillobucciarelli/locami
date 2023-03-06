part of 'project_home_widget_cubit.dart';

abstract class ProjectHomeWidgetState extends Equatable {
  const ProjectHomeWidgetState();
}

class ProjectHomeWidgetInitial extends ProjectHomeWidgetState {
  const ProjectHomeWidgetInitial();

  @override
  List<Object> get props => [];
}

class ProjectHomeWidgetProgress extends ProjectHomeWidgetState {
  const ProjectHomeWidgetProgress();

  @override
  List<Object> get props => [];
}

class ProjectHomeWidgetHasProjects extends ProjectHomeWidgetState {
  final List<Project> projects;

  const ProjectHomeWidgetHasProjects(this.projects);

  @override
  List<Object> get props => [projects];
}

class ProjectHomeWidgetNoProjects extends ProjectHomeWidgetState {
  const ProjectHomeWidgetNoProjects();

  @override
  List<Object> get props => [];
}

class ProjectHomeWidgetError extends ProjectHomeWidgetState {
  final Failure failure;

  const ProjectHomeWidgetError(this.failure);

  @override
  List<Object> get props => [failure];
}
