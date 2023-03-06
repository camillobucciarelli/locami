// Abstract class for the Projects repository
import '../../data/models/project.dart';

abstract class ProjectsRepository {
  Future<String> addNewProject(Project project);

  Future<void> updateProject(Project project);

  Future<void> deleteProject(String projectId);

  Future<Project> getProject(String projectId);

  Stream<List<Project>> watchProjects();

  Future<List<Project>> getProjects();
}
