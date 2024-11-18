import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/e_commerce_model/e_commerce_model.dart';
import '../../../domain/repositories/category_repo.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepo categoryRepo;

  CategoryCubit(this.categoryRepo) : super(CategoryInitial());

  void emitCategory() {
    emit(CategoryLoading());

    try {
      categoryRepo.getCategory().then((ecommerceList) {
        emit(CategorySuccess(ecommerceList));
      });
    } catch (e) {
      emit(CategoryFailure());
      print(
          '=========================================================================================================================================================================================\n====================================================================Ahmd$e');
    }
  }
}
