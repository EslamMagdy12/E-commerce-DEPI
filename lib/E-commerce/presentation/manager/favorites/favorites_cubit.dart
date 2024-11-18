import 'package:e_commerce/E-commerce/data/models/e_commerce_model/e_commerce_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());
  final List<EcommerceModel> _favorites = [];

  List<EcommerceModel> get favorties => _favorites;

  void tooglefavorites(EcommerceModel product) {
    if (_favorites.contains(product)) {
      _favorites.remove(product);
    } else {
      _favorites.add(product);
    }
    emit(FavoritesLoaded());
  }

  bool isExist(EcommerceModel product) {
    final isExist = _favorites.contains(product);
    return isExist;
  }

  static FavoritesCubit of(BuildContext context, {bool listen = true}) {
    return BlocProvider.of<FavoritesCubit>(context, listen: listen);
  }
}
