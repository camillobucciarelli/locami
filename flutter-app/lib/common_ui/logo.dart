import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/theme/assets.g.dart';
import '../translations/translations_keys.g.dart';

class Logo extends StatelessWidget {
  final String asset;

  const Logo.light({super.key}) : asset = Assets.assetsImagesLogoLightSvg;

  const Logo.dark({super.key}) : asset = Assets.assetsImagesLogoDarkSvg;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      fit: BoxFit.contain,
      semanticsLabel: LocaleKeys.semantics_labels_locami_logo.tr(),
    );
  }
}
