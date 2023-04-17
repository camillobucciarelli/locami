import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../data/models/project_user.dart';
import '../../../data/models/user_roles.dart';
import 'rows/project_user_row.dart';

part 'create_project_user_form.dart';

class ProjectUserTableWidget extends StatelessWidget {
  const ProjectUserTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ProjectUserRow(
          ProjectUser(
            ref: FirebaseFirestore.instance.collection('users').doc('jRiSMcD1PKaQbX83w9B2beXWxZj2'),
            role: UserRoles.owner,
          ),
        ),
      ],
    );
  }
}
