import 'dart:convert';

import 'package:clean_code_snippets/src/core/errors/exceptions.dart';
import 'package:clean_code_snippets/src/core/utils/app_strings.dart';
import 'package:clean_code_snippets/src/features/random_snippets/data/models/snippet_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RandomSnippetLocalDataSource {
  // get the last cached snippet
  Future<SnippetModel> getLastRandomSnippet();
  Future<void> cacheSnippet(SnippetModel snippetModel);
}

class RandomSnippetLocalDataSourceImpl implements RandomSnippetLocalDataSource {
  final SharedPreferences sharedPreferences;

  RandomSnippetLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<SnippetModel> getLastRandomSnippet() {
    final jsonString =
        sharedPreferences.getString(AppStrings.cachedRandomSnippet);
    if (jsonString != null) {
      final cachedRandomSnippet =
          Future.value(SnippetModel.fromJson(json.decode(jsonString)));
      return cachedRandomSnippet;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheSnippet(SnippetModel snippetModel) {
    return sharedPreferences.setString(
        AppStrings.cachedRandomSnippet, json.encode(snippetModel));
  }
}
