import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/user_cubit.dart';

class UserSignedIdSelector extends StatelessWidget {
  final BlocWidgetBuilder<UserSignedIn?> builder;

  const UserSignedIdSelector({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<UserCubit, UserState, UserSignedIn?>(
      selector: (state) {
        if (state is UserSignedIn) {
          return state;
        }
        return null;
      },
      builder: builder,
    );
  }
}
