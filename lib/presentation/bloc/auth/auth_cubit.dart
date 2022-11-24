import 'package:charter_flutter/domain/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../injection_container.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit({required this.authRepository}) : super(AuthInitial());

  Future<void> login() async {
    try {
      String token = await authRepository.login();
      await sl.get<SharedPreferences>().setString("token", token);
      emit(Authenticated(idToken: token));
    } catch (_) {
      emit(UnAuthenticated());
    }
  }
}
