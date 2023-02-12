part of '../home_page.dart';

class _Actions extends StatelessWidget {
  static const double _buttonWidth = 250;
  const _Actions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rowSpacing = ResponsiveSpacing.s(context);
    final columnSpacing = rowSpacing;

    return ResponsiveRowColumn(
      layout: ResponsiveWrapper.of(context).isSmallerThan(BreakPoints.tablet.name)
          ? ResponsiveRowColumnType.COLUMN
          : ResponsiveRowColumnType.ROW,
      rowMainAxisAlignment: MainAxisAlignment.center,
      columnCrossAxisAlignment: CrossAxisAlignment.center,
      rowSpacing: rowSpacing,
      columnSpacing: columnSpacing,
      rowPadding: const EdgeInsets.symmetric(vertical: Spacing.xxl),
      columnPadding: const EdgeInsets.symmetric(horizontal: Spacing.xxl),
      children: [
        ResponsiveRowColumnItem(
          child: SizedBox(
            width: _buttonWidth,
            child: ElevatedButton(
              onPressed: () => const LoginPageRoute().go(context),
              child: Text(LocaleKeys.home_page_sign_in.tr()),
            ),
          ),
        ),
        ResponsiveRowColumnItem(
          child: SizedBox(
            width: _buttonWidth,
            child: ElevatedButton(
              onPressed: ()  => const RegisterPageRoute().go(context),
              child: Text(LocaleKeys.home_page_register.tr()),
            ),
          ),
        ),
      ],
    );
  }
}
