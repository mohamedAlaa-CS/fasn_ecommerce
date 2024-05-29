import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:fasn_ecommerce/core/widgets/app_text_form.dart';
import 'package:fasn_ecommerce/features/home/presentaion/widgets/donts_indecator.dart';
import 'package:fasn_ecommerce/features/home/presentaion/widgets/home_banner_page_view_widget.dart';
import 'package:fasn_ecommerce/features/home/presentaion/widgets/home_category_list_view_widget.dart';
import 'package:fasn_ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';

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
        child: Scrollbar(
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
                  DotsIndecator(currentIndex: currentIndex, dotNumber: 10),
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
        ),
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(children: [
          AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Positioned.directional(
            textDirection: Directionality.of(context),
            end: 10,
            top: 10,
            child: Container(
              padding: const EdgeInsetsDirectional.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
              ),
              child: const Icon(Icons.favorite_outline),
            ),
          ),
          if (true) ...{
            Positioned.directional(
              textDirection: Directionality.of(context),
              start: 10,
              top: 10,
              child: Container(
                padding: const EdgeInsetsDirectional.all(8),
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '10% off',
                  style: AppStyles.style12.copyWith(fontSize: 10),
                ),
              ),
            ),
          }
        ]),
      ),
      10.hSize,
      Text(
        'One shoulder Top',
        style: AppStyles.style16,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      Row(
        children: [
          Text(
            '10.00\$',
            style: AppStyles.style12,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          8.wSize,
          Text(
            '10.00\$',
            style: AppStyles.style12.copyWith(
              color: AppColors.borderColor,
              decoration: TextDecoration.lineThrough,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ]);
  }
}

class ProdectGridVew extends StatelessWidget {
  const ProdectGridVew({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1 / 1.3,
      ),
      itemBuilder: (context, index) => const ProductWidget(),
      itemCount: 15,
    );
  }
}
