import 'package:dartz/dartz.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/errors/failures.dart';
import '../entities/snippet.dart';
import '../repositories/snippet_repository.dart';

class GetRandomSnippet implements UseCase<Snippet, NoParams> {
  final SnippetRepository snippetRepository;

  GetRandomSnippet({required this.snippetRepository});
  @override
  Future<Either<Failure, Snippet>> call(NoParams params) =>
      snippetRepository.getRandomSnippet();
}
