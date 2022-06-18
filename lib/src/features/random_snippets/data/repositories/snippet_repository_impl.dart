import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/newtork_info.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/snippet.dart';
import '../data_sources/random_snippet_local_data_source.dart';
import '../data_sources/random_snippet_remote_data_source.dart';
import '../../domain/repositories/snippet_repository.dart';
import 'package:dartz/dartz.dart';

class SnippetRepositoryImpl implements SnippetRepository {
  final NetworkInfo networkInfo;
  final RandomSnippetRemoteDataSource randomSnippetRemoteDataSource;
  final RandomSnippetLocalDataSource randomSnippetLocalDataSource;
  SnippetRepositoryImpl({
    required this.networkInfo,
    required this.randomSnippetRemoteDataSource,
    required this.randomSnippetLocalDataSource,
  });
  @override
  Future<Either<Failure, Snippet>> getRandomSnippet() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteRandomSnippet =
            await randomSnippetRemoteDataSource.getRandomSnippet();
        randomSnippetLocalDataSource.cacheSnippet(remoteRandomSnippet);
        return Right(remoteRandomSnippet);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final cacheRandomSnippet =
            await randomSnippetLocalDataSource.getLastRandomSnippet();
        return Right(cacheRandomSnippet);
      } on ServerException {
        return Left(CacheFailure());
      }
    }
  }
}
