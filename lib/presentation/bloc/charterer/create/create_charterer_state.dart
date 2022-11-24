part of 'create_charterer_cubit.dart';

// import 'package:equatable/equatable.dart';

abstract class CreateChartererState extends Equatable {
  const CreateChartererState();
}

class CreateChartererLoading extends CreateChartererState {
  @override
  List<Object> get props => [];
}

class CreateChartererInitial extends CreateChartererState {
  @override
  List<Object> get props => [];
}

class CreateChartererSuccess extends CreateChartererState {
  const CreateChartererSuccess();
  @override
  List<Object> get props => [];
}

class CreateChartererError extends CreateChartererState {
  final String error;

  const CreateChartererError(this.error);
  @override
  List<Object> get props => [];
}
