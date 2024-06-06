import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:fasn_ecommerce/features/home/presentaion/manager/main_cubit/main_cubit.dart';
import 'package:fasn_ecommerce/features/more_page/data/repos/more_page_repo_imple.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/manager/more_cubit/more_cubit.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/views/common_question_view.dart';
import 'package:fasn_ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocProvider(
        create: (context) => MoreCubit(MorePageRepoImple()),
        child: BlocConsumer<MoreCubit, MoreState>(
          listener: (context, state) {},
          builder: (context, state) {
            var moreCubit = MoreCubit.get(context);
            return Column(
              children: [
                MoreWidget(
                  onTap: () {},
                  isMain: true,
                  icon: Icons.person,
                  title: MainCubit.getFalse.userModel?.data?.name ??
                      S.of(context).profile,
                ),
                10.hSize,
                MoreWidget(
                  onTap: () {},
                  icon: Icons.history,
                  title: "Orders",
                ),
                10.hSize,
                MoreWidget(
                  onTap: () {},
                  icon: Icons.location_on,
                  title: S.of(context).profile,
                ),
                10.hSize,
                MoreWidget(
                  settingsIsShow: moreCubit.settingIsShow,
                  settingsIsShowOnTap: () {
                    moreCubit.changeSettingIsShow();
                  },
                  isSetting: true,
                  onTap: () {},
                  icon: Icons.settings,
                  title: S.of(context).settings,
                ),
                10.hSize,
                MoreWidget(
                  onTap: () {},
                  icon: Icons.info,
                  title: S.of(context).about_us,
                ),
                10.hSize,
                MoreWidget(
                  icon: Icons.question_mark_rounded,
                  title: S.of(context).common_questions,
                  onTap: () async {
                    await moreCubit.getCommonQuestion();
                    Future.delayed(const Duration(seconds: 1), () {
                      Navigator.pushNamed(
                        context,
                        QummanQustionPage.routeName,
                        arguments: moreCubit.commonQuestionList,
                      );
                    });
                  },
                ),
                10.hSize,
                MoreWidget(
                  onTap: () {},
                  icon: Icons.logout,
                  title: S.of(context).logout,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class MoreWidget extends StatelessWidget {
  const MoreWidget({
    super.key,
    required this.icon,
    required this.title,
    this.isMain,
    required this.onTap,
    this.isSetting,
    this.settingsIsShow,
    this.settingsIsShowOnTap,
  });
  final IconData icon;
  final String title;
  final bool? isMain;
  final VoidCallback onTap;
  final bool? isSetting;
  final bool? settingsIsShow;
  final VoidCallback? settingsIsShowOnTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: isMain ?? false ? Colors.transparent : AppColors.violateColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: AppColors.white,
                  size: isMain ?? false ? 36 : 32,
                ),
                15.wSize,
                Text(
                  title,
                  style:
                      isMain ?? false ? AppStyles.style24 : AppStyles.style20,
                ),
                const Spacer(),
                if (isSetting ?? false)
                  GestureDetector(
                    onTap: settingsIsShowOnTap,
                    child: Icon(
                      settingsIsShow ?? false
                          ? Icons.keyboard_arrow_down_outlined
                          : Icons.keyboard_arrow_right_outlined,
                      color: AppColors.white,
                      size: 24,
                    ),
                  ),
              ],
            ),
            if (settingsIsShow ?? false) ...{const SettingWidget()}
          ],
        ),
      ),
    );
  }
}

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
