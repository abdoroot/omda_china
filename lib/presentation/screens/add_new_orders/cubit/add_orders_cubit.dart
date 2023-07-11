import 'dart:io';
import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class AddOrdersCubit extends Cubit<AddOrdersState> {
  AddOrdersCubit() : super(AddOrdersInitial());

  static AddOrdersCubit get(context) => BlocProvider.of(context);

  var firestroe = FirebaseFirestore.instance;

  List<String> option = [
    AppStrings.tourism,
    AppStrings.orderProducts,
  ];
  String? orderType;
  void selecteOrderType(String value) {
    orderType = value;
    emit(SelecteOrderType());
  }

  TextEditingController orderId = TextEditingController();
  TextEditingController passengersNumber = TextEditingController();
  TextEditingController orderDate = TextEditingController();
  TextEditingController orderUserName = TextEditingController();
  TextEditingController orderTypeController = TextEditingController();

  Future<String> generateOrderId() async {
    return orderId.text = await generateUniqueId();
  }

  ///////////////////// Tourism order ///////////////
  List<String> interests = [];
  TextEditingController interestController = TextEditingController();

  void addInterest(String interest) {
    interests.add(interest);
    interestController.clear();
    emit(AddInterests());
  }

  void removeInterest(String interest) {
    interests.remove(interest);
    emit(RemoveInterests());
  }

  void clearTourismController() {
    interestController.clear();
    interests = [];
    passengersNumber.clear();
    orderType = null;
  }

  Future<void> makeTourismOrder({
    required String ordrId,
    required String orederType,
    required String userName,
    required List<String> interests,
    required String numberOfPassengers,
  }) async {
    OrderModel orderModel = OrderModel(
      orderId: ordrId,
      orderType: orederType,
      orderDate: DateTime.now().toString(),
      userName: userName,
      userUID: uId!,
      orderStatus: 'Opened',
      numberOfPassengers: numberOfPassengers,
      interests: interests,
    );
    await firestroe
        .collection('users')
        .doc(uId)
        .collection('orders')
        .doc(ordrId)
        .set(orderModel.toMap())
        .then((value) async {
      await firestroe
          .collection('users')
          .doc(uId)
          .collection('orders')
          .doc(ordrId)
          .set(orderModel.toMap())
          .then((value) async {
        await firestroe
            .collection('admin_panel')
            .doc('user')
            .collection('orders')
            .doc(ordrId)
            .set(orderModel.toMap())
            .then((value) {
          emit(MakeTourismOrderSuccess());
        }).catchError((e) {
          emit(MakeTourismOrderError());
        });
      }).catchError((error) {
        emit(MakeTourismOrderError());
      });
    });
  }

  ////////////////// Product Order //////////////////////////
  GlobalKey<FormState> orderKey = GlobalKey<FormState>();
  TextEditingController numberOfProduct = TextEditingController();
  TextEditingController productUrl = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  TextEditingController productquantity = TextEditingController();
  TextEditingController productSize = TextEditingController();
  TextEditingController productColor = TextEditingController();
  TextEditingController productAnotherDetails = TextEditingController();

  List<File> images = [];

  Future<void> pickAllImage() async {
    List<XFile>? selectedImages = await ImagePicker().pickMultiImage();
    images = selectedImages.map((XFile file) => File(file.path)).toList();
  }

  Future<List<String>> uploadImages(List<File> images) async {
    List<String> imageUrls = [];
    int lengthOfImage = images.length >= 5 ? 5 : images.length;

    for (var i = 0; i < lengthOfImage; i++) {
      File image = images[i];

      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('product_images/${Uri.file(image.path).pathSegments.last}');
      UploadTask uploadTask = storageReference.putFile(image);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      imageUrls.add(downloadUrl);
    }

    return imageUrls;
  }

  List<Product> products = [];

  Future<void> makeProductOrder({
    required String ordrId,
    required String orederType,
    required String userName,
    required String numberOfProduct,
    required String priceUpOfExpected,
    required String productUnavailable,
    required String sellerNotReturnProduct,
    required String productTakeTime,
    required String productContainsBranded,
    required String productContainBatteries,
    required String inspectionProductsBeforeSend,
    required List<Product> products,
  }) async {
    OrderModel orderModel = OrderModel(
      orderId: ordrId,
      orderType: orederType,
      orderDate: DateTime.now().toString(),
      userName: userName,
      userUID: uId!,
      orderStatus: 'Opened',
      inspectionProductsBeforeSend: inspectionProductsBeforeSend,
      numberOfProducts: numberOfProduct,
      priceUpOfExpected: priceUpOfExpected,
      productContainBatteries: productContainBatteries,
      productContainsBranded: productContainsBranded,
      productTakeTime: productTakeTime,
      productUnavailable: productUnavailable,
      sellerNotReturnProduct: sellerNotReturnProduct,
      products: products,
    );
    await firestroe
        .collection('users')
        .doc(uId)
        .collection('orders')
        .doc(ordrId)
        .set(orderModel.toMap())
        .then((value) async {
      await firestroe
          .collection('admin_panel')
          .doc('user')
          .collection('orders')
          .doc(ordrId)
          .set(orderModel.toMap())
          .then((value) {
        emit(MakeProductOrderSuccess());
        products = [];
      }).catchError((e) {
        emit(MakeProductOrderError());
      });
    }).catchError((error) {
      emit(MakeProductOrderError());
    });
  }

  List<String> priceUpExpected = [
    AppStrings.priceUp1,
    AppStrings.priceUp2,
    AppStrings.priceUp3,
  ];
  String? priceUpOfExpected;
  void selectepriceUpOfExpected(String value) {
    priceUpOfExpected = value;
  }

  List<String> productNotAvailable = [
    AppStrings.unAvailable1,
    AppStrings.unAvailable2,
  ];
  String? productUnAvailable;
  void selecteproductUnAvailable(String value) {
    productUnAvailable = value;
  }

  List<String> productNotReturn = [
    AppStrings.noReturn1,
    AppStrings.noReturn2,
    AppStrings.noReturn3,
  ];
  String? notReturn;
  void selectenotReturn(String value) {
    notReturn = value;
  }

  List<String> productTakeTime = [
    AppStrings.takeTime1,
    AppStrings.takeTime2,
    AppStrings.takeTime3,
    AppStrings.takeTime4,
  ];
  String? takeTime;
  void selectetakeTime(String value) {
    takeTime = value;
  }

  List<String> productContainBrand = [
    AppStrings.containBrand1,
    AppStrings.containBrand2,
    AppStrings.containBrand3,
  ];
  String? containBrand;
  void selectecontainBrand(String value) {
    containBrand = value;
  }

  List<String> productContainBatteries = [
    AppStrings.containBatteries1,
    AppStrings.containBatteries2,
    AppStrings.containBatteries3,
    AppStrings.containBatteries4,
  ];
  String? containBatteries;
  void selectecontainBatteries(String value) {
    containBatteries = value;
  }

  List<String> productPreview = [
    AppStrings.preview1,
    AppStrings.preview2,
  ];
  String? preview;
  void selectePreview(String value) {
    preview = value;
  }

  int productIndex = 0;

  void changeProductIndex(int index) {
    productIndex = index;
    emit(ChangeProductIndex());
  }

  List<List<TextEditingController>> controllers = [];
  List<List<String>> imagesForAll = [];

  void initControllers() {
    for (var i = 0; i < int.tryParse(numberOfProduct.text)!; i++) {
      List<TextEditingController> productControllers = [];
      for (var j = 0; j < 6; j++) {
        productControllers.add(TextEditingController());
      }
      controllers.add(productControllers);
      List<String> image = [];
      imagesForAll.add(image);
    }
  }

  void clearProductOrderData() {
    imagesForAll = [];
    controllers = [];
    productIndex = 0;
    preview = null;
    containBatteries = null;
    containBrand = null;
    takeTime = null;
    notReturn = null;
    productUnAvailable = null;
    priceUpOfExpected = null;
    numberOfProduct.clear();
    productUrl.clear();
    productPrice.clear();
    productquantity.clear();
    productSize.clear();
    productColor.clear();
    productAnotherDetails.clear();
    orderType = null;
  }
}
