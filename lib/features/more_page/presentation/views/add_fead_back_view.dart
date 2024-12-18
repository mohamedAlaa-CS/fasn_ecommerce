import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:fasn_ecommerce/core/utils/app_validator.dart';
import 'package:fasn_ecommerce/core/widgets/app_text_form.dart';
import 'package:fasn_ecommerce/core/widgets/main_buttom.dart';
import 'package:fasn_ecommerce/features/more_page/data/repos/more_page_repo_imple.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/manager/more_cubit/more_cubit.dart';
import 'package:fasn_ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          child: BlocProvider(
            create: (context) => MoreCubit(MorePageRepoImple()),
            child: BlocConsumer<MoreCubit, MoreState>(
              listener: (context, state) {},
              builder: (context, state) {
                var moreCubit = MoreCubit.get(context);
                return Form(
                  key: moreCubit.complaintsFormKey,
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
                        validator: AppValidator.nameValidate,
                        controller: moreCubit.nameController,
                        title: S.of(context).full_name,
                        hintText: S.of(context).enter_your_full_name,
                        textType: TextInputType.name,
                      ),
                      14.hSize,
                      MainTextField(
                        controller: moreCubit.emailController,
                        validator: AppValidator.emailValidate,
                        title: S.of(context).email_address,
                        hintText: S.of(context).enter_your_email,
                        textType: TextInputType.name,
                      ),
                      14.hSize,
                      MainTextField(
                        controller: moreCubit.phoneController,
                        validator: AppValidator.phoneValidate,
                        title: S.of(context).mobile_number,
                        hintText: S.of(context).enter_your_mobile_number,
                        textType: TextInputType.name,
                      ),
                      14.hSize,
                      MainTextField(
                        controller: moreCubit.messageController,
                        validator: AppValidator.nameValidate,
                        title: S.of(context).suggetion_complaint,
                        hintText: "${S.of(context).type_here} ...",
                        maxLines: 10,
                        textType: TextInputType.name,
                      ),
                      80.hSize,
                      if (state is MoreGetComplaintAndSuggestionLoading) ...{
                        const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.borderColor,
                          ),
                        ),
                        5.hSize,
                      } else ...{
                        MainButtom(
                          text: S.of(context).send,
                          color: Colors.blue,
                          textStyle: AppStyles.style20
                              .copyWith(color: AppColors.white),
                          onPressed: () async {
                            await moreCubit.tryComplaintAndSuggestion();
                          },
                        ),
                      },
                      15.hSize,
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
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
                      15.hSize,
                    ],
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
