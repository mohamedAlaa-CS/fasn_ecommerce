import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/widgets/my_order_widget.dart';
import 'package:flutter/material.dart';

class MyOrderView extends StatelessWidget {
  static const String routeName = "MyOrderView";
  const MyOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: 14.aEdge,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // ? back button ================
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColors.white,
                    size: 28,
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return const MyOrderWidget(
                        status: 'Shipped',
                        orderDate: '2022-10-20',
                        orderCode: 1234,
                        total: 100.0,
                      );
                    },
                    separatorBuilder: (context, index) => 10.hSize,
                    itemCount: 4,
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
