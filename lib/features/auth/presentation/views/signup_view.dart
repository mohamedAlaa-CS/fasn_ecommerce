import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/helper/extensions/context_size.dart';
import 'package:fasn_ecommerce/core/helper/functions/show_snack_bar.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_strings.dart';
import 'package:fasn_ecommerce/core/utils/app_validator.dart';
import 'package:fasn_ecommerce/core/widgets/app_text_form.dart';
import 'package:fasn_ecommerce/core/widgets/main_buttom.dart';
import 'package:fasn_ecommerce/features/auth/data/repos/auth_repo_imple.dart';
import 'package:fasn_ecommerce/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:fasn_ecommerce/features/auth/presentation/views/login_view.dart';
import 'package:fasn_ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SignupView extends StatelessWidget {
  static const String routeName = 'signup_view';
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = S.of(context);
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: 14.aEdge,
          child: SingleChildScrollView(
            child: BlocProvider(
              create: (context) => AuthCubit(AuthRepoImple()),
              child: BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthSignupSuccess) {
                    if (state.userModel.status == true) {
                      showSnackBar(
                        context,
                        message: state.userModel.message ?? '',
                      );

                      Navigator.of(context).pushNamed(LoginPage.routeName);
                    } else {
                      showSnackBar(
                        context,
                        message: state.userModel.message ?? '',
                        error: true,
                      );
                    }
                  } else if (state is AuthSignupFailed) {
                    showSnackBar(
                      context,
                      message: state.error,
                      error: true,
                    );
                  }
                },
                builder: (context, state) {
                  var signupCubit = AuthCubit.get(context);
                  return Form(
                    key: signupCubit.signupFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: context.height / 15),
                        Align(
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            AppStrings.logo,
                            height: 100,
                            color: AppColors.white,
                          ),
                        ),
                        30.hSize,
                        MainTextField(
                          controller: signupCubit.nameController,
                          validator: AppValidator.nameValidate,
                          title: localization.full_name,
                          hintText: localization.enter_your_full_name,
                        ),
                        18.hSize,
                        MainTextField(
                          textType: TextInputType.number,
                          controller: signupCubit.phoneController,
                          validator: AppValidator.phoneValidate,
                          title: localization.mobile_number,
                          hintText: localization.enter_your_mobile_number,
                        ),
                        18.hSize,
                        MainTextField(
                          controller: signupCubit.emailController1,
                          validator: AppValidator.emailValidate,
                          title: localization.email_address,
                          hintText: localization.enter_your_email_address,
                        ),
                        18.hSize,
                        MainTextField(
                          controller: signupCubit.passwordController1,
                          validator: AppValidator.passwordValidate,
                          title: localization.password,
                          hintText: localization.enter_your_password,
                          suffixIcon: signupCubit.signupSuffix,
                          isobscure: signupCubit.signupIsPassword,
                          suffixPressed: () {
                            signupCubit.changeVisablitySignupPassword();
                          },
                        ),
                        // 18.hSize,
                        // MainTextField(
                        //   controller: signupCubit.confirmpasswordController,
                        //   validator: AppValidator.passwordValidate,
                        //   title: localization.confirm_password,
                        //   hintText: localization.enter_your_password,
                        //   suffixIcon: signupCubit.signupSuffix,
                        //   isobscure: signupCubit.signupIsPassword,
                        //   suffixPressed: () {
                        //     signupCubit.changeVisablitySignupPassword();
                        //   },
                        // ),
                        24.hSize,
                        if (state is AuthSignupLoading) ...{
                          const Center(
                            child: CircularProgressIndicator(
                              color: Colors.blue,
                            ),
                          ),
                        } else ...{
                          MainButtom(
                            text: localization.sign_up,
                            onPressed: () {
                              signupCubit.trySignup();
                            },
                          ),
                        },
                        10.hSize,
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
