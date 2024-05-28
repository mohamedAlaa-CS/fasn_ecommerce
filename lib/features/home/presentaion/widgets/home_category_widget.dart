import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class HomeCategoryWidget extends StatelessWidget {
  const HomeCategoryWidget(
      {super.key, required this.imageUrl, required this.title});
  final String imageUrl;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            height: 90,
            width: 90,
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
