import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:fasn_ecommerce/core/widgets/app_text_form.dart';
import 'package:fasn_ecommerce/features/home/data/repos/home_repo_imple.dart';
import 'package:fasn_ecommerce/features/home/presentaion/manager/home_cubit/home_cubit.dart';
import 'package:fasn_ecommerce/features/home/presentaion/widgets/donts_indecator.dart';
import 'package:fasn_ecommerce/features/home/presentaion/widgets/home_banner_page_view_widget.dart';
import 'package:fasn_ecommerce/features/home/presentaion/widgets/home_category_list_view_widget.dart';
import 'package:fasn_ecommerce/features/home/presentaion/widgets/product_gride_view.dart';
import 'package:fasn_ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController pageController;
  int currentIndex = 0;
  final String imageurl =
      'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D';
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentIndex = pageController.page!.round();

      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            const EdgeInsetsDirectional.only(start: 10, end: 10, bottom: 10),
        child: BlocProvider(
          create: (context) => HomeCubit(HomeRepoImple()),
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
             
            },
            builder: (context, state) {
              return Scrollbar(
                child: CustomScrollView(clipBehavior: Clip.antiAlias, slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // app bar =================,
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
                          imageUrl: imageurl,
                          pageController: pageController,
                          title: 'hello mohamed alaa',
                        ),
                        10.hSize,
                        DotsIndecator(
                            currentIndex: currentIndex, dotNumber: 10),
                        10.hSize,
                        HomeCategoryListView(
                          onTap: () {},
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
                  const ProdectGridVew(),
                ]),
              );
            },
          ),
        ),
      ),
    );
  }
}
