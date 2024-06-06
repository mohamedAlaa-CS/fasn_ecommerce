import 'package:fasn_ecommerce/core/di/injections.dart';
import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_strings.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/manager/more_cubit/more_cubit.dart';
import 'package:fasn_ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AboutUsView extends StatelessWidget {
  static const String routeName = 'AboutUsView';
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<MoreCubit>()..getAboutAu(),
      child: BlocConsumer<MoreCubit, MoreState>(
        listener: (context, state) {},
        builder: (context, state) {
          var moreCubit = MoreCubit.get(context);
          return Scaffold(
            backgroundColor: AppColors.primaryColor,
            body: SafeArea(
              child: Padding(
                padding: 14.aEdge,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                    //? logo =================
                    Center(child: SvgPicture.asset(AppStrings.logo)

                        //ImageWidget(image: AppStrings.logo),
                        ),
                    25.hSize,
                    // ? About Us =================
                    Text(S.of(context).about_us, style: AppStyles.style24),

                    20.hSize,
                    Expanded(
                      // ? About Us =================
                      child: moreCubit.aboutUsModel == null
                          ? const Center(child: CircularProgressIndicator())
                          : SingleChildScrollView(
                              child: Text(
                                moreCubit.aboutUsModel?.about ?? '',
                                style: AppStyles.style20
                                    .copyWith(color: AppColors.borderColor),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
