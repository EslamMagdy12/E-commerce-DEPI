import 'package:e_commerce/E-commerce/presentation/manager/email_auth_cubit/email_auth_cubit.dart';
import 'package:e_commerce/E-commerce/presentation/manager/favorites/favorites_cubit.dart';
import 'package:e_commerce/E-commerce/presentation/manager/google_sign_in_cubit/google_sign_in_cubit.dart';
import 'package:e_commerce/E-commerce/presentation/manager/products/products_cubit.dart';
import 'package:e_commerce/E-commerce/presentation/manager/reset_password/reset_password_cubit.dart';
import 'package:e_commerce/E-commerce/presentation/manager/signout_cubit/signout_cubit.dart';
import 'package:e_commerce/E-commerce/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:e_commerce/E-commerce/presentation/manager/user/user_cubit.dart';
import 'package:e_commerce/E-commerce/presentation/pages/home/home_view.dart';
import 'package:e_commerce/core/get_it.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async {
  initGetIt();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => getIt<ProductsCubit>()),
      BlocProvider(create: (context) => EmailAuthCubit()),
      BlocProvider(create: (context) => GoogleSignInCubit()),
      BlocProvider(create: (context) => SignupCubit()),
      BlocProvider(create: (context) => SignOutCubit()),
      BlocProvider(create: (context) => ResetPasswordCubit()),
      BlocProvider(create: (context) => UserCubit()),
      BlocProvider(create: (context) => FavoritesCubit()),
    ],
    child: const MyApp(),
  ));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
