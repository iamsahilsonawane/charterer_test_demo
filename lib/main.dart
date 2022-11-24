import 'package:charter_flutter/presentation/bloc/core/theme_bloc.dart';
import 'package:charter_flutter/presentation/bloc/core/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<ThemeBloc>()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (BuildContext context, ThemeState themeState) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Charterer',
          theme: themeState.themeData,
        );
      }),
    );
  }
}
