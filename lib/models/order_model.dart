class OrderModel {
  late String orederId;
  late String orederType;
  late String orederDate;
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
    required this.orederId,
    required this.orederType,
    required this.orederDate,
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

  OrderModel.fromJson(Map<String, dynamic> json) {
    var productsList = json['products'];
    orederId = json['orederId'];
    orederType = json['orederType'];
    orederDate = json['orederDate'];
    numberOfPassengers = json['numberOfPassengers'];
    interests = json['interests'];
    userName = json['userName'];
    userUID = json['userUID'];
    numberOfProducts = json['numberOfProducts'];
    priceUpOfExpected = json['priceUpOfExpected'];
    productUnavailable = json['productUnavailable'];
    sellerNotReturnProduct = json['sellerNotReturnProduct'];
    productTakeTime = json['productTakeTime'];
    productContainsBranded = json['productContainsBranded'];
    productContainBatteries = json['productContainBatteries'];
    inspectionProductsBeforeSend = json['inspectionProductsBeforeSend'];
    orderStatus = json['orderStatus'];
    if (productsList != null) {
      products = productsList.map((product) => Product.fromJson(product)).toList();
    } else {
      products = null;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'orederId': orederId,
      'orederType': orederType,
      'numberOfPassengers': numberOfPassengers,
      'interests': interests,
      'orederDate': orederDate,
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
      'products': products == null ? null : products!.map((product) => product.toMap()).toList(),
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
  dynamic images;

  Product({
    this.urlForProduct,
    this.quantity,
    this.expectedPriceForOne,
    this.size,
    this.images,
    this.color,
    this.anotherDetails,
  });

  Product.fromJson(Map<String, dynamic> json) {
    urlForProduct = json['urlForProduct'];
    quantity = json['quantity'];
    expectedPriceForOne = json['expectedPriceForOne'];
    size = json['size'];
    color = json['color'];
    anotherDetails = json['anotherDetails'];
    images = json['images'];
  }

  Map<String, dynamic> toMap() {
    return {
      'urlForProduct': urlForProduct,
      'quantity': quantity,
      'expectedPriceForOne': expectedPriceForOne,
      'size': size,
      'color': color,
      'images': images,
      'anotherDetails': anotherDetails,
    };
  }
}
