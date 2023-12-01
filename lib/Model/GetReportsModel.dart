/// error : false
/// message : "Get Orders List"
/// data : {"total_orders":"2","total_sum":"33","total_hours":"100","total_cod":"100","total_cancel":"100","total_incentive":"100","settlement_amount":"100"}

class GetReportsModel {
  GetReportsModel({
      bool? error, 
      String? message,
    ReportsData? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  GetReportsModel.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _data = json['data'] != null ? ReportsData.fromJson(json['data']) : null;
  }
  bool? _error;
  String? _message;
  ReportsData? _data;
GetReportsModel copyWith({  bool? error,
  String? message,
  ReportsData? data,
}) => GetReportsModel(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  ReportsData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// total_orders : "2"
/// total_sum : "33"
/// total_hours : "100"
/// total_cod : "100"
/// total_cancel : "100"
/// total_incentive : "100"
/// settlement_amount : "100"

class ReportsData {
  ReportsData({
      String? totalOrders, 
      String? totalSum, 
      String? totalHours, 
      String? totalCod, 
      String? totalCancel, 
      String? totalIncentive, 
      String? settlementAmount,}){
    _totalOrders = totalOrders;
    _totalSum = totalSum;
    _totalHours = totalHours;
    _totalCod = totalCod;
    _totalCancel = totalCancel;
    _totalIncentive = totalIncentive;
    _settlementAmount = settlementAmount;
}

  ReportsData.fromJson(dynamic json) {
    _totalOrders = json['total_orders'];
    _totalSum = json['total_sum'];
    _totalHours = json['total_hours'];
    _totalCod = json['total_cod'];
    _totalCancel = json['total_cancel'];
    _totalIncentive = json['total_incentive'];
    _settlementAmount = json['settlement_amount'];
  }
  String? _totalOrders;
  String? _totalSum;
  String? _totalHours;
  String? _totalCod;
  String? _totalCancel;
  String? _totalIncentive;
  String? _settlementAmount;
  ReportsData copyWith({  String? totalOrders,
  String? totalSum,
  String? totalHours,
  String? totalCod,
  String? totalCancel,
  String? totalIncentive,
  String? settlementAmount,
}) => ReportsData(  totalOrders: totalOrders ?? _totalOrders,
  totalSum: totalSum ?? _totalSum,
  totalHours: totalHours ?? _totalHours,
  totalCod: totalCod ?? _totalCod,
  totalCancel: totalCancel ?? _totalCancel,
  totalIncentive: totalIncentive ?? _totalIncentive,
  settlementAmount: settlementAmount ?? _settlementAmount,
);
  String? get totalOrders => _totalOrders;
  String? get totalSum => _totalSum;
  String? get totalHours => _totalHours;
  String? get totalCod => _totalCod;
  String? get totalCancel => _totalCancel;
  String? get totalIncentive => _totalIncentive;
  String? get settlementAmount => _settlementAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_orders'] = _totalOrders;
    map['total_sum'] = _totalSum;
    map['total_hours'] = _totalHours;
    map['total_cod'] = _totalCod;
    map['total_cancel'] = _totalCancel;
    map['total_incentive'] = _totalIncentive;
    map['settlement_amount'] = _settlementAmount;
    return map;
  }

}