import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/features/home/presentaion/manager/main_cubit/main_cubit.dart';
import 'package:fasn_ecommerce/features/more_page/data/repos/more_page_repo_imple.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/manager/more_cubit/more_cubit.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/views/common_question_view.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/widgets/more_widget.dart';
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
