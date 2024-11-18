import 'package:e_commerce/E-commerce/data/data_sources/remote/my_web_services.dart';

import '../../data/models/e_commerce_model/e_commerce_model.dart';

class CategoryRepo {
  final MyWebServices myWebServices;

  CategoryRepo(this.myWebServices);

  Future<List<EcommerceModel>> getCategory() async {
    var response = await myWebServices.getCategory();
    return response
        .map((ecommerce) => EcommerceModel.fromJson(ecommerce.toJson()))
        .toList();
  }
}
