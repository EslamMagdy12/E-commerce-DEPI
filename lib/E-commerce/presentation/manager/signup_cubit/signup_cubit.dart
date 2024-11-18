import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  void signUpFirebaseMethod(String email, String password) async {
    emit(SignupLoading());
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      // await FirebaseAuth.instance.currentUser!.sendEmailVerification();

      emit(SignupSuccess());
    } on FirebaseAuthException catch (e) {
      emit(SignupFailure());

      print(e.toString());
    }
  }
}
