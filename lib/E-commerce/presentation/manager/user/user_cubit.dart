import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/E-commerce/data/models/e_commerce_model/user_model/user_model.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void addUserToFirestore(UserModel user) async {
    emit(UserLoading());
    try {
      await FirebaseFirestore.instance.collection('users').add(user.toMap());
      emit(UserSuccess());
    } on FirebaseException catch (e) {
      emit(UserFailed());
      print(e);
    }
  }
}
