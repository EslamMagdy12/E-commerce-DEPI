import 'package:e_commerce/E-commerce/data/models/e_commerce_model/e_commerce_model.dart';

import '../../data/data_sources/remote/my_web_services.dart';

class ProductsRepo {
  final MyWebServices myWebServices;

  ProductsRepo(this.myWebServices);

  Future<List<EcommerceModel>> getProducts() async {
    var response = await myWebServices.getAllProducts();
    return response
        .map((ecommerce) => EcommerceModel.fromJson(ecommerce.toJson()))
        .toList();
  }
}
