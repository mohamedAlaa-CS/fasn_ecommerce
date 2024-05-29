import 'package:fasn_ecommerce/core/helper/extensions/context_size.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_strings.dart';
import 'package:fasn_ecommerce/features/home/presentaion/manager/main_cubit/main_cubit.dart';
import 'package:fasn_ecommerce/features/home/presentaion/widgets/bottom_nav_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MainView extends StatelessWidget {
  static const String routeName = "main_view";
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        var mainCubit = MainCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            leadingWidth: context.width / 6,
            leading: SvgPicture.asset(
              AppStrings.logo,
              height: 24,
            ),
            actions: [
              SvgPicture.asset(AppStrings.notificationIcon),
            ],
          ),
          backgroundColor: AppColors.primaryColor,
          body: mainCubit.screens[mainCubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: mainCubit.currentIndex,
              onTap: (index) {
                mainCubit.changeIndex(index);
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              elevation: 1,
              items: [
                bootomNAvItem(
                    image: AppStrings.homeIcon,
                    select: mainCubit.currentIndex == 0),
                bootomNAvItem(
                    image: AppStrings.searchIcon,
                    select: mainCubit.currentIndex == 1),
                bootomNAvItem(
                    image: AppStrings.cartIcon,
                    select: mainCubit.currentIndex == 2),
                bootomNAvItem(
                    image: AppStrings.loveIcon,
                    select: mainCubit.currentIndex == 3),
                bootomNAvItem(
                    image: AppStrings.personIcon,
                    select: mainCubit.currentIndex == 4),
              ]),
        );
      },
    );
  }
}
