import 'package:mvvm/model/posts_model.dart';
import 'package:mvvm/repositories/posts/posts_repo.dart';
import 'package:mvvm/view_models/one_post_View_model.dart';

class PostsViewModel {
  final String title = 'All Posts';
  final PostsRepo? postsRepo;

  PostsViewModel({this.postsRepo});

  Future<List<PostViewModel>> fetchAllPosts() async {
    List<PostModel> list = await postsRepo!.getAllPosts();
    return list.map((e) => PostViewModel(postModel: e)).toList();
  }
}
