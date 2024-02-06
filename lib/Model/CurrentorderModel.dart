/// response_code : "1"
/// message : "Orders Found"
/// orders : [{"order_id":"4","total":"400","date":"2024-02-02","assign_id":"31","payment_mode":"COD","address":"151,Ward 35, Ratna Lok Colony, Indore, Madhya Pradesh 452010, India, 55, Indore, Madhya Pradesh, ","orders_type":"One Way","vehicle_type":"1","time":"From 01:14 To 02:01","sub_total":"","order_status":"2","delivery_charge":"100","discount":"0","accept_reject_vendor":"1","payment_status":"0","vendor_name":"asdfa","pick_address":"indore ganes","order_items":[{"product_id":"2","cat_id":"1","subcat_id":"2","child_category":"2","product_name":"Dawat Biryani","product_description":"Dawat Biryani","product_price":"500","product_image":"https://developmentalphawizz.com/hojayega//uploads/product_image/1703770615Rs__200_Off.jpg","pro_ratings":"0.0","role_id":"","selling_price":"500","product_create_date":"2023-12-28 19:06:55","vendor_id":"139","other_image":"","product_status":"0","variant_name":"","product_type":"","tax":"0","unit":"1kg","unit_type":"","qty":"2"}],"count":2}]
/// status : "success"

class CurrentorderModel {
  CurrentorderModel({
      String? responseCode, 
      String? message, 
      List<Orders>? orders, 
      String? status,}){
    _responseCode = responseCode;
    _message = message;
    _orders = orders;
    _status = status;
}

  CurrentorderModel.fromJson(dynamic json) {
    _responseCode = json['response_code'];
    _message = json['message'];
    if (json['orders'] != null) {
      _orders = [];
      json['orders'].forEach((v) {
        _orders?.add(Orders.fromJson(v));
      });
    }
    _status = json['status'];
  }
  String? _responseCode;
  String? _message;
  List<Orders>? _orders;
  String? _status;
CurrentorderModel copyWith({  String? responseCode,
  String? message,
  List<Orders>? orders,
  String? status,
}) => CurrentorderModel(  responseCode: responseCode ?? _responseCode,
  message: message ?? _message,
  orders: orders ?? _orders,
  status: status ?? _status,
);
  String? get responseCode => _responseCode;
  String? get message => _message;
  List<Orders>? get orders => _orders;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['response_code'] = _responseCode;
    map['message'] = _message;
    if (_orders != null) {
      map['orders'] = _orders?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    return map;
  }

}

/// order_id : "4"
/// total : "400"
/// date : "2024-02-02"
/// assign_id : "31"
/// payment_mode : "COD"
/// address : "151,Ward 35, Ratna Lok Colony, Indore, Madhya Pradesh 452010, India, 55, Indore, Madhya Pradesh, "
/// orders_type : "One Way"
/// vehicle_type : "1"
/// time : "From 01:14 To 02:01"
/// sub_total : ""
/// order_status : "2"
/// delivery_charge : "100"
/// discount : "0"
/// accept_reject_vendor : "1"
/// payment_status : "0"
/// vendor_name : "asdfa"
/// pick_address : "indore ganes"
/// order_items : [{"product_id":"2","cat_id":"1","subcat_id":"2","child_category":"2","product_name":"Dawat Biryani","product_description":"Dawat Biryani","product_price":"500","product_image":"https://developmentalphawizz.com/hojayega//uploads/product_image/1703770615Rs__200_Off.jpg","pro_ratings":"0.0","role_id":"","selling_price":"500","product_create_date":"2023-12-28 19:06:55","vendor_id":"139","other_image":"","product_status":"0","variant_name":"","product_type":"","tax":"0","unit":"1kg","unit_type":"","qty":"2"}]
/// count : 2

