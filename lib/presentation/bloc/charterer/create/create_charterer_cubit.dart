import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/exceptions/http_exception.dart';
import '../../../../domain/repositories/charterer_repository.dart';
import 'package:equatable/equatable.dart';

part 'create_charterer_state.dart';

class CreateChartererCubit extends Cubit<CreateChartererState> {
  final ChartererRepository chartererRepository;

  CreateChartererCubit({required this.chartererRepository})
      : super(CreateChartererInitial());

  Future<void> createCharterer(dynamic data) async {
    try {
      emit(CreateChartererLoading());
      final resp = await chartererRepository.addCharterer(data);
      debugPrint("createCharterer [CUBIT]: $resp");
      emit(const CreateChartererSuccess());
    } catch (e) {
      if (e is HttpException) {
        emit(CreateChartererError(e.message ?? "Something went wrong"));
      } else {
        emit(CreateChartererError(e.toString()));
      }
    }
  }
}
