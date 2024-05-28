import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/helper/extensions/context_size.dart';
import 'package:fasn_ecommerce/core/helper/functions/show_snack_bar.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_strings.dart';
import 'package:fasn_ecommerce/core/utils/app_validator.dart';
import 'package:fasn_ecommerce/core/utils/local_data.dart';
import 'package:fasn_ecommerce/core/widgets/app_text_form.dart';
import 'package:fasn_ecommerce/core/widgets/main_buttom.dart';
import 'package:fasn_ecommerce/core/widgets/main_text.dart';
import 'package:fasn_ecommerce/features/auth/data/repos/auth_repo_imple.dart';
import 'package:fasn_ecommerce/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:fasn_ecommerce/features/auth/presentation/views/signup_view.dart';
import 'package:fasn_ecommerce/features/home/presentaion/views/main_view.dart';
import 'package:fasn_ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = 'login_view';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = S.of(context);
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: 14.aEdge,
          child: BlocProvider(
            create: (context) => AuthCubit(AuthRepoImple()),
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthLoginSuccess) {
                  if (state.userModel.status == true) {
                    showSnackBar(
                      context,
                      message: state.userModel.message ?? '',
                    );
                    LocalData.saveToken(state.userModel.data?.token ?? '');
                    Navigator.of(context).pushNamed(MainView.routeName);
                  } else {
                    showSnackBar(
                      context,
                      message: state.userModel.message ?? '',
                      error: true,
                    );
                  }
                } else if (state is AuthLoginFailed) {
                  showSnackBar(
                    context,
                    message: state.error,
                    error: true,
                  );
                }
              },
              builder: (context, state) {
                var authCubit = AuthCubit.get(context);
                return Form(
                  key: authCubit.loginFormKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: context.height / 10),
                        Align(
                          alignment: Alignment.center,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: SvgPicture.asset(
                              AppStrings.logo,
                              height: 100,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        30.hSize,
                        MainText.textButton(
                          localization.welcome,
                          fontSize: 24,
                          color: AppColors.white,
                        ),
                        MainText(
                          localization.please_login,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                        15.hSize,
                        MainTextField(
                          validator: AppValidator.emailValidate,
                          controller: authCubit.emailController,
                          title: localization.user_name,
                          hintText: localization.enter_your_email,
                        ),
                        18.hSize,
                        MainTextField(
                          validator: AppValidator.passwordValidate,
                          controller: authCubit.passwordController,
                          title: localization.password,
                          hintText: localization.enter_your_password,
                          suffixIcon: authCubit.suffix,
                          isobscure: authCubit.isPassword,
                          suffixPressed: () {
                            authCubit.changeVisablityPassword();
                          },
                        ),
                        10.hSize,
                        Align(
                          alignment: Alignment.centerRight,
                          child: MainText.title(
                            localization.forgot_password,
                            color: AppColors.white,
                          ),
                        ),
                        40.hSize,
                        if (state is AuthLoginLoading) ...{
                          const Center(
                            child: CircularProgressIndicator(
                              color: Colors.blue,
                            ),
                          ),
                        } else ...{
                          MainButtom(
                            text: localization.login,
                            onPressed: () {
                              authCubit.tryLogin();
                            },
                          ),
                        },
                        10.hSize,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MainText.title(
                              localization.dont_have_account,
                              color: AppColors.white,
                              fontSize: 16,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(SignupView.routeName);
                                },
                                child: Text(
                                  localization.create_account,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.blue,
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
