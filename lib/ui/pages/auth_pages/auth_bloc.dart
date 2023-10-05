import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/data_base_helper.dart';
import '/core/states/user_state.dart';

base class AuthBloc extends Cubit<UserState> {
  final DataBaseHelper dataBase;

  AuthBloc({required this.dataBase}) : super(UserStateInitial());
}
