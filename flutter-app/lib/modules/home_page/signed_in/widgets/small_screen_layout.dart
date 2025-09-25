part of '../dashboard.dart';

class SmallScreenLayout extends SliverChildListDelegate {
  SmallScreenLayout()
      : super([
          const ProjectsHomeWidget(),
          const SizedBox(height: Spacing.m),
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
          const SizedBox(height: Spacing.m),
          Container(
            color: Colors.red,
            height: 200,
          ),
        ]);
}
