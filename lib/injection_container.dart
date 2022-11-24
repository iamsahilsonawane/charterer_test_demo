import 'package:charter_flutter/presentation/bloc/core/theme_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory<ThemeBloc>(() => ThemeBloc());
}
