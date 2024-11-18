import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/E-commerce/presentation/manager/email_auth_cubit/email_auth_cubit.dart';
import 'package:e_commerce/E-commerce/presentation/manager/reset_password/reset_password_cubit.dart';
import 'package:e_commerce/E-commerce/presentation/pages/home/home_view.dart';
import 'package:e_commerce/E-commerce/presentation/pages/register/register_view.dart';
import 'package:e_commerce/E-commerce/presentation/widgets/custom_button_without_icon/custom_button_without_icon.dart';
import 'package:e_commerce/E-commerce/presentation/widgets/custom_form_field/custom_form_field.dart';
import 'package:e_commerce/constants/colors_asset.dart';
import 'package:e_commerce/constants/font_asset.dart';
import 'package:e_commerce/constants/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _key,
          child: Column(
            children: [
              Text(
                'Welcome Back',
                style: FontAsset.font25WeightBold,
              ),
              SizedBox(
                height: ScreenSize.height(context) * 0.01,
              ),
              Text(
                'login to your account',
                style: FontAsset.font15WeightNormal
                    .copyWith(color: Colors.black.withOpacity(0.5)),
              ),
              SizedBox(
                height: ScreenSize.height(context) * 0.02,
              ),
              CustomFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This Field is required';
                  } else {
                    return null;
                  }
                },
                hintText: 'Enter your email',
                controller: _emailController,
                obscureText: false,
                borderSideColor: ColorsAsset.mainColor,
                borderRadius: 3,
                fontColor: Colors.grey,
                fillcolor: ColorsAsset.secondaryColor,
                textStyleColor: ColorsAsset.mainColor,
                fieldSize: 16,
              ),
              SizedBox(
                height: ScreenSize.height(context) * 0.02,
              ),
              CustomFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This Field is required';
                  } else {
                    return null;
                  }
                },
                hintText: 'Enter your password',
                controller: _passwordController,
                obscureText: true,
                borderSideColor: ColorsAsset.mainColor,
                borderRadius: 3,
                fontColor: Colors.grey,
                fillcolor: ColorsAsset.secondaryColor,
                textStyleColor: ColorsAsset.mainColor,
                fieldSize: 16,
              ),
              SizedBox(
                height: ScreenSize.height(context) * 0.02,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      BlocProvider.of<ResetPasswordCubit>(context,
                              listen: false)
                          .resetPassword(email: _emailController.text);
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.success,
                        animType: AnimType.rightSlide,
                        title: 'Check your gmail',
                        desc:
                            'We sent you form to change your password on your gmail account',
                        btnOkOnPress: () {},
                      ).show();
                    },
                    child: Text(
                      'Forgot password?',
                      style: FontAsset.font16WeightNormal
                          .copyWith(color: Colors.grey),
                    )),
              ),
              SizedBox(
                height: ScreenSize.height(context) * 0.02,
              ),
              CustomButtonWithoutIcon(
                  title: 'Login',
                  height: 0.07,
                  width: 1,
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      BlocProvider.of<EmailAuthCubit>(context, listen: false)
                          .loginMethod(
                              emailAddress: _emailController.text,
                              password: _passwordController.text);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeView()),
                          ((route) => false));
                    }
                  },
                  primaryColor: ColorsAsset.mainColor,
                  secondaryColor: ColorsAsset.secondaryColor,
                  fontSize: 16,
                  borderColor: ColorsAsset.mainColor),
              SizedBox(
                height: ScreenSize.height(context) * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Do not have an account?',
                    style: FontAsset.font13WeightNormal
                        .copyWith(color: ColorsAsset.mainColor),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterView()));
                    },
                    child: Text(
                      'Register',
                      style: FontAsset.font13WeightBold
                          .copyWith(color: ColorsAsset.mainColor),
                    ),
                  )
                ],
              ),
              // SizedBox(
              //   height: ScreenSize.height(context) * 0.02,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Container(
              //       height: ScreenSize.height(context) * 0.002,
              //       width: ScreenSize.width(context) * 0.3,
              //       color: Colors.grey.withOpacity(0.2),
              //     ),
              //     Text(
              //       'Or login with',
              //       style: FontAsset.font15WeightNormal
              //           .copyWith(color: Colors.grey),
              //     ),
              //     Container(
              //       height: ScreenSize.height(context) * 0.002,
              //       width: ScreenSize.width(context) * 0.3,
              //       color: Colors.grey.withOpacity(0.2),
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: ScreenSize.height(context) * 0.01,
              // ),
              // IconButton(
              //     onPressed: () {
              //       BlocProvider.of<GoogleSignInCubit>(context,
              //           listen: false)
              //           .signInWithGoogle();
              //     },
              //     icon: SvgPicture.asset(
              //       AssetData.googleIcon,
              //       height: ScreenSize.height(context) * 0.05,
              //       width: ScreenSize.width(context) * 0.05,
              //     ))
            ],
          ),
        ),
      ),
    )));
  }
}
