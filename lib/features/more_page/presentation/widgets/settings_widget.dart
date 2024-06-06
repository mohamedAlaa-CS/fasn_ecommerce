import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:fasn_ecommerce/features/home/presentaion/manager/main_cubit/main_cubit.dart';
import 'package:fasn_ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingWidget extends StatelessWidget {
  const SettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 20.hEdge,
      child: Column(
        children: [
          //   Row(
          //     children: [
          //       const Icon(
          //         Icons.notifications_outlined,
          //         color: AppColors.white,
          //         size: 24,
          //       ),
          //       10.wSize,
          //       Text(
          //         ' Notifications',
          //         style: AppStyles.style18,
          //       ),
          //       const Spacer(),
          //       Switch(value: true, onChanged: (_) {}),
          //     ],
          //   ),
          //   10.hSize,
          BlocConsumer<MainCubit, MainState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Row(
                children: [
                  const Icon(
                    Icons.language_outlined,
                    color: AppColors.white,
                    size: 24,
                  ),
                  10.wSize,
                  Text(
                    S.of(context).english,
                    style: AppStyles.style18,
                  ),
                  const Spacer(),
                  Switch(
                    value: MainCubit.get(context).isEnglish,
                    onChanged: (_) {
                      MainCubit.get(context).changeLanguage();
                    },
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
