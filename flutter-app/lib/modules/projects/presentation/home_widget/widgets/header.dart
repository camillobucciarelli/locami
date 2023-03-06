part of '../../home_widget/projects_home_widget.dart';

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: Spacing.m,
      runSpacing: Spacing.m,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text('Projects', style: Theme.of(context).textTheme.titleLarge),
        ElevatedButton(
          onPressed: () => const CreateProjectPageRoute().go(context),
          child: const Text('Create a new project'),
        ),
      ],
    );
  }
}
