import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/helper/extensions/context_size.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class HomeCategoryWidget extends StatelessWidget {
  const HomeCategoryWidget(
      {super.key, required this.imageUrl, required this.title});
  final String imageUrl;
  final String title;
  @override
  Widget build(BuildContext context) {
    bool isportrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            height: isportrait ? context.height / 10 : context.width / 10,
            width: isportrait ? context.width / 5 : context.height / 5,
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        10.hSize,
        Text(
          title,
          style: AppStyles.style12,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
