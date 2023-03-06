
import 'package:injectable/injectable.dart';

import '../../../../core/error_management/failure.dart';
import '../../domain/repositories/projects_repository.dart';
import '../data_sources/projects_data_source.dart';
import '../models/project.dart';

@LazySingleton(as: ProjectsRepository)
class ProjectsRepositoryImpl implements ProjectsRepository {
  final ProjectsDataSource _dataSource;

  ProjectsRepositoryImpl(this._dataSource);

  @override
  Future<String> addNewProject(Project project) {
    return runSafetyFuture(() => _dataSource.addNewProject(project));
  }

  @override
  Future<void> updateProject(Project project) {
    return runSafetyFuture(() => _dataSource.updateProject(project));
  }

  @override
  Future<void> deleteProject(String projectId) {
    return runSafetyFuture(() => _dataSource.deleteProject(projectId));
  }

  @override
  Future<List<Project>> getProjects() {
    return runSafetyFuture(_dataSource.getProjects);
  }

  @override
  Stream<List<Project>> watchProjects() {
    return runSafetyStream(_dataSource.watchProjects);
  }

  @override
  Future<Project> getProject(String projectId) {
    return runSafetyFuture(() => _dataSource.getProject(projectId));
  }
}
