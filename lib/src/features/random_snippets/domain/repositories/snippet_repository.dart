import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/snippet.dart';

abstract class SnippetRepository {
  Future<Either<Failure, Snippet>> getRandomSnippet();
}
