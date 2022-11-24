import 'package:charter_flutter/presentation/bloc/core/theme_event.dart';
import 'package:charter_flutter/presentation/bloc/core/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/themes.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(
            themeData: AppThemes.appThemeData[AppTheme.lightTheme]!)) {
    addListeners();
  }

  void addListeners() {
    on<ThemeEvent>((event, emit) {
      emit(
        ThemeState(themeData: AppThemes.appThemeData[event.appTheme]!),
      );
    });
  }
}
