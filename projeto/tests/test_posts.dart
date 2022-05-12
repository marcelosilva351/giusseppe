import 'package:flutter_test/flutter_test.dart';
import 'package:projeto/repositorys/post_repository.dart';

void main() {
  var repostoryTest = PostRepository();

  test('retorna lista de posts', () async {
    await repostoryTest.getPosts();
  });
}
