import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/helper/extensions/context_size.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_strings.dart';
import 'package:fasn_ecommerce/core/utils/app_validator.dart';
import 'package:fasn_ecommerce/core/widgets/app_text_form.dart';
import 'package:fasn_ecommerce/core/widgets/main_buttom.dart';
import 'package:fasn_ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
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
            child: Form(
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
                    // controller: cubit.name,
                    validator: AppValidator.nameValidate,
                    title: localization.full_name,
                    hintText: localization.enter_your_full_name,
                  ),
                  18.hSize,
                  MainTextField(
                    textType: TextInputType.number,
                    //controller: cubit.phone,
                    validator: AppValidator.phoneValidate,
                    title: localization.mobile_number,
                    hintText: localization.enter_your_mobile_number,
                  ),
                  18.hSize,
                  MainTextField(
                    //controller: cubit.email,
                    validator: AppValidator.emailValidate,
                    title: localization.email_address,
                    hintText: localization.enter_your_email_address,
                  ),
                  18.hSize,
                  MainTextField(
                    // controller: cubit.poassWord,
                    validator: AppValidator.passwordValidate,
                    title: localization.password,
                    hintText: localization.enter_your_password,
                    // suffixIcon: cubit.suffix,
                    // isobscure: cubit.isPassword,
                    suffixPressed: () {},
                  ),
                  18.hSize,
                  MainTextField(
                    //  controller: cubit.rePoassWord,
                    validator: AppValidator.passwordValidate,
                    title: localization.confirm_password,
                    hintText: localization.enter_your_password,
                    // suffixIcon: cubit.suffix,
                    // isobscure: cubit.isPassword,
                    suffixPressed: () {},
                  ),
                  24.hSize,
                  if (false) ...{
                    const Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    ),
                  } else ...{
                    MainButtom(
                      text: localization.sign_up,
                      onPressed: () {},
                    ),
                  },
                  10.hSize,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
