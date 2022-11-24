import 'package:charter_flutter/data/data_sources/http/dio_http_source.dart';
import 'package:charter_flutter/data/data_sources/http/http_source.dart';
import 'package:charter_flutter/data/repositories/auth_repository_impl.dart';
import 'package:charter_flutter/data/repositories/charterer_repository.dart';
import 'package:charter_flutter/domain/repositories/auth_repository.dart';
import 'package:charter_flutter/domain/repositories/charterer_repository.dart';
import 'package:charter_flutter/presentation/bloc/auth/auth_cubit.dart';
import 'package:charter_flutter/presentation/bloc/charterer/search/search_cubit.dart';
import 'package:charter_flutter/presentation/bloc/core/theme_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory<ThemeBloc>(() => ThemeBloc());
  sl.registerFactory<AuthCubit>(() => AuthCubit(authRepository: sl.call()));
  sl.registerFactory<SearchCubit>(
      () => SearchCubit(charatererRepository: sl.call()));

  sl.registerLazySingleton<HttpSource>(() => DioHttpService());
  sl.registerLazySingleton<AuthRepository>(() => HttpAuthRepository(sl.call()));
  sl.registerLazySingleton<ChartererRepository>(
      () => HttpChartererRepository(sl.call()));
}
