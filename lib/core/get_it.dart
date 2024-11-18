import 'package:dio/dio.dart';
import 'package:e_commerce/E-commerce/domain/repositories/products_repo.dart';
import 'package:e_commerce/E-commerce/presentation/manager/products/products_cubit.dart';
import 'package:get_it/get_it.dart';

import '../E-commerce/data/data_sources/remote/my_web_services.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<ProductsCubit>(() => ProductsCubit(getIt()));
  getIt.registerLazySingleton<ProductsRepo>(() => ProductsRepo(getIt()));
  getIt.registerLazySingleton<MyWebServices>(() => MyWebServices(Dio()));
}
