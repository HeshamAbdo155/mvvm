import 'package:flutter/material.dart';
import 'package:mvvm/repositories/posts/posts_api.dart';
import 'package:mvvm/view_models/one_post_View_model.dart';
import 'package:mvvm/view_models/posts_view_model.dart';

class PostsView extends StatelessWidget {
  PostsView({Key? key}) : super(key: key);
  var postsViewModel = PostsViewModel(postsRepo: PostsAPI());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(postsViewModel.title),
      ),
      body: Center(
        child: FutureBuilder<List<PostViewModel>>(
          future: postsViewModel.fetchAllPosts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(snapshot.data![index].title),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
