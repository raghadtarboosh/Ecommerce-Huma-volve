import 'package:ecommerce_app_huma_volve/core/constans/api_endpoints.dart';
import 'package:ecommerce_app_huma_volve/core/network/api_client.dart';
import 'package:ecommerce_app_huma_volve/features/home/service/models/category_model.dart';
import 'package:ecommerce_app_huma_volve/features/home/service/models/product_model.dart';

class HomeService {
  final ApiClient apiClient;
  HomeService(this.apiClient);

  Future<List<CategoryModel>> getCategories() async {
    final response = await apiClient.dio.get(ApiEndpoints.categoriesEndpoint);
    final List jsonData = response.data;
    final List<CategoryModel> catrgories = jsonData
        .map((e) => CategoryModel.fromJson(e))
        .toList();

    return catrgories;
  }

  Future<List<ProductModel>> getProducts(int? categoryId) async {
    final response = await apiClient.dio.get(
      "${ApiEndpoints.categoriesEndpoint}/$categoryId/${ApiEndpoints.productsEndpoint}",
    );
    final List jsonData = response.data;
    final List<ProductModel> products = jsonData
        .map((e) => ProductModel.fromJson(e))
        .toList();
    return products;
  }
}
