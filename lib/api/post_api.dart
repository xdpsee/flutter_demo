import 'package:dio/dio.dart';
import 'package:drip/model/post/post.dart';

class PostApi {
  Future<List<Post>> request(int offset, int limit) async {
    Dio dio = new Dio();

    Response response = await dio.get(
        "https://my-json-server.typicode.com/xdpsee/json/posts?_start=$offset&_limit=$limit");

    List<Post> posts = List();
    if (response.statusCode == 200) {
      (response.data as List).forEach((e) => posts.add(Post.fromJson(e)));
      return posts;
    } else {
      throw Exception('error fetching posts');
    }
  }
}
