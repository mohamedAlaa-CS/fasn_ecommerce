import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/features/home/presentaion/manager/main_cubit/main_cubit.dart';
import 'package:fasn_ecommerce/features/more_page/data/repos/more_page_repo_imple.dart';
import 'package:fasn_ecommerce/features/more_page/data/repos/profile_repo_imple.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/manager/more_cubit/more_cubit.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/views/about_us_view.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/views/add_fead_back_view.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/views/common_question_view.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/views/my_order_view.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/views/profile_view.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/widgets/more_widget.dart';
import 'package:fasn_ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/functions/delete_alerte.dart';

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
                //? profile button ================
                BlocConsumer<MainCubit, MainState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return MoreWidget(
                      onTap: () {
                        // if (MainCubit.getFalse.userModel != null) {
                        //   Navigator.pushNamed(context, ProfileView.routeName);
                        // }
                        Navigator.pushNamed(context, ProfileView.routeName);
                      },
                      isMain: true,
                      icon: Icons.person,
                      title: MainCubit.get(context).userModel?.data?.name ??
                          S.of(context).profile,
                    );
                  },
                ),

                //? Orders button ================
                10.hSize,
                MoreWidget(
                  onTap: () {
                    Navigator.pushNamed(context, MyOrderView.routeName);
                  },
                  icon: Icons.history,
                  title: "Orders",
                ),

                //? settings button ================
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

                //? About us button ================
                10.hSize,
                MoreWidget(
                  onTap: () {
                    Navigator.pushNamed(context, AboutUsView.routeName);
                  },
                  icon: Icons.info,
                  title: S.of(context).about_us,
                ),
                //? complaint and suggestion button ================
                10.hSize,
                MoreWidget(
                  icon: Icons.chat,
                  title: S.of(context).complaint_and_suggestion,
                  onTap: () {
                    Navigator.pushNamed(context, AddFeadbackView.routeName);
                  },
                ),
                //? common question button ================
                10.hSize,
                MoreWidget(
                  icon: Icons.question_mark_rounded,
                  title: S.of(context).common_questions,
                  onTap: () async {
                    Navigator.pushNamed(
                      context,
                      QummanQustionPage.routeName,
                    );
                  },
                ),

                //? logout button ================
                10.hSize,
                BlocProvider(
                  create: (context) => ProfileCubit(ProfilRepoImple()),
                  child: BlocConsumer<ProfileCubit, ProfileState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return MoreWidget(
                        onTap: () {
                          ShowDialog(
                            context,
                            message:
                                S.of(context).are_you_sure_you_want_to_logout,
                            yesOntap: () {
                              ProfileCubit.get(context).logOut();
                            },
                            noOntap: () {
                              Navigator.pop(context);
                            },
                          );
                        },
                        icon: Icons.logout,
                        title: S.of(context).logout,
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
