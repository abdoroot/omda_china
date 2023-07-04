// class OrderModel {
//   late String orederId;
//   late String orederType;
//   late String orederDate;
//   late String userName;
//   late String userUID;
//   late String orderStatus;
//   String? numberOfPassengers;
//   dynamic interests;
//   String? numberOfProducts;
//   String? priceUpOfExpected;
//   String? productUnavailable;
//   String? sellerNotReturnProduct;
//   String? productTakeTime;
//   String? productContainsBranded;
//   String? productContainBatteries;
//   String? inspectionProductsBeforeSend;
//   List<Product>? products;

//   OrderModel({
//     required this.orederId,
//     required this.orederType,
//     required this.orederDate,
//     required this.userName,
//     required this.userUID,
//     required this.orderStatus,
//     this.numberOfPassengers,
//     this.interests,
//     this.numberOfProducts,
//     this.priceUpOfExpected,
//     this.productUnavailable,
//     this.sellerNotReturnProduct,
//     this.productTakeTime,
//     this.productContainsBranded,
//     this.productContainBatteries,
//     this.inspectionProductsBeforeSend,
//     this.products,
//   });

//   OrderModel.fromJson(Map<String, dynamic> json) {
//     var productsList = json['products'];
//     orederId = json['orederId'];
//     orederType = json['orederType'];
//     orederDate = json['orederDate'];
//     numberOfPassengers = json['numberOfPassengers'];
//     interests = json['interests'];
//     userName = json['userName'];
//     userUID = json['userUID'];
//     numberOfProducts = json['numberOfProducts'];
//     priceUpOfExpected = json['priceUpOfExpected'];
//     productUnavailable = json['productUnavailable'];
//     sellerNotReturnProduct = json['sellerNotReturnProduct'];
//     productTakeTime = json['productTakeTime'];
//     productContainsBranded = json['productContainsBranded'];
//     productContainBatteries = json['productContainBatteries'];
//     inspectionProductsBeforeSend = json['inspectionProductsBeforeSend'];
//     orderStatus = json['orderStatus'];
//     if (productsList != null) {
//       products = productsList.map((product) => Product.fromJson(product)).toList();
//     } else {
//       products = null;
//     }
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'orederId': orederId,
//       'orederType': orederType,
//       'numberOfPassengers': numberOfPassengers,
//       'interests': interests,
//       'orederDate': orederDate,
//       'userName': userName,
//       'userUID': userUID,
//       'numberOfProducts': numberOfProducts,
//       'priceUpOfExpected': priceUpOfExpected,
//       'productUnavailable': productUnavailable,
//       'sellerNotReturnProduct': sellerNotReturnProduct,
//       'productTakeTime': productTakeTime,
//       'productContainsBranded': productContainsBranded,
//       'productContainBatteries': productContainBatteries,
//       'inspectionProductsBeforeSend': inspectionProductsBeforeSend,
//       'orderStatus': orderStatus,
//       'products': products == null ? null : products!.map((product) => product.toMap()).toList(),
//     };
//   }
// }

// class Product {
//   String? urlForProduct;
//   String? quantity;
//   String? expectedPriceForOne;
//   String? size;
//   String? color;
//   String? anotherDetails;
//   dynamic images;

//   Product({
//     this.urlForProduct,
//     this.quantity,
//     this.expectedPriceForOne,
//     this.size,
//     this.images,
//     this.color,
//     this.anotherDetails,
//   });

//   Product.fromJson(Map<String, dynamic> json) {
//     urlForProduct = json['urlForProduct'];
//     quantity = json['quantity'];
//     expectedPriceForOne = json['expectedPriceForOne'];
//     size = json['size'];
//     color = json['color'];
//     anotherDetails = json['anotherDetails'];
//     images = json['images'];
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'urlForProduct': urlForProduct,
//       'quantity': quantity,
//       'expectedPriceForOne': expectedPriceForOne,
//       'size': size,
//       'color': color,
//       'images': images,
//       'anotherDetails': anotherDetails,
//     };
//   }
// }
class OrderModel {
  late String orderId;
  late String orderType;
  late String orderDate;
  late String userName;
  late String userUID;
  late String orderStatus;
  String? numberOfPassengers;
  dynamic interests;
  String? numberOfProducts;
  String? priceUpOfExpected;
  String? productUnavailable;
  String? sellerNotReturnProduct;
  String? productTakeTime;
  String? productContainsBranded;
  String? productContainBatteries;
  String? inspectionProductsBeforeSend;
  List<Product>? products;

  OrderModel({
    required this.orderId,
    required this.orderType,
    required this.orderDate,
    required this.userName,
    required this.userUID,
    required this.orderStatus,
    this.numberOfPassengers,
    this.interests,
    this.numberOfProducts,
    this.priceUpOfExpected,
    this.productUnavailable,
    this.sellerNotReturnProduct,
    this.productTakeTime,
    this.productContainsBranded,
    this.productContainBatteries,
    this.inspectionProductsBeforeSend,
    this.products,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    var productsList = json['products'] as List<dynamic>?;
    return OrderModel(
      orderId: json['orderId'],
      orderType: json['orderType'],
      orderDate: json['orderDate'],
      numberOfPassengers: json['numberOfPassengers'],
      interests: json['interests'],
      userName: json['userName'],
      userUID: json['userUID'],
      numberOfProducts: json['numberOfProducts'],
      priceUpOfExpected: json['priceUpOfExpected'],
      productUnavailable: json['productUnavailable'],
      sellerNotReturnProduct: json['sellerNotReturnProduct'],
      productTakeTime: json['productTakeTime'],
      productContainsBranded: json['productContainsBranded'],
      productContainBatteries: json['productContainBatteries'],
      inspectionProductsBeforeSend: json['inspectionProductsBeforeSend'],
      orderStatus: json['orderStatus'],
      products: productsList != null
          ? List<Product>.from(productsList.map((product) => Product.fromJson(product)))
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'orderType': orderType,
      'numberOfPassengers': numberOfPassengers,
      'interests': interests,
      'orderDate': orderDate,
      'userName': userName,
      'userUID': userUID,
      'numberOfProducts': numberOfProducts,
      'priceUpOfExpected': priceUpOfExpected,
      'productUnavailable': productUnavailable,
      'sellerNotReturnProduct': sellerNotReturnProduct,
      'productTakeTime': productTakeTime,
      'productContainsBranded': productContainsBranded,
      'productContainBatteries': productContainBatteries,
      'inspectionProductsBeforeSend': inspectionProductsBeforeSend,
      'orderStatus': orderStatus,
      'products':
          products != null ? List<dynamic>.from(products!.map((product) => product.toMap())) : null,
    };
  }
}

class Product {
  String? urlForProduct;
  String? quantity;
  String? expectedPriceForOne;
  String? size;
  String? color;
  String? anotherDetails;
  List<String>? images;

  Product({
    this.urlForProduct,
    this.quantity,
    this.expectedPriceForOne,
    this.size,
    this.images,
    this.color,
    this.anotherDetails,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      urlForProduct: json['urlForProduct'],
      quantity: json['quantity'],
      expectedPriceForOne: json['expectedPriceForOne'],
      size: json['size'],
      color: json['color'],
      anotherDetails: json['anotherDetails'],
      images: json['images'] != null
          ? List<String>.from(json['images'].map((image) => image.toString()))
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'urlForProduct': urlForProduct,
      'quantity': quantity,
      'expectedPriceForOne': expectedPriceForOne,
      'size': size,
      'color': color,
      'anotherDetails': anotherDetails,
      'images': images != null ? List<dynamic>.from(images!.map((image) => image)) : null,
    };
  }
}
