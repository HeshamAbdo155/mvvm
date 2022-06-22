import 'package:mvvm/model/posts_model.dart';

class PostViewModel {
  PostModel? postModel;

  PostViewModel({this.postModel});

  get id => postModel!.id;
  get userId => postModel!.userId;
  get body => postModel!.body;
  get title => postModel!.title!.toUpperCase();


}
