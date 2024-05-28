import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/features/home/presentaion/widgets/home_category_widget.dart';
import 'package:flutter/material.dart';

class HomeCategoryListView extends StatelessWidget {
  const HomeCategoryListView({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(10, (index) {
          return Row(
            children: [
              GestureDetector(
                onTap: onTap,
                child: const HomeCategoryWidget(
                  imageUrl:
                      'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
                  title: 'short',
                ),
              ),
              10.wSize,
            ],
          );
        }),
      ),
    );
  }
}
