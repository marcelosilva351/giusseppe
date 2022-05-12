import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projeto/models/post_model.dart';

class PostRepository {
  Future<List<PostModel>> getPosts() async {
    List<PostModel> postsReturn = [];
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    var requisicao = await http.get(url, headers: {
      'api-key': 'application/json; charset=UTF-8',
    });

    if (requisicao.statusCode == 200) {
      var requisicaoMap = jsonDecode(requisicao.body);

      for (var post in requisicaoMap) {
        var postAdd = PostModel(post['title'], post['body']);
        postsReturn.add(postAdd);
      }
      return postsReturn;
    } else {
      throw Exception();
    }
  }
}
