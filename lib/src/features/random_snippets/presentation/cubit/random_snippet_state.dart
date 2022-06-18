part of 'random_snippet_cubit.dart';

@immutable
abstract class RandomSnippetState extends Equatable {
  const RandomSnippetState();
  @override
  List<Object?> get props => [];
}

class RandomSnippetInitial extends RandomSnippetState {}

class RandomSnippetIsLoading extends RandomSnippetState {}

class RandomSnippetIsLoaded extends RandomSnippetState {
  final Snippet snippet;
  const RandomSnippetIsLoaded({required this.snippet});
  @override
  List<Object?> get props => [snippet];
}

class RandomSnippetError extends RandomSnippetState {
  final String msg;
  const RandomSnippetError({required this.msg});
  @override
  List<Object?> get props => [msg];
}
