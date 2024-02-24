/// error : false
/// message : "Get Orders List"
/// data : {"total_cod_orders":"400","total_online_orders":"0","total_orders":"1","total_earning":"0","total_incentive":"0","settlement_amount":"400"}
/// orders : [{"order_id":"3","user_id":"1","total":"400","items":"","payment_mode":"COD","address":"151,Ward 35, Ratna Lok Colony, Indore, Madhya Pradesh 452010, India, 55, Indore, Madhya Pradesh, ","date":"2024-02-02","datea":"2024-02-02","txn_id":"","p_status":"","p_date":"","order_status":"6","mobile_no":"","vendor_id":"1","subtotal":"","vendor_payment_admin":"","gst_charge":"","user_gst":"","distance":"","assign_id":"3","online_status":"0","otp":"0","username":"","address_id":"1","user_pay_gst":"","time":"From 18:30 To 21:40","order_type":"Urgent","lat":"22.7469348","lang":"75.8980157","state":"15","city":"120","region":"6","orders_type":"One Way","product_type":"2","vehicle_type":"1","payment_status":"0","accept_reject_vendor":"1","cart_id":"0","delivery_charge":"0","sub_total":"0","discount":"0","promo_code":"","vehicle_types":"0","pick_region":"6","drop_region":"6","order_image":null,"pickup_name":"","pickup_mobile":"","product_description":"","note":""}]

class GetReportsModel {
  GetReportsModel({
      bool? error, 
      String? message, 
      Data? data, 
      List<Reports>? orders,}){
    _error = error;
    _message = message;
    _data = data;
    _orders = orders;
}

