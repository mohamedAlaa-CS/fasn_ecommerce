import 'package:fasn_ecommerce/core/helper/functions/show_snack_bar.dart';
import 'package:fasn_ecommerce/features/more_page/data/models/get_oreders_model.dart';
import 'package:fasn_ecommerce/features/more_page/data/models/oreder_details_model/oreder_details_model.dart';
import 'package:fasn_ecommerce/features/more_page/data/repos/order_repo/order_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.orderRepo) : super(OrderInitial()) {
    getOrders();
  }
  static OrderCubit get(context) => BlocProvider.of<OrderCubit>(context);
  final OrderRepo orderRepo;
  List<GetOredersModel> myOrders = [];
  getOrders() async {
    emit(GetOrdersLoading());
    var result = await orderRepo.getMyOrders();
    result.fold(
      (l) {
        emit(GetOrdersFailed());
      },
      (r) {
        emit(GetOrdersSuccess());
        myOrders = r;
      },
    );
  }

  OrederDetailsModel? orderDetailsModel;
  getDeatilsOrder({required int id}) async {
    // orderDetailsModel = null;
    emit(GetOrderDetailsLoading());
    var result = await orderRepo.getOrderDetails(orderId: id);

    result.fold(
      (l) {
        emit(GetOrderDetailsFailed(l.message));

        showSnackbar(l.message, error: true);
      },
      (r) {
        emit(GetOrderDetailsSuccess());
        orderDetailsModel = r;
      },
    );
  }
}
