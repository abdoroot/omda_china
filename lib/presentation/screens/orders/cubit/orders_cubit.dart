import 'package:china_omda/models/order_model.dart';
import 'package:china_omda/presentation/presentation_managers/constancts_manager.dart';
import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:china_omda/presentation/screens/orders/cubit/orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitialState());
  static OrdersCubit get(context) => BlocProvider.of(context);
  var firestore = FirebaseFirestore.instance;

  Stream<List<OrderModel>> getOpenedOrder() {
    return firestore
        .collection('users')
        .doc(uId)
        .collection('orders')
        .where('orderStatus', isEqualTo: 'Opened')
        .snapshots()
        .map(
          (event) => event.docs.map((e) => OrderModel.fromJson(e.data())).toList(),
        );
  }

  void getOrder() {
    firestore
        .collection('users')
        .doc(uId)
        .collection('orders')
        .where('orderStatus', isEqualTo: 'Opened')
        .get()
        .then((value) {
      print(value.docs.first.data()['id']);
      emit(OrdersSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(OrdersErrorState());
    });
  }

  Stream<List<OrderModel>> getToPayOrder() {
    return firestore
        .collection('users')
        .doc(uId)
        .collection('orders')
        .where('orderStatus', isEqualTo: 'To pay')
        .snapshots()
        .map(
          (event) => event.docs.map((e) => OrderModel.fromJson(e.data())).toList(),
        );
  }

  Stream<List<OrderModel>> getFinishedOrder() {
    return firestore
        .collection('users')
        .doc(uId)
        .collection('orders')
        .where('orderStatus', isEqualTo: 'Finished')
        .snapshots()
        .map(
          (event) => event.docs.map((e) => OrderModel.fromJson(e.data())).toList(),
        );
  }

  Stream<List<OrderModel>> getShipmentOrder() {
    return firestore
        .collection('users')
        .doc(uId)
        .collection('orders')
        .where('orderStatus', isEqualTo: 'Shipment')
        .snapshots()
        .map(
          (event) => event.docs.map((e) => OrderModel.fromJson(e.data())).toList(),
        );
  }

  Stream<List<OrderModel>> getCanceledOrder() {
    return firestore
        .collection('users')
        .doc(uId)
        .collection('orders')
        .where('orderStatus', isEqualTo: 'Canceled')
        .snapshots()
        .map(
          (event) => event.docs.map((e) => OrderModel.fromJson(e.data())).toList(),
        );
  }
}
