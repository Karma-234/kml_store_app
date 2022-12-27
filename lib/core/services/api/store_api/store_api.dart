import 'dart:convert';

import 'package:ecommerce_app/core/constants/App_const.dart';
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
}
