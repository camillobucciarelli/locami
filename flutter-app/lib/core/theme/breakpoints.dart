import 'package:responsive_framework/responsive_wrapper.dart';

enum BreakPoints {
  mobilePortrait(478, behavior: ResponsiveBehavior.resize),
  mobileLandscape(767),
  tablet(991),
  desktopS(1024),
  desktopM(1280),
  desktopL(1440),
  desktopXL(1920);

  final double value;
  final ResponsiveBehavior behavior;

  const BreakPoints(this.value, {this.behavior = ResponsiveBehavior.resize});

  static List<ResponsiveBreakpoint> get responsiveBreakpoints =>
      BreakPoints.values.map((e) {
        switch (e.behavior) {
          case ResponsiveBehavior.resize:
            return ResponsiveBreakpoint.resize(e.value, name: e.name);
          case ResponsiveBehavior.scale:
            return ResponsiveBreakpoint.autoScale(e.value, name: e.name);
        }
      }).toList();
}

enum ResponsiveBehavior {
  scale,
  resize,
}
