import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error_management/failure.dart';
import '../models/project.dart';
import '../models/project_user.dart';
import '../models/user_roles.dart';
import 'projects_data_source.dart';

@LazySingleton(as: ProjectsDataSource)
class FirestoreProjectsDataSource implements ProjectsDataSource {
  final FirebaseFirestore _firestore;
  final CollectionReference<Map<String, dynamic>> _projectsCollection;
  final String? _signedInUserId;

  FirestoreProjectsDataSource()
      : _firestore = FirebaseFirestore.instance,
        _projectsCollection = FirebaseFirestore.instance.collection('projects'),
        _signedInUserId = FirebaseAuth.instance.currentUser?.uid;

  @override
  Future<String> addNewProject(Project project) async {
    final doc = await _projectsCollection.add(project.toJson());

    return doc.id;
  }

  @override
  Future<void> updateProject(Project project) {
    return _projectsCollection.doc(project.id).update(project.toJson());
  }

  @override
  Future<void> deleteProject(String projectId) {
    return _projectsCollection.doc(projectId).delete();
  }

  @override
  Stream<List<Project>> watchProjects() {
    final signedInUserWithRoles = UserRoles.values
        .map((e) => ProjectUser(ref: _firestore.doc('users/$_signedInUserId'), role: e).toJson())
        .toList();

    return _projectsCollection
        .where('users', arrayContainsAny: signedInUserWithRoles)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => Project.fromFirestore(doc.data(), id: doc.id)).toList());
  }

  @override
  Future<List<Project>> getProjects() async {
    final signedInUserWithRoles = UserRoles.values
        .map((e) => ProjectUser(ref: _firestore.doc('users/$_signedInUserId'), role: e).toJson())
        .toList();

    final result = await _projectsCollection
        .where('users', arrayContainsAny: signedInUserWithRoles)
        .orderBy('createdAt', descending: true)
        .get();

    return result.docs.map((doc) => Project.fromFirestore(doc.data(), id: doc.id)).toList();
  }

  @override
  Future<Project> getProject(String projectId) async {
    final doc = await _projectsCollection.doc(projectId).get();
    final data = doc.data();
    if (data != null) {
      return Project.fromFirestore(data, id: doc.id);
    }
    throw const NotFoundFailure();
  }
}
