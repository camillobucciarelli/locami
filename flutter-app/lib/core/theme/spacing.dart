part of 'theme.dart';

class Spacing {
  static const double none = 0.0;

  // Size short tag
  // ignore: prefer-correct-identifier-length
  static const double xs = 4.0;

  // Size short tag
  // ignore: prefer-correct-identifier-length
  static const double s = 8.0;

  // Size short tag
  // ignore: prefer-correct-identifier-length
  static const double m = 16.0;

  // Size short tag
  // ignore: prefer-correct-identifier-length
  static const double l = 24.0;

  // Size short tag
  // ignore: prefer-correct-identifier-length
  static const double xl = 32.0;

  // Size short tag
  // ignore: prefer-correct-identifier-length
  static const double xxl = 40.0;
}

class ResponsiveSpacing {
  static double none(BuildContext context) => _getSpacing(context, Spacing.none);

  static double xs(BuildContext context) => _getSpacing(context, Spacing.xs);

  static double s(BuildContext context) => _getSpacing(context, Spacing.s);

  static double m(BuildContext context) => _getSpacing(context, Spacing.m);

  static double l(BuildContext context) => _getSpacing(context, Spacing.l);

  static double xl(BuildContext context) => _getSpacing(context, Spacing.xl);

  static double xxl(BuildContext context) => _getSpacing(context, Spacing.xxl);

  static double custom(BuildContext context, double value, ) => _getSpacing(context, value);
}

class _SpacingMultipliers {
  static const double mobilePortrait = 1.0;
  static const double mobileLandscape = 1.0;
  static const double tablet = 1.0;
  static const double desktopS = 2.0;
  static const double desktopM = 2.0;
  static const double desktopL = 2.0;
  static const double desktopXL = 2.0;
}

double _getSpacing(BuildContext context, double defaultValue) {
  return ResponsiveValue<double>(
        context,
        defaultValue: defaultValue,
        valueWhen: [
          Condition.largerThan(
            name: BreakPoints.mobilePortrait.name,
            value: defaultValue * _SpacingMultipliers.mobilePortrait,
          ),
          Condition.largerThan(
            name: BreakPoints.mobileLandscape.name,
            value: defaultValue * _SpacingMultipliers.mobileLandscape,
          ),
          Condition.largerThan(
            name: BreakPoints.tablet.name,
            value: defaultValue * _SpacingMultipliers.tablet,
          ),
          Condition.largerThan(
            name: BreakPoints.desktopS.name,
            value: defaultValue * _SpacingMultipliers.desktopS,
          ),
          Condition.largerThan(
            name: BreakPoints.desktopM.name,
            value: defaultValue * _SpacingMultipliers.desktopM,
          ),
          Condition.largerThan(
            name: BreakPoints.desktopL.name,
            value: defaultValue * _SpacingMultipliers.desktopL,
          ),
          Condition.largerThan(
            name: BreakPoints.desktopXL.name,
            value: defaultValue * _SpacingMultipliers.desktopXL,
          ),
        ],
      ).value ??
      defaultValue;
}
