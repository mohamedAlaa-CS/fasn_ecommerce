import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/manager/order_cubit/order_cubit.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/widgets/my_order_resiving_widget.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/widgets/my_orders_product_widgets.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/widgets/price_widget.dart';
import 'package:fasn_ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrderDetails extends StatelessWidget {
  static const String routeName = 'MyOrderDetails';
  const MyOrderDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {},
      builder: (context, state) {
        var orderCubit = OrderCubit.get(context);
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SafeArea(
            child: Padding(
              padding: 14.aEdge,
              child: (state is GetOrderDetailsLoading)
                  ? const Center(child: CircularProgressIndicator())
                  : (state is GetOrderDetailsFailed)
                      ? Text(state.error)
                      : SingleChildScrollView(
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
                              // //? products ================
                              ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: orderCubit
                                      .orderDetailsModel?.products?.length,
                                  itemBuilder: (context, index) {
                                    return MyOrderDetailsWidget(
                                      image: orderCubit.orderDetailsModel
                                              ?.products?[index].image ??
                                          '',
                                      title: orderCubit.orderDetailsModel
                                              ?.products?[index].name ??
                                          '',
                                      price: orderCubit.orderDetailsModel
                                              ?.products?[index].price ??
                                          0.0,
                                      quantity: orderCubit.orderDetailsModel
                                              ?.products?[index].quantity ??
                                          0,
                                    );
                                  }),
                              //? resiving details ===========================
                              10.hSize,
                              MyOrderResivingWidget(
                                title: S.of(context).payment_method,
                                subtitle: orderCubit
                                        .orderDetailsModel?.paymentMethod ??
                                    '',
                                icon: Icons.payments,
                                color: Colors.green,
                              ),
                              10.hSize,
                              MyOrderResivingWidget(
                                title: S.of(context).oreder_date,
                                subtitle:
                                    orderCubit.orderDetailsModel?.date ?? '',
                                icon: Icons.date_range,
                                color: Colors.blue,
                              ),
                              //? total price ============================
                              20.hSize,
                              Text(
                                S.of(context).total_order,
                                style: AppStyles.style20,
                              ),
                              10.hSize,
                              PriceWidget(
                                  title: S.of(context).total,
                                  price: orderCubit.orderDetailsModel?.total
                                          ?.toDouble() ??
                                      0.0),
                              10.hSize,
                              PriceWidget(
                                  title: S.of(context).discount,
                                  price: orderCubit.orderDetailsModel?.discount
                                          ?.toDouble() ??
                                      0.0),
                              12.hSize,
                              const Divider(),
                              PriceWidget(
                                title: S.of(context).total_price,
                                price: orderCubit.orderDetailsModel?.total
                                        ?.toDouble() ??
                                    0.0,
                                textColor: AppColors.green,
                              ),
                              7.hSize,
                            ],
                          ),
                        ),
            ),
          ),
        );
      },
    );
  }
}
