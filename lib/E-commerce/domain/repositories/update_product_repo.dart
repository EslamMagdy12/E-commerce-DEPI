import 'package:e_commerce/E-commerce/data/data_sources/remote/my_web_services.dart';

import '../../data/models/e_commerce_model/e_commerce_model.dart';

class UpdateProductRepo {
  final MyWebServices myWebServices;

  UpdateProductRepo(this.myWebServices);

  Future<EcommerceModel> updateProducts(String title, String price,
      String description, String image, String category) async {
    var response = await myWebServices.updateProduct(
        title, price, description, image, category);
    return EcommerceModel.fromJson(response.toJson());
  }
}
