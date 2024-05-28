import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/helper/extensions/context_size.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class HomeBannerPageViewWidget extends StatelessWidget {
  const HomeBannerPageViewWidget(
      {super.key,
      required this.pageController,
      required this.imageUrl,
      required this.title});
  final PageController pageController;
  final String imageUrl;
  final String title;
  @override
  Widget build(BuildContext context) {
    bool isOrientationPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return SizedBox(
      height: isOrientationPortrait ? context.height / 5 : context.width / 4,
      child: PageView.builder(
          controller: pageController,
          itemCount: 10,
          itemBuilder: (context, i) {
            return ClipRRect(
              borderRadius: 12.cBorder,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Container(
                    constraints: BoxConstraints(maxWidth: context.width / 2),
                    child: Text(
                      textAlign: TextAlign.center,
                      title,
                      style: AppStyles.style28,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
