////////////
import 'package:flutter/material.dart';
import 'package:bristol_exchange/ui/services/products_http_service.dart';
import 'package:bristol_exchange/ui/model/product.dart';
import 'dart:developer' as dev;

class ProductsPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Price List..."),
      ),
      //

      //
      body: FutureBuilder(
        future: httpService.getProducts(),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.hasData) {
            List<Product> product = snapshot.data as List<Product>;
            dev.log('http connect',
                name: 'products', error: snapshot.hasData.toString());
            return ListView(
              children: product
                  .map(
                    (Product product) => ListTile(
                      title: Text(product.name),
                      subtitle: Text("${product.id}"),
                    ),
                  )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
///////final List data = responseJson['data']! as List;
//return data.map((p) => SensorData.fromJson(p)).toList();
///