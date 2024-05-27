import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/helper/extensions/context_size.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_strings.dart';
import 'package:fasn_ecommerce/core/utils/app_validator.dart';
import 'package:fasn_ecommerce/core/widgets/app_text_form.dart';
import 'package:fasn_ecommerce/core/widgets/main_buttom.dart';
import 'package:fasn_ecommerce/core/widgets/main_text.dart';
import 'package:fasn_ecommerce/features/auth/presentation/views/signup_view.dart';
import 'package:fasn_ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
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
          child: Form(
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
                    //controller: cubit.email,
                    title: localization.user_name,
                    hintText: localization.enter_your_email,
                  ),
                  18.hSize,
                  MainTextField(
                    validator: AppValidator.passwordValidate,
                    // controller: cubit.passWord,
                    title: localization.password,
                    hintText: localization.enter_your_password,
                    // suffixIcon: cubit.suffix,
                    // isobscure: cubit.isPassword,
                    suffixPressed: () {},
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
                  if (false) ...{
                    const Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    ),
                  } else ...{
                    MainButtom(
                      text: localization.login,
                      onPressed: () {},
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
          ),
        ),
      ),
    );
  }
}
