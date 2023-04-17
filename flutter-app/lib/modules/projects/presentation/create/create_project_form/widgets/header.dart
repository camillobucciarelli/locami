part of '../create_project_form_widget.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        LocaleKeys.projects_create_project_form_title.tr(),
        style: Theme.of(context).textTheme.headlineLarge,
        textAlign: TextAlign.left,
      ),
    );
  }
}
