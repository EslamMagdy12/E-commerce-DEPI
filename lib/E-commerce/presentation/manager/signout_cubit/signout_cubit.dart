import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'signout_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit() : super(SignOutInitial());

  signOutMethod() async {
    emit(SignOutLoading());
    try {
      await FirebaseAuth.instance.signOut();
      emit(SignOutSuccess());
    } on FirebaseException catch (e) {
      emit(SignOutFailure());
      print(e.toString());
    }
  }
}
