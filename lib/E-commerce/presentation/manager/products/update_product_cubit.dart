import 'package:bloc/bloc.dart';
import 'package:e_commerce/E-commerce/data/models/e_commerce_model/e_commerce_model.dart';
import 'package:meta/meta.dart';

import '../../../domain/repositories/update_product_repo.dart';

part 'update_product_state.dart';

class UpdateProductCubit extends Cubit<UpdateProductState> {
  final UpdateProductRepo updateProductRepo;

  UpdateProductCubit(this.updateProductRepo) : super(UpdateProductInitial());

  emitUpdateProduct(String title, String price, String description,
      String image, String category) async {
    emit(UpdateProductLoading());

    try {
      final product = await updateProductRepo.updateProducts(
          title, price, description, image, category);
      emit(UpdateProductSuccess(product));
    } catch (e) {
      emit(UpdateProductFailure());
      return e.toString();
    }
  }
}
