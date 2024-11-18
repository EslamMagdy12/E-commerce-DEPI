import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/e_commerce_model/e_commerce_model.dart';
import '../../../domain/repositories/products_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepo productsRepo;

  ProductsCubit(this.productsRepo) : super(ProductsInitial());

  void emitProducts() {
    emit(ProductsLoading());

    try {
      productsRepo.getProducts().then((ecommerceList) {
        emit(ProductsSuccess(ecommerceList));
      });
    } catch (e) {
      emit(ProductsFailure());
      print(
          '=========================================================================================================================================================================================\n====================================================================Ahmd$e');
    }
  }
}
