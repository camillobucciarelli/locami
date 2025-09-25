part of '../dashboard.dart';

class LargeScreenLayout extends SliverChildListDelegate {
  LargeScreenLayout()
      : super([
          const ProjectsHomeWidget(),
          Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const TranslationGeneratorPage(),
                  ),
                );
              },
              child: const Text('Translation Generator'),
            );
          }),
        ]);
}