class Orders {
  Orders({
      String? orderId, 
      String? total, 
      String? date, 
      String? assignId, 
      String? paymentMode, 
      String? address, 
      String? ordersType, 
      String? vehicleType, 
      String? time, 
      String? subTotal, 
      String? orderStatus, 
      String? deliveryCharge, 
      String? discount, 
      String? acceptRejectVendor, 
      String? paymentStatus, 
      String? vendorName, 
      String? pickAddress, 
      List<OrderItems>? orderItems, 
      num? count,}){
    _orderId = orderId;
    _total = total;
    _date = date;
    _assignId = assignId;
    _paymentMode = paymentMode;
    _address = address;
    _ordersType = ordersType;
    _vehicleType = vehicleType;
    _time = time;
    _subTotal = subTotal;
    _orderStatus = orderStatus;
    _deliveryCharge = deliveryCharge;
    _discount = discount;
    _acceptRejectVendor = acceptRejectVendor;
    _paymentStatus = paymentStatus;
    _vendorName = vendorName;
    _pickAddress = pickAddress;
    _orderItems = orderItems;
    _count = count;
}

  Orders.fromJson(dynamic json) {
    _orderId = json['order_id'];
    _total = json['total'];
    _date = json['date'];
    _assignId = json['assign_id'];
    _paymentMode = json['payment_mode'];
    _address = json['address'];
    _ordersType = json['orders_type'];
    _vehicleType = json['vehicle_type'];
    _time = json['time'];
    _subTotal = json['sub_total'];
    _orderStatus = json['order_status'];
    _deliveryCharge = json['delivery_charge'];
    _discount = json['discount'];
    _acceptRejectVendor = json['accept_reject_vendor'];
    _paymentStatus = json['payment_status'];
    _vendorName = json['vendor_name'];
    _pickAddress = json['pick_address'];
    if (json['order_items'] != null) {
      _orderItems = [];
      json['order_items'].forEach((v) {
        _orderItems?.add(OrderItems.fromJson(v));
      });
    }
    _count = json['count'];
  }
  String? _orderId;
  String? _total;
  String? _date;
  String? _assignId;
  String? _paymentMode;
  String? _address;
  String? _ordersType;
  String? _vehicleType;
  String? _time;
  String? _subTotal;
  String? _orderStatus;
  String? _deliveryCharge;
  String? _discount;
  String? _acceptRejectVendor;
  String? _paymentStatus;
  String? _vendorName;
  String? _pickAddress;
  List<OrderItems>? _orderItems;
  num? _count;
Orders copyWith({  String? orderId,
  String? total,
  String? date,
  String? assignId,
  String? paymentMode,
  String? address,
  String? ordersType,
  String? vehicleType,
  String? time,
  String? subTotal,
  String? orderStatus,
  String? deliveryCharge,
  String? discount,
  String? acceptRejectVendor,
  String? paymentStatus,
  String? vendorName,
  String? pickAddress,
  List<OrderItems>? orderItems,
  num? count,
}) => Orders(  orderId: orderId ?? _orderId,
  total: total ?? _total,
  date: date ?? _date,
  assignId: assignId ?? _assignId,
  paymentMode: paymentMode ?? _paymentMode,
  address: address ?? _address,
  ordersType: ordersType ?? _ordersType,
  vehicleType: vehicleType ?? _vehicleType,
  time: time ?? _time,
  subTotal: subTotal ?? _subTotal,
  orderStatus: orderStatus ?? _orderStatus,
  deliveryCharge: deliveryCharge ?? _deliveryCharge,
  discount: discount ?? _discount,
  acceptRejectVendor: acceptRejectVendor ?? _acceptRejectVendor,
  paymentStatus: paymentStatus ?? _paymentStatus,
  vendorName: vendorName ?? _vendorName,
  pickAddress: pickAddress ?? _pickAddress,
  orderItems: orderItems ?? _orderItems,
  count: count ?? _count,
);
  String? get orderId => _orderId;
  String? get total => _total;
  String? get date => _date;
  String? get assignId => _assignId;
  String? get paymentMode => _paymentMode;
  String? get address => _address;
  String? get ordersType => _ordersType;
  String? get vehicleType => _vehicleType;
  String? get time => _time;
  String? get subTotal => _subTotal;
  String? get orderStatus => _orderStatus;
  String? get deliveryCharge => _deliveryCharge;
  String? get discount => _discount;
  String? get acceptRejectVendor => _acceptRejectVendor;
  String? get paymentStatus => _paymentStatus;
  String? get vendorName => _vendorName;
  String? get pickAddress => _pickAddress;
  List<OrderItems>? get orderItems => _orderItems;
  num? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_id'] = _orderId;
    map['total'] = _total;
    map['date'] = _date;
    map['assign_id'] = _assignId;
    map['payment_mode'] = _paymentMode;
    map['address'] = _address;
    map['orders_type'] = _ordersType;
    map['vehicle_type'] = _vehicleType;
    map['time'] = _time;
    map['sub_total'] = _subTotal;
    map['order_status'] = _orderStatus;
    map['delivery_charge'] = _deliveryCharge;
    map['discount'] = _discount;
    map['accept_reject_vendor'] = _acceptRejectVendor;
    map['payment_status'] = _paymentStatus;
    map['vendor_name'] = _vendorName;
    map['pick_address'] = _pickAddress;
    if (_orderItems != null) {
      map['order_items'] = _orderItems?.map((v) => v.toJson()).toList();
    }
    map['count'] = _count;
    return map;
  }

}

