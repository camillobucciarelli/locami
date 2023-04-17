import '../../../../translations/translations_keys.g.dart';

enum UserRoles {
  owner(LocaleKeys.projects_user_roles_owner),
  developer(LocaleKeys.projects_user_roles_developer),
  editor(LocaleKeys.projects_user_roles_editor);

  final String labelKey;
  const UserRoles(this.labelKey);
}
