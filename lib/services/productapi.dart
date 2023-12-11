import 'package:dio/dio.dart';
import 'package:ecommerce/models/productsmodel.dart';

class ProductApiService {
  Dio dio = Dio();
  Future<List<ProductModel>> getProducts() async {
    final response = await dio.get('https://fakestoreapi.com/products');
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception('Fetch Error');
    }
  }
}
