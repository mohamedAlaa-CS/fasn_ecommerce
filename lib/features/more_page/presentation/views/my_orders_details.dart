import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/widgets/my_order_resiving_widget.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/widgets/my_orders_product_widgets.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/widgets/price_widget.dart';
import 'package:fasn_ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class MyOrderDetails extends StatelessWidget {
  static const String routeName = 'MyOrderDetails';
  const MyOrderDetails({super.key, this.id});
  final id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: 14.aEdge,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              //? products ================
              const MyOrderDetailsWidget(
                image:
                    'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                title: 'Product Name',
                price: 2000,
                quantity: 1,
              ),
              10.hSize,
              MyOrderResivingWidget(
                title: S.of(context).payment_method,
                subtitle: 'Your order has been received',
                icon: Icons.payments,
                color: Colors.green,
              ),
              10.hSize,
              MyOrderResivingWidget(
                title: S.of(context).oreder_date,
                subtitle: 'Your order has been received',
                icon: Icons.date_range,
                color: Colors.blue,
              ),
              20.hSize,
              Text(
                S.of(context).total_order,
                style: AppStyles.style20,
              ),
              10.hSize,
              PriceWidget(title: S.of(context).total, price: 2000),
              10.hSize,
              PriceWidget(title: S.of(context).discount, price: 2000),
              12.hSize,
              const Divider(),
              PriceWidget(
                title: S.of(context).discount,
                price: 2000,
                textColor: AppColors.green,
              ),
              7.hSize,
            ],
          ),
        ),
      ),
    );
  }
}
