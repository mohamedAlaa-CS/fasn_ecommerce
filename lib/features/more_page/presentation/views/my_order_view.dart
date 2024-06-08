import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/features/more_page/data/repos/order_repo/order_repo_imple.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/manager/order_cubit/order_cubit.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/views/my_orders_details.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/widgets/my_order_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrderView extends StatelessWidget {
  static const String routeName = "MyOrderView";
  const MyOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit(OrderRepoImple()),
      child: BlocConsumer<OrderCubit, OrderState>(
        listener: (context, state) {},
        builder: (context, state) {
          var orderCubit = OrderCubit.get(context);
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
                        child: (state is GetOrdersLoading)
                            ? const Center(child: CircularProgressIndicator())
                            : ListView.separated(
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                        MyOrderDetails.routeName,
                                        arguments:
                                            orderCubit.myOrders[index].id,
                                      );
                                    },
                                    child: MyOrderWidget(
                                      model: orderCubit.myOrders[index],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) => 10.hSize,
                                itemCount: orderCubit.myOrders.length,
                              ),
                      )
                    ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