  GetReportsModel.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    if (json['orders'] != null) {
      _orders = [];
      json['orders'].forEach((v) {
        _orders?.add(Reports.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  Data? _data;
  List<Reports>? _orders;
GetReportsModel copyWith({  bool? error,
  String? message,
  Data? data,
  List<Reports>? orders,
}) => GetReportsModel(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
  orders: orders ?? _orders,
);
  bool? get error => _error;
  String? get message => _message;
  Data? get data => _data;
  List<Reports>? get orders => _orders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    if (_orders != null) {
      map['orders'] = _orders?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// order_id : "3"
/// user_id : "1"
/// total : "400"
/// items : ""
/// payment_mode : "COD"
/// address : "151,Ward 35, Ratna Lok Colony, Indore, Madhya Pradesh 452010, India, 55, Indore, Madhya Pradesh, "
/// date : "2024-02-02"
/// datea : "2024-02-02"
/// txn_id : ""
/// p_status : ""
/// p_date : ""
/// order_status : "6"
/// mobile_no : ""
/// vendor_id : "1"
/// subtotal : ""
/// vendor_payment_admin : ""
/// gst_charge : ""
/// user_gst : ""
/// distance : ""
/// assign_id : "3"
/// online_status : "0"
/// otp : "0"
/// username : ""
/// address_id : "1"
/// user_pay_gst : ""
/// time : "From 18:30 To 21:40"
/// order_type : "Urgent"
/// lat : "22.7469348"
/// lang : "75.8980157"
/// state : "15"
/// city : "120"
/// region : "6"
/// orders_type : "One Way"
/// product_type : "2"
/// vehicle_type : "1"
/// payment_status : "0"
/// accept_reject_vendor : "1"
/// cart_id : "0"
/// delivery_charge : "0"
/// sub_total : "0"
/// discount : "0"
/// promo_code : ""
/// vehicle_types : "0"
/// pick_region : "6"
/// drop_region : "6"
/// order_image : null
/// pickup_name : ""
/// pickup_mobile : ""
/// product_description : ""
/// note : ""

class Reports {
  Reports({
      String? orderId, 
      String? userId, 
      String? total, 
      String? items, 
      String? paymentMode, 
      String? address, 
      String? date, 
      String? datea, 
      String? txnId, 
      String? pStatus, 
      String? pDate, 
      String? orderStatus, 
      String? mobileNo, 
      String? vendorId, 
      String? subtotal, 
      String? vendorPaymentAdmin, 
      String? gstCharge, 
      String? userGst, 
      String? distance, 
      String? assignId, 
      String? onlineStatus, 
      String? otp, 
      String? username, 
      String? addressId, 
      String? userPayGst, 
      String? time, 
      String? orderType, 
      String? lat, 
      String? lang, 
      String? state, 
      String? city, 
      String? region, 
      String? ordersType, 
      String? productType, 
      String? vehicleType, 
      String? paymentStatus, 
      String? acceptRejectVendor, 
      String? cartId, 
      String? deliveryCharge, 
      String? subTotal, 
      String? discount, 
      String? promoCode, 
      String? vehicleTypes, 
      String? pickRegion, 
      String? dropRegion, 
      dynamic orderImage, 
      String? pickupName, 
      String? pickupMobile, 
      String? productDescription, 
      String? note,}){
    _orderId = orderId;
    _userId = userId;
    _total = total;
    _items = items;
    _paymentMode = paymentMode;
    _address = address;
    _date = date;
    _datea = datea;
    _txnId = txnId;
    _pStatus = pStatus;
    _pDate = pDate;
    _orderStatus = orderStatus;
    _mobileNo = mobileNo;
    _vendorId = vendorId;
    _subtotal = subtotal;
    _vendorPaymentAdmin = vendorPaymentAdmin;
    _gstCharge = gstCharge;
    _userGst = userGst;
    _distance = distance;
    _assignId = assignId;
    _onlineStatus = onlineStatus;
    _otp = otp;
    _username = username;
    _addressId = addressId;
    _userPayGst = userPayGst;
    _time = time;
    _orderType = orderType;
    _lat = lat;
    _lang = lang;
    _state = state;
    _city = city;
    _region = region;
    _ordersType = ordersType;
    _productType = productType;
    _vehicleType = vehicleType;
    _paymentStatus = paymentStatus;
    _acceptRejectVendor = acceptRejectVendor;
    _cartId = cartId;
    _deliveryCharge = deliveryCharge;
    _subTotal = subTotal;
    _discount = discount;
    _promoCode = promoCode;
    _vehicleTypes = vehicleTypes;
    _pickRegion = pickRegion;
    _dropRegion = dropRegion;
    _orderImage = orderImage;
    _pickupName = pickupName;
    _pickupMobile = pickupMobile;
    _productDescription = productDescription;
    _note = note;
}

  Reports.fromJson(dynamic json) {
    _orderId = json['order_id'];
    _userId = json['user_id'];
    _total = json['total'];
    _items = json['items'];
    _paymentMode = json['payment_mode'];
    _address = json['address'];
    _date = json['date'];
    _datea = json['datea'];
    _txnId = json['txn_id'];
    _pStatus = json['p_status'];
    _pDate = json['p_date'];
    _orderStatus = json['order_status'];
    _mobileNo = json['mobile_no'];
    _vendorId = json['vendor_id'];
    _subtotal = json['subtotal'];
    _vendorPaymentAdmin = json['vendor_payment_admin'];
    _gstCharge = json['gst_charge'];
    _userGst = json['user_gst'];
    _distance = json['distance'];
    _assignId = json['assign_id'];
    _onlineStatus = json['online_status'];
    _otp = json['otp'];
    _username = json['username'];
    _addressId = json['address_id'];
    _userPayGst = json['user_pay_gst'];
    _time = json['time'];
    _orderType = json['order_type'];
    _lat = json['lat'];
    _lang = json['lang'];
    _state = json['state'];
    _city = json['city'];
    _region = json['region'];
    _ordersType = json['orders_type'];
    _productType = json['product_type'];
    _vehicleType = json['vehicle_type'];
    _paymentStatus = json['payment_status'];
    _acceptRejectVendor = json['accept_reject_vendor'];
    _cartId = json['cart_id'];
    _deliveryCharge = json['delivery_charge'];
    _subTotal = json['sub_total'];
    _discount = json['discount'];
    _promoCode = json['promo_code'];
    _vehicleTypes = json['vehicle_types'];
    _pickRegion = json['pick_region'];
    _dropRegion = json['drop_region'];
    _orderImage = json['order_image'];
    _pickupName = json['pickup_name'];
    _pickupMobile = json['pickup_mobile'];
    _productDescription = json['product_description'];
    _note = json['note'];
  }
  String? _orderId;
  String? _userId;
  String? _total;
  String? _items;
  String? _paymentMode;
  String? _address;
  String? _date;
  String? _datea;
  String? _txnId;
  String? _pStatus;
  String? _pDate;
  String? _orderStatus;
  String? _mobileNo;
  String? _vendorId;
  String? _subtotal;
  String? _vendorPaymentAdmin;
  String? _gstCharge;
  String? _userGst;
  String? _distance;
  String? _assignId;
  String? _onlineStatus;
  String? _otp;
  String? _username;
  String? _addressId;
  String? _userPayGst;
  String? _time;
  String? _orderType;
  String? _lat;
  String? _lang;
  String? _state;
  String? _city;
  String? _region;
  String? _ordersType;
  String? _productType;
  String? _vehicleType;
  String? _paymentStatus;
  String? _acceptRejectVendor;
  String? _cartId;
  String? _deliveryCharge;
  String? _subTotal;
  String? _discount;
  String? _promoCode;
  String? _vehicleTypes;
  String? _pickRegion;
  String? _dropRegion;
  dynamic _orderImage;
  String? _pickupName;
  String? _pickupMobile;
  String? _productDescription;
  String? _note;
  Reports copyWith({  String? orderId,
  String? userId,
  String? total,
  String? items,
  String? paymentMode,
  String? address,
  String? date,
  String? datea,
  String? txnId,
  String? pStatus,
  String? pDate,
  String? orderStatus,
  String? mobileNo,
  String? vendorId,
  String? subtotal,
  String? vendorPaymentAdmin,
  String? gstCharge,
  String? userGst,
  String? distance,
  String? assignId,
  String? onlineStatus,
  String? otp,
  String? username,
  String? addressId,
  String? userPayGst,
  String? time,
  String? orderType,
  String? lat,
  String? lang,
  String? state,
  String? city,
  String? region,
  String? ordersType,
  String? productType,
  String? vehicleType,
  String? paymentStatus,
  String? acceptRejectVendor,
  String? cartId,
  String? deliveryCharge,
  String? subTotal,
  String? discount,
  String? promoCode,
  String? vehicleTypes,
  String? pickRegion,
  String? dropRegion,
  dynamic orderImage,
  String? pickupName,
  String? pickupMobile,
  String? productDescription,
  String? note,
}) => Reports(  orderId: orderId ?? _orderId,
  userId: userId ?? _userId,
  total: total ?? _total,
  items: items ?? _items,
  paymentMode: paymentMode ?? _paymentMode,
  address: address ?? _address,
  date: date ?? _date,
  datea: datea ?? _datea,
  txnId: txnId ?? _txnId,
  pStatus: pStatus ?? _pStatus,
  pDate: pDate ?? _pDate,
  orderStatus: orderStatus ?? _orderStatus,
  mobileNo: mobileNo ?? _mobileNo,
  vendorId: vendorId ?? _vendorId,
  subtotal: subtotal ?? _subtotal,
  vendorPaymentAdmin: vendorPaymentAdmin ?? _vendorPaymentAdmin,
  gstCharge: gstCharge ?? _gstCharge,
  userGst: userGst ?? _userGst,
  distance: distance ?? _distance,
  assignId: assignId ?? _assignId,
  onlineStatus: onlineStatus ?? _onlineStatus,
  otp: otp ?? _otp,
  username: username ?? _username,
  addressId: addressId ?? _addressId,
  userPayGst: userPayGst ?? _userPayGst,
  time: time ?? _time,
  orderType: orderType ?? _orderType,
  lat: lat ?? _lat,
  lang: lang ?? _lang,
  state: state ?? _state,
  city: city ?? _city,
  region: region ?? _region,
  ordersType: ordersType ?? _ordersType,
  productType: productType ?? _productType,
  vehicleType: vehicleType ?? _vehicleType,
  paymentStatus: paymentStatus ?? _paymentStatus,
  acceptRejectVendor: acceptRejectVendor ?? _acceptRejectVendor,
  cartId: cartId ?? _cartId,
  deliveryCharge: deliveryCharge ?? _deliveryCharge,
  subTotal: subTotal ?? _subTotal,
  discount: discount ?? _discount,
  promoCode: promoCode ?? _promoCode,
  vehicleTypes: vehicleTypes ?? _vehicleTypes,
  pickRegion: pickRegion ?? _pickRegion,
  dropRegion: dropRegion ?? _dropRegion,
  orderImage: orderImage ?? _orderImage,
  pickupName: pickupName ?? _pickupName,
  pickupMobile: pickupMobile ?? _pickupMobile,
  productDescription: productDescription ?? _productDescription,
  note: note ?? _note,
);
  String? get orderId => _orderId;
  String? get userId => _userId;
  String? get total => _total;
  String? get items => _items;
  String? get paymentMode => _paymentMode;
  String? get address => _address;
  String? get date => _date;
  String? get datea => _datea;
  String? get txnId => _txnId;
  String? get pStatus => _pStatus;
  String? get pDate => _pDate;
  String? get orderStatus => _orderStatus;
  String? get mobileNo => _mobileNo;
  String? get vendorId => _vendorId;
  String? get subtotal => _subtotal;
  String? get vendorPaymentAdmin => _vendorPaymentAdmin;
  String? get gstCharge => _gstCharge;
  String? get userGst => _userGst;
  String? get distance => _distance;
  String? get assignId => _assignId;
  String? get onlineStatus => _onlineStatus;
  String? get otp => _otp;
  String? get username => _username;
  String? get addressId => _addressId;
  String? get userPayGst => _userPayGst;
  String? get time => _time;
  String? get orderType => _orderType;
  String? get lat => _lat;
  String? get lang => _lang;
  String? get state => _state;
  String? get city => _city;
  String? get region => _region;
  String? get ordersType => _ordersType;
  String? get productType => _productType;
  String? get vehicleType => _vehicleType;
  String? get paymentStatus => _paymentStatus;
  String? get acceptRejectVendor => _acceptRejectVendor;
  String? get cartId => _cartId;
  String? get deliveryCharge => _deliveryCharge;
  String? get subTotal => _subTotal;
  String? get discount => _discount;
  String? get promoCode => _promoCode;
  String? get vehicleTypes => _vehicleTypes;
  String? get pickRegion => _pickRegion;
  String? get dropRegion => _dropRegion;
  dynamic get orderImage => _orderImage;
  String? get pickupName => _pickupName;
  String? get pickupMobile => _pickupMobile;
  String? get productDescription => _productDescription;
  String? get note => _note;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_id'] = _orderId;
    map['user_id'] = _userId;
    map['total'] = _total;
    map['items'] = _items;
    map['payment_mode'] = _paymentMode;
    map['address'] = _address;
    map['date'] = _date;
    map['datea'] = _datea;
    map['txn_id'] = _txnId;
    map['p_status'] = _pStatus;
    map['p_date'] = _pDate;
    map['order_status'] = _orderStatus;
    map['mobile_no'] = _mobileNo;
    map['vendor_id'] = _vendorId;
    map['subtotal'] = _subtotal;
    map['vendor_payment_admin'] = _vendorPaymentAdmin;
    map['gst_charge'] = _gstCharge;
    map['user_gst'] = _userGst;
    map['distance'] = _distance;
    map['assign_id'] = _assignId;
    map['online_status'] = _onlineStatus;
    map['otp'] = _otp;
    map['username'] = _username;
    map['address_id'] = _addressId;
    map['user_pay_gst'] = _userPayGst;
    map['time'] = _time;
    map['order_type'] = _orderType;
    map['lat'] = _lat;
    map['lang'] = _lang;
    map['state'] = _state;
    map['city'] = _city;
    map['region'] = _region;
    map['orders_type'] = _ordersType;
    map['product_type'] = _productType;
    map['vehicle_type'] = _vehicleType;
    map['payment_status'] = _paymentStatus;
    map['accept_reject_vendor'] = _acceptRejectVendor;
    map['cart_id'] = _cartId;
    map['delivery_charge'] = _deliveryCharge;
    map['sub_total'] = _subTotal;
    map['discount'] = _discount;
    map['promo_code'] = _promoCode;
    map['vehicle_types'] = _vehicleTypes;
    map['pick_region'] = _pickRegion;
    map['drop_region'] = _dropRegion;
    map['order_image'] = _orderImage;
    map['pickup_name'] = _pickupName;
    map['pickup_mobile'] = _pickupMobile;
    map['product_description'] = _productDescription;
    map['note'] = _note;
    return map;
  }

}

/// total_cod_orders : "400"
/// total_online_orders : "0"
/// total_orders : "1"
/// total_earning : "0"
/// total_incentive : "0"
/// settlement_amount : "400"

class Data {
  Data({
      String? totalCodOrders, 
      String? totalOnlineOrders, 
      String? totalOrders, 
      String? totalEarning, 
      String? totalIncentive, 
      String? settlementAmount,}){
    _totalCodOrders = totalCodOrders;
    _totalOnlineOrders = totalOnlineOrders;
    _totalOrders = totalOrders;
    _totalEarning = totalEarning;
    _totalIncentive = totalIncentive;
    _settlementAmount = settlementAmount;
}

  Data.fromJson(dynamic json) {
    _totalCodOrders = json['total_cod_orders'];
    _totalOnlineOrders = json['total_online_orders'];
    _totalOrders = json['total_orders'];
    _totalEarning = json['total_earning'];
    _totalIncentive = json['total_incentive'];
    _settlementAmount = json['settlement_amount'];
  }
  String? _totalCodOrders;
  String? _totalOnlineOrders;
  String? _totalOrders;
  String? _totalEarning;
  String? _totalIncentive;
  String? _settlementAmount;
Data copyWith({  String? totalCodOrders,
  String? totalOnlineOrders,
  String? totalOrders,
  String? totalEarning,
  String? totalIncentive,
  String? settlementAmount,
}) => Data(  totalCodOrders: totalCodOrders ?? _totalCodOrders,
  totalOnlineOrders: totalOnlineOrders ?? _totalOnlineOrders,
  totalOrders: totalOrders ?? _totalOrders,
  totalEarning: totalEarning ?? _totalEarning,
  totalIncentive: totalIncentive ?? _totalIncentive,
  settlementAmount: settlementAmount ?? _settlementAmount,
);
  String? get totalCodOrders => _totalCodOrders;
  String? get totalOnlineOrders => _totalOnlineOrders;
  String? get totalOrders => _totalOrders;
  String? get totalEarning => _totalEarning;
  String? get totalIncentive => _totalIncentive;
  String? get settlementAmount => _settlementAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_cod_orders'] = _totalCodOrders;
    map['total_online_orders'] = _totalOnlineOrders;
    map['total_orders'] = _totalOrders;
    map['total_earning'] = _totalEarning;
    map['total_incentive'] = _totalIncentive;
    map['settlement_amount'] = _settlementAmount;
    return map;
  }

}