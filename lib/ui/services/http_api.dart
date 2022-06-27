import 'dart:convert';
import 'package:http/http.dart';
import 'package:bristol_exchange/ui/model/posts.dart';
import 'package:bristol_exchange/ui/model/product.dart';

class HttpService {
  final String postsURL = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Post>> getPosts() async {
    Response res = await get(Uri.parse(postsURL), headers: {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    });

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = body
          .map(
            (dynamic item) => Post.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
