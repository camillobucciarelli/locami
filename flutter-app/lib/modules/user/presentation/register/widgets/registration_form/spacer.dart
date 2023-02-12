part of 'registration_form_widget.dart';

class _Spacer extends ResponsiveStatelessWidget {
  const _Spacer({Key? key}) : super(key: key);

  @override
  Widget buildResponsive(BuildContext context, BoxConstraints constraints) {
    return const SizedBox(height: Spacing.m);
  }
}
