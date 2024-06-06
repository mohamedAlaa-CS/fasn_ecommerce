import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:fasn_ecommerce/core/widgets/app_text_form.dart';
import 'package:fasn_ecommerce/core/widgets/main_buttom.dart';
import 'package:fasn_ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class AddFeadbackView extends StatelessWidget {
  static const String routeName = 'AddFeadbackView';
  const AddFeadbackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: 14.aEdge,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ? back button ================
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.white,
                  size: 28,
                ),
              ),
              10.hSize,

              MainTextField(
                // controller: provider.name,
                title: S.of(context).full_name,

                hintText: S.of(context).enter_your_full_name,
                textType: TextInputType.number,
              ),
              14.hSize,
              MainTextField(
                // controller: provider.email,
                title: S.of(context).email_address,
                hintText: S.of(context).enter_your_email,
                textType: TextInputType.name,
              ),
              14.hSize,
              MainTextField(
                //controller: provider.phone,
                title: S.of(context).mobile_number,
                hintText: S.of(context).enter_your_mobile_number,
                textType: TextInputType.name,
              ),
              14.hSize,
              MainTextField(
                //controller: provider.message,
                title: S.of(context).suggetion_complaint,
                hintText: "${S.of(context).type_here} ...",
                maxLines: 10,
                textType: TextInputType.name,
              ),
              80.hSize,
              MainButtom(
                text: S.of(context).send,
                color: Colors.blue,
                textStyle: AppStyles.style20.copyWith(color: AppColors.white),
                onPressed: () {},
              ),
              15.hSize,
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    S.of(context).cancel,
                    style: AppStyles.style20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
