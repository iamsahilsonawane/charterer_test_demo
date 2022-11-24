import 'package:charter_flutter/presentation/bloc/auth/auth_cubit.dart';
import 'package:charter_flutter/presentation/bloc/core/theme_bloc.dart';
import 'package:charter_flutter/presentation/bloc/core/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_router.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(sharedPref);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<ThemeBloc>()),
        BlocProvider(create: (_) => di.sl<AuthCubit>()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (BuildContext context, ThemeState themeState) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Charterer',
          theme: themeState.themeData,
          navigatorKey: AppRouter.navigatorKey,
          onGenerateRoute: AppRouter.onGenerateRoute,
        );
      }),
    );
  }
}
