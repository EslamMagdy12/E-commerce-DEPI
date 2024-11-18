import 'package:e_commerce/E-commerce/data/models/e_commerce_model/user_model/user_model.dart';
import 'package:e_commerce/E-commerce/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:e_commerce/E-commerce/presentation/manager/user/user_cubit.dart';
import 'package:e_commerce/E-commerce/presentation/pages/login/login_view.dart';
import 'package:e_commerce/E-commerce/presentation/widgets/custom_form_field/custom_form_field.dart';
import 'package:e_commerce/constants/colors_asset.dart';
import 'package:e_commerce/constants/font_asset.dart';
import 'package:e_commerce/constants/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../custom_button_without_icon/custom_button_without_icon.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: BlocBuilder<SignupCubit, SignupState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    Text(
                      'Create Account',
                      style: FontAsset.font25WeightBold,
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
                      hintText: 'Name',
                      controller: _nameController,
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
                        const pattern =
                            r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                            r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                            r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                            r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                            r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                            r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                            r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
                        final regex = RegExp(pattern);

                        return value!.isEmpty || !regex.hasMatch(value)
                            ? 'Enter a valid email address'
                            : null;
                      },
                      hintText: 'Email',
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
                      textInputType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This Field is required';
                        } else {
                          return null;
                        }
                      },
                      hintText: 'Phone Number',
                      controller: _phoneController,
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
                        RegExp regex = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                        if (value!.isEmpty) {
                          return 'Please enter password';
                        } else {
                          if (!regex.hasMatch(value)) {
                            return 'Enter strong password contains numbers,signs,and upper and characters ';
                          } else {
                            return null;
                          }
                        }
                      },
                      hintText: 'Password',
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
                    CustomButtonWithoutIcon(
                        title: 'Register',
                        height: 0.07,
                        width: 1,
                        onPressed: () {
                          UserModel user = UserModel(
                              name: _nameController.text,
                              phone: _phoneController.text,
                              email: _emailController.text);
                          if (_key.currentState!.validate()) {
                            BlocProvider.of<SignupCubit>(context)
                                .signUpFirebaseMethod(_emailController.text,
                                    _passwordController.text);
                            BlocProvider.of<UserCubit>(context, listen: false)
                                .addUserToFirestore(user);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginView()));
                          }
                        },
                        primaryColor: ColorsAsset.mainColor,
                        secondaryColor: ColorsAsset.secondaryColor,
                        fontSize: 16,
                        borderColor: ColorsAsset.mainColor),
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
                    //     Padding(
                    //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    //       child: Text(
                    //         'Or register with',
                    //         style: FontAsset.font15WeightNormal
                    //             .copyWith(color: Colors.grey),
                    //       ),
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
                    //     onPressed: () {},
                    //     icon: SvgPicture.asset(
                    //       AssetData.googleIcon,
                    //       height: ScreenSize.height(context) * 0.05,
                    //       width: ScreenSize.width(context) * 0.05,
                    //     )),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ));
  }
}
