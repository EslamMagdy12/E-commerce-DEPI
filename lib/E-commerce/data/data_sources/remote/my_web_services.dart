import 'package:dio/dio.dart';
import 'package:e_commerce/E-commerce/data/models/e_commerce_model/e_commerce_model.dart';
import 'package:retrofit/retrofit.dart';

part 'my_web_services.g.dart';

@RestApi(baseUrl: 'https://fakestoreapi.com/')
abstract class MyWebServices {
  factory MyWebServices(Dio dio, {String baseUrl}) = _MyWebServices;

  @GET('products')
  Future<List<EcommerceModel>> getAllProducts();

  @GET('products/category/:category_name')
  Future<List<EcommerceModel>> getCategory();

  @PUT('products/:id')
  Future<EcommerceModel> updateProduct(
    @Query('title') String title,
    @Query('price') String price,
    @Query('description') String description,
    @Query('image') String image,
    @Query('category') String category,
  );
}
