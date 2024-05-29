import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/features/category/presentation/widgets/category_widget.dart';
import 'package:flutter/widgets.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
            separatorBuilder: (context, index) {
              return 10.hSize;
            },
            itemCount: 10,
            itemBuilder: (context, index) {
              return CategortItemWidget(
                imageUrl:
                    'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
                title: 'Electronics',
                onTap: () {},
              );
            }));
  }
}
