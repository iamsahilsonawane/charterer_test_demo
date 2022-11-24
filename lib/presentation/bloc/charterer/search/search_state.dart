part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchLoading extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchData extends SearchState {
  final List<String> results;

  const SearchData({required this.results});
  @override
  List<Object> get props => [];
}

class SearchError extends SearchState {
  final String error;

  const SearchError(this.error);
  @override
  List<Object> get props => [];
}
