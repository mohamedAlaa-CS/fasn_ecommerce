import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/helper/functions/show_snack_bar.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:fasn_ecommerce/core/widgets/app_text_form.dart';
import 'package:fasn_ecommerce/features/category/presentation/views/category_view.dart';
import 'package:fasn_ecommerce/features/home/data/repos/home_repo_imple.dart';
import 'package:fasn_ecommerce/features/home/presentaion/manager/home_cubit/home_cubit.dart';
import 'package:fasn_ecommerce/features/home/presentaion/widgets/donts_indecator.dart';
import 'package:fasn_ecommerce/features/home/presentaion/widgets/home_banner_page_view_widget.dart';
import 'package:fasn_ecommerce/features/home/presentaion/widgets/home_category_list_view_widget.dart';
import 'package:fasn_ecommerce/features/home/presentaion/widgets/product_gride_view.dart';
import 'package:fasn_ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            const EdgeInsetsDirectional.only(start: 10, end: 10, bottom: 10),
        child: BlocProvider(
          create: (context) => HomeCubit(HomeRepoImple())..getHomeData(),
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              if (state is HomeFailed) {
                showSnackBar(context, message: state.error, error: true);
              }
            },
            builder: (context, state) {
              var homeCubit = HomeCubit.get(context);
              return Scrollbar(
                child: CustomScrollView(clipBehavior: Clip.antiAlias, slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        10.hSize,
                        // search text field  =============
                        MainTextField(
                          prefixIcon: Icons.search,
                          hintText: S.of(context).hello,
                          hintStyle: AppStyles.style18
                              .copyWith(color: AppColors.borderColor),
                          fillColor: AppColors.violateColor,
                        ),
                        12.hSize,
                        HomeBannerPageViewWidget(
                          bannerList: homeCubit.bannerList,
                          pageController: homeCubit.pageController,
                        ),
                        10.hSize,
                        DotsIndecator(
                          currentIndex: homeCubit.currentIndex,
                          dotNumber: homeCubit.bannerList.length,
                        ),
                        10.hSize,
                        HomeCategoryListView(
                          categoryList: homeCubit.categoriesList,
                          onTap: () {
                            Navigator.pushNamed(
                                context, CategoryView.routeName);
                          },
                        ),
                        10.hSize,
                        Row(children: [
                          Text(
                            S.of(context).products,
                            style: AppStyles.style20,
                          ),
                          const Spacer(),
                          Text(
                            S.of(context).view_all,
                            style: AppStyles.style12
                                .copyWith(color: AppColors.borderColor),
                          ),
                        ]),
                        20.hSize,
                        // const ProductWidget(),
                      ],
                    ),
                  ),
                  ProdectGridVew(
                    product: homeCubit.productList,
                  ),
                ]),
              );
            },
          ),
        ),
      ),
    );
  }
}
