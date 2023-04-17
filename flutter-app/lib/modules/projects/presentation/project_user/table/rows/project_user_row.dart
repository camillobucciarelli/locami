import 'package:flutter/material.dart';

import '../../../../../../core/theme/theme.dart';
import '../../../../../user/data/models/application_user.dart';
import '../../../../data/models/project_user.dart';

class ProjectUserRow extends StatelessWidget {
  final ProjectUser projectUser;

  const ProjectUserRow(this.projectUser, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApplicationUser>(
      future: projectUser.user,
      builder: (context, user) {
        if (user.hasData) {
          final data = user.data;
          if(data != null) {
            return Wrap(
              direction: Axis.horizontal,
              spacing: Spacing.s,
              runSpacing: Spacing.s,
              children: [
                Text(data.email),
                Text(projectUser.role.toString()),
                Text('Actions'),
              ],
            );
          }
        }

        return const SizedBox();
      },
    );
  }
}
