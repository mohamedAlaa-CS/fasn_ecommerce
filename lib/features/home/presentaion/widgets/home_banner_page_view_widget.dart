import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/helper/extensions/context_size.dart';
import 'package:fasn_ecommerce/features/home/data/models/home_model/banner_model.dart';
import 'package:flutter/material.dart';

class HomeBannerPageViewWidget extends StatelessWidget {
  const HomeBannerPageViewWidget({
    super.key,
    required this.pageController,
    required this.bannerList,
  });
  final PageController pageController;
  final List<BannerModel> bannerList;
  @override
  Widget build(BuildContext context) {
    log(bannerList.length.toString());
    bool isOrientationPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return SizedBox(
      height: isOrientationPortrait ? context.height / 5 : context.width / 3.5,
      child: PageView.builder(
          controller: pageController,
          itemCount: bannerList.length,
          itemBuilder: (context, i) {
            return ClipRRect(
              borderRadius: 12.cBorder,
              child: CachedNetworkImage(
                imageUrl: bannerList[i].image ?? '',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            );
          }),
    );
  }
}
