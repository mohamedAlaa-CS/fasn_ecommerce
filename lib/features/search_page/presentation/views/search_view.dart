import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:fasn_ecommerce/core/widgets/app_text_form.dart';
import 'package:fasn_ecommerce/features/home/data/models/home_model/product_model.dart';
import 'package:fasn_ecommerce/features/home/presentaion/widgets/product_widget.dart';
import 'package:fasn_ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Column(
      children: [
        10.hSize,
        MainTextField(
          prefixIcon: Icons.search,
          hintText: S.of(context).search_Now,
          hintStyle: AppStyles.style18.copyWith(color: AppColors.borderColor),
          fillColor: AppColors.violateColor,
        ),
        20.hSize,
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: isPortrait ? (1 / 1.7) : (1 / 1.3),
            ),
            itemBuilder: (context, index) => ProductWidget(
              product: ProductModel(
                description: 'm lkjnv',
                image: 'image',
                price: 100,
                name: 'title',
              ),
            ),
            itemCount: 8,
          ),
        ),
      ],
    );
  }
}
