import 'package:mvvm/model/posts_model.dart';

abstract class PostsRepo {
  Future<List<PostModel>> getAllPosts();

  Future<PostModel> getPostById(int id);
}
