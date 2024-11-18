part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  final List<EcommerceModel> ecommerceList;

  ProductsSuccess(this.ecommerceList);
}

final class ProductsLoading extends ProductsState {}

final class ProductsFailure extends ProductsState {}
