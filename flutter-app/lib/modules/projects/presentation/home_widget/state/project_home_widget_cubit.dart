import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error_management/failure.dart';
import '../../../../../utils/extensions/stream_extension.dart';
import '../../../data/models/project.dart';
import '../../../domain/repositories/projects_repository.dart';

part 'project_home_widget_state.dart';

@injectable
class ProjectHomeWidgetCubit extends Cubit<ProjectHomeWidgetState> {
  final ProjectsRepository _repository;
  ProjectHomeWidgetCubit(this._repository) : super(const ProjectHomeWidgetProgress());

  void loadProjects() {
    _repository.watchProjects().actions(
      progress: () => emit(const ProjectHomeWidgetProgress()),
      success: (projects) {
        if (projects.isEmpty) {
          emit(const ProjectHomeWidgetNoProjects());
        } else {
          emit(ProjectHomeWidgetHasProjects(projects));
        }
      },
      failure: (error) => emit(ProjectHomeWidgetError(error)),
    );
  }
}
