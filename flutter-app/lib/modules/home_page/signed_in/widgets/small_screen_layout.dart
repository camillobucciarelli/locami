part of '../dashboard.dart';

class SmallScreenLayout extends SliverChildListDelegate {
  SmallScreenLayout()
      : super([
          const ProjectsHomeWidget(),
          const SizedBox(height: Spacing.m),
          Container(
            color: Colors.red,
            height: 200,
          ),
        ]);
}
