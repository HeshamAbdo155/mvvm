import 'package:dio/dio.dart';
import 'package:mvvm/model/posts_model.dart';
import 'package:mvvm/repositories/posts/posts_repo.dart';

class PostsAPI extends PostsRepo {
  @override
  Future<List<PostModel>> getAllPosts() async {
    List<PostModel> posts = [];
    await Dio().get('https://jsonplaceholder.typicode.com/posts').then((value) {
      var response = value.data as List;
      posts = response.map((post) => PostModel.fromJson(post)).toList();
    }).catchError((e) {
      print(e);
    });
    print(posts);
    return posts;
  }

  @override
  Future<PostModel> getPostById(int id) {
    // TODO: implement getPostById
    throw UnimplementedError();
  }
}
