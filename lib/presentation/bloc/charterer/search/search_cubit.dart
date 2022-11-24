import 'package:charter_flutter/data/exceptions/http_exception.dart';
import 'package:charter_flutter/domain/repositories/charterer_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final ChartererRepository charatererRepository;

  SearchCubit({required this.charatererRepository}) : super(SearchInitial());

  Future<void> search(String query) async {
    try {
      emit(SearchLoading());
      if (query == "") {
        emit(const SearchData(results: []));
        return;
      }
      List<String> charaterers =
          await charatererRepository.searchCharterers(query);
      emit(SearchData(results: charaterers));
    } catch (e) {
      if (e is HttpException) {
        emit(SearchError(e.message ?? "Something went wrong"));
      } else {
        emit(SearchError(e.toString()));
      }
    }
  }
}
