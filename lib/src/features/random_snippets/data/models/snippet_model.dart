import '../../domain/entities/snippet.dart';

class SnippetModel extends Snippet {
  const SnippetModel(
      {required String author,
      required String id,
      required String content,
      required String permalink})
      : super(
          author: author,
          id: id,
          content: content,
          permalink: permalink,
        );
  factory SnippetModel.fromJson(Map<String, dynamic> json) => SnippetModel(
        author: json["author"],
        id: json["id"],
        content: json["content"],
        permalink: json["permalink"],
      );
  Map<String, dynamic> toJson() => {
        "author": author,
        "id": id,
        "content": content,
        "permalink": permalink,
      };
}
