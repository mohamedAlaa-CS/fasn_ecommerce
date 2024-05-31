import 'package:cached_network_image/cached_network_image.dart';
import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/helper/extensions/context_size.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:fasn_ecommerce/features/category/presentation/widgets/add_cart_and_buy_buttom.dart';
import 'package:fasn_ecommerce/features/category/presentation/widgets/quntaty_item_deatils_widget.dart';
import 'package:fasn_ecommerce/features/category/presentation/widgets/show_all_product_details.dart';
import 'package:fasn_ecommerce/features/home/presentaion/widgets/donts_indecator.dart';
import 'package:fasn_ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatefulWidget {
  static const String routeName = 'product_details_view';
  const ProductDetailsView({super.key, required this.product});
  final product;
  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  bool isShow = false;
  late PageController pageController;
  int currentIndex = 0;

  _ProductDetailsViewState();

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isportrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: CustomScrollView(
        slivers: [
          //? image and back button and like button ============
          SliverToBoxAdapter(
            child: Stack(
              children: [
                SizedBox(
                  height:
                      isportrait ? context.width / 0.9 : context.height / 1.2,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: widget.product.images.length,
                      itemBuilder: (context, indaex) {
                        return AspectRatio(
                          aspectRatio: isportrait ? (1 / 0.9) : (1 / 0.4),
                          child: CachedNetworkImage(
                            imageUrl: widget.product.images[indaex] ?? '',
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        );
                      }),
                ),
                Positioned.directional(
                  textDirection: Directionality.of(context),
                  top: 29,
                  start: 10,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: AppColors.white, shape: BoxShape.circle),
                      padding: const EdgeInsets.all(8),
                      child: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                      ),
                    ),
                  ),
                ),
                Positioned.directional(
                  textDirection: Directionality.of(context),
                  bottom: 10,
                  end: 10,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: AppColors.white, shape: BoxShape.circle),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.favorite_border_outlined,
                    ),
                  ),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DotsIndecator(
                      currentIndex: currentIndex,
                      dotNumber: widget.product.images.length),
                  Text(
                    widget.product.name ?? '',
                    style: AppStyles.style20,
                  ),
                  7.hSize,
                  Text(
                    'category name',
                    style: AppStyles.style12
                        .copyWith(color: AppColors.borderColor),
                  ),
                  15.hSize,
                  Row(
                    children: [
                      Text(
                        '\$ ${widget.product.price}',
                        style: AppStyles.style16,
                      ),
                      10.wSize,
                      Text(
                        ' \$ ${widget.product.oldPrice}',
                        style: AppStyles.style16.copyWith(
                          color: AppColors.borderColor,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      15.wSize,
                      if (widget.product.discount != null &&
                          widget.product.discount != 0) ...{
                        Text(
                          '${widget.product.discount}% OFF',
                          style: AppStyles.style16
                              .copyWith(color: AppColors.redColor),
                        ),
                      }
                    ],
                  ),
                  15.hSize,
                  Text(
                    S.of(context).selesct_quantity,
                    style: AppStyles.style14,
                  ),
                  15.hSize,
                  // ? quantity widget =============================
                  QuntatyItemDetailsWidget(
                    addOntap: () {},
                    removeOntap: () {},
                    qty: 2,
                  ),
                  15.hSize,
                  // ? show all details widget =============================
                  ShowAllDetailsproduct(
                    showOntap: () {
                      setState(() {
                        isShow = !isShow;
                      });
                    },
                    isShow: isShow,
                    productDescription: widget.product.description ?? '',
                  ),
                  10.hSize,
                ],
              ),
            ),
          ),

          // ? add to cart and buy now widget =============================
          SliverFillRemaining(
            hasScrollBody: false,
            child: AddCartAndBuyButtom(
              cartOntap: () {},
              buyOntap: () {},
            ),
          )
        ],
      ),
    );
  }
}
