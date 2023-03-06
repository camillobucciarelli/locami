import '../models/project.dart';

abstract class ProjectsDataSource {
  Future<String> addNewProject(Project project);

  Future<void> updateProject(Project project);

  Future<void> deleteProject(String projectId);

  Future<Project> getProject(String projectId);

  Stream<List<Project>> watchProjects();

  Future<List<Project>> getProjects();
}