/// product_id : "2"
/// cat_id : "1"
/// subcat_id : "2"
/// child_category : "2"
/// product_name : "Dawat Biryani"
/// product_description : "Dawat Biryani"
/// product_price : "500"
/// product_image : "https://developmentalphawizz.com/hojayega//uploads/product_image/1703770615Rs__200_Off.jpg"
/// pro_ratings : "0.0"
/// role_id : ""
/// selling_price : "500"
/// product_create_date : "2023-12-28 19:06:55"
/// vendor_id : "139"
/// other_image : ""
/// product_status : "0"
/// variant_name : ""
/// product_type : ""
/// tax : "0"
/// unit : "1kg"
/// unit_type : ""
/// qty : "2"

class OrderItems {
  OrderItems({
      String? productId, 
      String? catId, 
      String? subcatId, 
      String? childCategory, 
      String? productName, 
      String? productDescription, 
      String? productPrice, 
      String? productImage, 
      String? proRatings, 
      String? roleId, 
      String? sellingPrice, 
      String? productCreateDate, 
      String? vendorId, 
      String? otherImage, 
      String? productStatus, 
      String? variantName, 
      String? productType, 
      String? tax, 
      String? unit, 
      String? unitType, 
      String? qty,}){
    _productId = productId;
    _catId = catId;
    _subcatId = subcatId;
    _childCategory = childCategory;
    _productName = productName;
    _productDescription = productDescription;
    _productPrice = productPrice;
    _productImage = productImage;
    _proRatings = proRatings;
    _roleId = roleId;
    _sellingPrice = sellingPrice;
    _productCreateDate = productCreateDate;
    _vendorId = vendorId;
    _otherImage = otherImage;
    _productStatus = productStatus;
    _variantName = variantName;
    _productType = productType;
    _tax = tax;
    _unit = unit;
    _unitType = unitType;
    _qty = qty;
}

