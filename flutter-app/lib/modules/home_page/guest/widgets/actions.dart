part of '../home_page.dart';

class _Actions extends ResponsiveStatelessWidget {
  static const double _buttonWidth = 250;

  const _Actions({Key? key}) : super(key: key);

  @override
  Widget buildResponsive(BuildContext context, BoxConstraints constraints) {
    final spacing = ResponsiveSpacing.m.w;
    final runSpacing = spacing;

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: spacing,
      runSpacing: runSpacing,
      children: [
        SizedBox(
          width: _buttonWidth,
          child: ElevatedButton(
            onPressed: () => const LoginPageRoute().go(context),
            child: Text(LocaleKeys.home_page_sign_in.tr()),
          ),
        ),
        SizedBox(
          width: _buttonWidth,
          child: ElevatedButton(
            onPressed: () => const RegisterPageRoute().go(context),
            child: Text(LocaleKeys.home_page_register.tr()),
          ),
        ),
      ],
    );
  }
}
