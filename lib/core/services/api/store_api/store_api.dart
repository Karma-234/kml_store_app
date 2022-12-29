import 'dart:convert';
import 'package:ecommerce_app/core/constants/App_const.dart';
import 'package:ecommerce_app/core/model/product_model.dart';
import 'package:http/http.dart' as http;

class StoreApi {
  Future getAllProducts() async {
    return await http
        .get(Uri.parse('${AppConstants.storeUrl}products'),
            headers: AppConstants.headers)
        .then((value) {
      if (value.statusCode == 200) {
        var products = jsonDecode(value.body);

        return products;
      }
    });
  }

  Future getCategory(String category) async {
    return await http
        .get(Uri.parse('${AppConstants.storeUrl}products/category/$category'),
            headers: AppConstants.headers)
        .then((value) {
      if (value.statusCode == 200) {
        var products = jsonDecode(value.body);
        return products;
      }
    });
  }

  Future getUserCart(String userId) async {
    return await http
        .get(Uri.parse('${AppConstants.storeUrl}carts/user/$userId'),
            headers: AppConstants.headers)
        .then((value) {
      if (value.statusCode == 200) {
        var products = jsonDecode(value.body);
        return products;
      }
    });
  }

  Future addProduct(ProductModel model) async {
    return await http.post(
      Uri.parse('${AppConstants.storeUrl}carts'),
      headers: AppConstants.headers,
      body: jsonEncode(
        {
          'userId': 1,
          'date': DateTime.now().toIso8601String(),
          'products': [
            {
              'quantity': model.quantity,
              'productId': model.id,
              'title': model.title,
            }
          ]
        },
      ),
    );
  }

  Future deletCart() async {
    await http.delete(Uri.parse('${AppConstants.storeUrl}carts/user/1'),
        headers: AppConstants.headers);
  }
}