  OrderItems.fromJson(dynamic json) {
    _productId = json['product_id'];
    _catId = json['cat_id'];
    _subcatId = json['subcat_id'];
    _childCategory = json['child_category'];
    _productName = json['product_name'];
    _productDescription = json['product_description'];
    _productPrice = json['product_price'];
    _productImage = json['product_image'];
    _proRatings = json['pro_ratings'];
    _roleId = json['role_id'];
    _sellingPrice = json['selling_price'];
    _productCreateDate = json['product_create_date'];
    _vendorId = json['vendor_id'];
    _otherImage = json['other_image'];
    _productStatus = json['product_status'];
    _variantName = json['variant_name'];
    _productType = json['product_type'];
    _tax = json['tax'];
    _unit = json['unit'];
    _unitType = json['unit_type'];
    _qty = json['qty'];
  }
  String? _productId;
  String? _catId;
  String? _subcatId;
  String? _childCategory;
  String? _productName;
  String? _productDescription;
  String? _productPrice;
  String? _productImage;
  String? _proRatings;
  String? _roleId;
  String? _sellingPrice;
  String? _productCreateDate;
  String? _vendorId;
  String? _otherImage;
  String? _productStatus;
  String? _variantName;
  String? _productType;
  String? _tax;
  String? _unit;
  String? _unitType;
  String? _qty;
OrderItems copyWith({  String? productId,
  String? catId,
  String? subcatId,
  String? childCategory,
  String? productName,
  String? productDescription,
  String? productPrice,
  String? productImage,
  String? proRatings,
  String? roleId,
  String? sellingPrice,
  String? productCreateDate,
  String? vendorId,
  String? otherImage,
  String? productStatus,
  String? variantName,
  String? productType,
  String? tax,
  String? unit,
  String? unitType,
  String? qty,
}) => OrderItems(  productId: productId ?? _productId,
  catId: catId ?? _catId,
  subcatId: subcatId ?? _subcatId,
  childCategory: childCategory ?? _childCategory,
  productName: productName ?? _productName,
  productDescription: productDescription ?? _productDescription,
  productPrice: productPrice ?? _productPrice,
  productImage: productImage ?? _productImage,
  proRatings: proRatings ?? _proRatings,
  roleId: roleId ?? _roleId,
  sellingPrice: sellingPrice ?? _sellingPrice,
  productCreateDate: productCreateDate ?? _productCreateDate,
  vendorId: vendorId ?? _vendorId,
  otherImage: otherImage ?? _otherImage,
  productStatus: productStatus ?? _productStatus,
  variantName: variantName ?? _variantName,
  productType: productType ?? _productType,
  tax: tax ?? _tax,
  unit: unit ?? _unit,
  unitType: unitType ?? _unitType,
  qty: qty ?? _qty,
);
  String? get productId => _productId;
  String? get catId => _catId;
  String? get subcatId => _subcatId;
  String? get childCategory => _childCategory;
  String? get productName => _productName;
  String? get productDescription => _productDescription;
  String? get productPrice => _productPrice;
  String? get productImage => _productImage;
  String? get proRatings => _proRatings;
  String? get roleId => _roleId;
  String? get sellingPrice => _sellingPrice;
  String? get productCreateDate => _productCreateDate;
  String? get vendorId => _vendorId;
  String? get otherImage => _otherImage;
  String? get productStatus => _productStatus;
  String? get variantName => _variantName;
  String? get productType => _productType;
  String? get tax => _tax;
  String? get unit => _unit;
  String? get unitType => _unitType;
  String? get qty => _qty;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = _productId;
    map['cat_id'] = _catId;
    map['subcat_id'] = _subcatId;
    map['child_category'] = _childCategory;
    map['product_name'] = _productName;
    map['product_description'] = _productDescription;
    map['product_price'] = _productPrice;
    map['product_image'] = _productImage;
    map['pro_ratings'] = _proRatings;
    map['role_id'] = _roleId;
    map['selling_price'] = _sellingPrice;
    map['product_create_date'] = _productCreateDate;
    map['vendor_id'] = _vendorId;
    map['other_image'] = _otherImage;
    map['product_status'] = _productStatus;
    map['variant_name'] = _variantName;
    map['product_type'] = _productType;
    map['tax'] = _tax;
    map['unit'] = _unit;
    map['unit_type'] = _unitType;
    map['qty'] = _qty;
    return map;
  }

}