import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/usecases/get_random_snippet.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../domain/entities/snippet.dart';
part 'random_snippet_state.dart';

class RandomSnippetCubit extends Cubit<RandomSnippetState> {
  RandomSnippetCubit(this.getRandomSnippetUseCase)
      : super(RandomSnippetInitial());
  GetRandomSnippet getRandomSnippetUseCase;
  Future<void> getRandomSnippet() async {
    final response = await getRandomSnippetUseCase(NoParams());
    response.fold(
        (failure) => emit(RandomSnippetError(msg: _mapFailure(failure))),
        (snippet) => emit(RandomSnippetIsLoaded(snippet: snippet)));
  }

  String _mapFailure(Failure failure) {
    switch (failure.runtimeType) {
      case CacheFailure:
        return AppStrings.cacheFailure;
      case ServerFailure:
        return AppStrings.serverFailure;
      default:
        return AppStrings.unExpectedError;
    }
  }
}
