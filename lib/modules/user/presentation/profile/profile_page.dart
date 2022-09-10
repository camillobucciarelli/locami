import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:italia_design_system/italia_design_system.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../data/models/user_roles.dart';
import '../../../../router.dart';
import '../../../_commons/widgets/loader_button.dart';
import '../cubit/user_cubit.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile';
  static final GoRoute route = GoRoute(
    path: ProfilePage.routeName,
    pageBuilder: buildPage(const ProfilePage()),
  );

  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formControl = FormControl<UserRoles>(
    validators: [
      Validators.required,
    ],
  );

  @override
  Widget build(BuildContext context) {
    _initDropdownValue(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ResponsiveSpacing.xxl(context)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ReactiveDropdownField<UserRoles>(
              items: UserRoles.values
                  .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                  .toList(),
              formControl: _formControl,
            ),
            const SizedBox(height: Spacing.m),
            BlocSelector<UserCubit, UserState, bool>(
              selector: (state) => state is ChangeUserClaimsProgress,
              builder: (context, state) {
                return LoaderButton.elevated(
                  text: 'Assegna all\'utente corrente',
                  loadingSemanticLabel: 'Assegnazione ruolo in corso...',
                  loading: state,
                  onPressed: () {
                    _formControl.markAsTouched();
                    if (_formControl.value != null) {
                      context.read<UserCubit>().updateUserRole(_formControl.value!);
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _initDropdownValue(BuildContext context) {
    final userState = context.watch<UserCubit>().state;
    if (userState is UserSignedIn) {
      final claims = userState.customClaims;
      _formControl.updateValue(claims?.role);
    }
  }
}
