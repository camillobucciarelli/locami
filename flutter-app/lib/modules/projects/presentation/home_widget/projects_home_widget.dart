import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common_ui/app_card.dart';
import '../../../../core/dependency_injection/dependency_injection.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/theme.dart';
import 'state/project_home_widget_cubit.dart';

part '../home_widget/widgets/header.dart';
part '../home_widget/widgets/no_projects_found.dart';

class ProjectsHomeWidget extends StatelessWidget {
  const ProjectsHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProjectHomeWidgetCubit>(
      create: (context) => injector()..loadProjects(),
      child: AppCard(
        padding: const EdgeInsets.all(Spacing.m),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _Header(),
            const SizedBox(height: Spacing.m),
            BlocBuilder<ProjectHomeWidgetCubit, ProjectHomeWidgetState>(
              builder: (context, state) {
                if (state is ProjectHomeWidgetProgress) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is ProjectHomeWidgetHasProjects) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: state.projects.map((e) => Text(e.name)).toList(),
                  );
                }

                return const _NoProjectsFound();
              },
            ),
          ],
        ),
      ),
    );
  }
}
