import 'package:flutter_module/app/data/database/database.dart';
import 'package:flutter_module/app/data/model/post.dart';

class PostDao {
  final dbProvider = DatabaseProvider.dbProvider;

  Future<int> insertPost(Post post) async {
    final db = await dbProvider.database;
    if (db == null) return 0;
    var result = db.insert(postTable, post.toDatabaseJson());
    return result;
  }

  Future<List<Post>> getAllPosts() async {
    final db = await dbProvider.database;
    if (db == null) return [];
    List<Map<String, dynamic>> result = await db.query(postTable);
    List<Post> posts = result.isNotEmpty
        ? result.map((item) => Post.fromDatabseJson(item)).toList()
        : [];
    return posts;
  }
}
