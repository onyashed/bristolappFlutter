import 'dart:convert';
import 'package:http/http.dart';
//import 'package:bristol_exchange/ui/model/posts.dart';
import 'package:bristol_exchange/ui/model/product.dart';
import 'dart:developer' as developer;

//duplicate or reuse
class HttpService {
  final String product_URL =
      "/api/v1/bristolapp/paginated/products";

  Future<List<Product>> getProducts() async {
    Response res = await get(Uri.http("https://api.bristolapp.verygood.co.ke",
        "/api/v1/bristolapp/paginated/products"));
    developer.log('http connect',
        name: 'products', error: res.statusCode.toString());
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Product> products = body
          .map(
            (dynamic item) => Product.fromJson(item),
          )
          .toList();

      return products;
    } else {
      throw "Unable to retrieve products.";
    }
  }
}
