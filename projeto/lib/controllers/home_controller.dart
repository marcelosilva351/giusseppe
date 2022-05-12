import 'package:mobx/mobx.dart';
import 'package:projeto/models/post_model.dart';
import 'package:projeto/repositorys/post_repository.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  var repository = PostRepository();

  @observable
  ObservableFuture<List<PostModel>>? posts;

  @action
  preencherListaPost() {
    try {
      posts = ObservableFuture(repository.getPosts());
    } catch (erro) {
      throw Exception();
    }
  }
}
