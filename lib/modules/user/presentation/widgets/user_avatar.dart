import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:italia_design_system/italia_design_system.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../cubit/user_cubit.dart';
import '../profile/profile_page.dart';
import 'user_signed_in_selector.dart';

class UserAvatar extends StatelessWidget {
  final bool showDisplayName;

  const UserAvatar({
    super.key,
    this.showDisplayName = true,
  });

  @override
  Widget build(BuildContext context) {
    return UserSignedIdSelector(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(Spacing.xs),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(RadiusD.m),
            child: InkWell(
              hoverColor: ItaliaColors.primary.getVariant(ColorVariant.c11)?.withOpacity(0.05),
              onTap: () => context.go(ProfilePage.routeName),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: Spacing.s),
                  if (showDisplayName &&
                      ResponsiveWrapper.of(context).isLargerThan(Breakpoints.m.name)) ...[
                    _displayName(state),
                    const SizedBox(width: Spacing.s),
                  ],
                  _avatar(state),
                  const SizedBox(width: Spacing.s),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  CircleAvatar _avatar(UserSignedIn? state) {
    return CircleAvatar(
      child: FittedBox(
        child: Text(
          state?.user.displayName?.split(' ').fold('', (s, e) => '$s${e.substring(0, 1)}') ?? '',
          style: TitilliumTextStyles.button(color: ItaliaTextColors.textOnDarkSurface)
              .copyWith(height: 0),
        ),
      ),
    );
  }

  Widget _displayName(UserSignedIn? state) {
    return Text(
      state?.user.displayName ?? '',
      style: TitilliumTextStyles.button(),
    );
  }
}
