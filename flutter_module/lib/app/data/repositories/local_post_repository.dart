import 'package:flutter_module/app/data/dao/post_dao.dart';
import 'package:flutter_module/app/data/model/post.dart';

class LocalPostRepository {
  final postDao = PostDao();

  Future<List<Post>> getAllPosts() => postDao.getAllPosts();

  Future<int> insertPost(Post post) => postDao.insertPost(post);
}
