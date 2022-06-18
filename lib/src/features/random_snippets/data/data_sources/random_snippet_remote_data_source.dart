import 'dart:convert';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/snippet_model.dart';
import 'package:http/http.dart' as http;

abstract class RandomSnippetRemoteDataSource {
  Future<SnippetModel> getRandomSnippet();
}

class RandomSnippetRemoteDataSourceImp
    implements RandomSnippetRemoteDataSource {
  http.Client client;
  RandomSnippetRemoteDataSourceImp({required this.client});
  @override
  Future<SnippetModel> getRandomSnippet() async {
    final response = await client.get(Uri.parse(EndPoints.randomSnippetUri),
        headers: {'content-type': 'application/json'});
    if (response.statusCode == 200) {
      return SnippetModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
