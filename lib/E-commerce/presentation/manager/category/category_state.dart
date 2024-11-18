part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategorySuccess extends CategoryState {
  final List<EcommerceModel> ecommerceList;

  CategorySuccess(this.ecommerceList);
}

final class CategoryLoading extends CategoryState {}

final class CategoryFailure extends CategoryState {}
