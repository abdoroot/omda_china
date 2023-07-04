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

  int calImages(List<Product> products) {
    int numImages = 0;
    for (var product in products) {
      List<String> images = product.images!;
      numImages += images.length;
    }
    return numImages;
  }
}
