part of '../../home_widget/projects_home_widget.dart';

class _NoProjectsFound extends StatelessWidget {
  const _NoProjectsFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.m),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('No projects found'),
        ],
      ),
    );
  }
}
