import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/states/user_state.dart';

base class AuthBloc extends Cubit<UserState> {
  AuthBloc() : super(UserStateInitial());
}
