/// error : false
/// msg : "Data get Successfully"
/// data : [{"id":"31","name":"Rohit","email":"rohit@gmiail.com","mobile":"798797987979","type":"1","city":"indore","state":"mp","password":"25d55ad283aa400af464c76d713c07ad","is_verified":"1","rc_card":null,"licence":"https://developmentalphawizz.com/hojayega/uploads/profile_pics/655db91ed5636.png","status":"1","otp":"3903","fcm_id":"fasdf","latitude":"22.7549629","longitude":"75.8622462","created_at":"2023-11-25 09:17:27","updated_at":"2023-11-22 13:47:34","address":"indore","pro_pic":"655db91ed5c1d.png","accessories":"1","dob":"2011-11-22","vehicle_number":"mp09Wu48778","region":"indore","pincode":"452015","electricity_bill":"https://developmentalphawizz.com/hojayega/uploads/profile_pics/655db91ed5da8.png","policy_verification":"https://developmentalphawizz.com/hojayega/uploads/profile_pics/655db91ed5f40.png","adhar_car_front":"https://developmentalphawizz.com/hojayega/uploads/profile_pics/655db91ed61c4.png","adhar_car_back":"https://developmentalphawizz.com/hojayega/uploads/profile_pics/655db91ed6353.png","wallet":"48","cash_received":"0","qr_code":"","bank_name":"","account_number":"","ifsc_code":"","upi_id":"","profile_pic":"https://developmentalphawizz.com/hojayega/uploads/profile_pics/655db91ed5c1d.png"}]

class GetProfileModel {
  GetProfileModel({
      bool? error, 
      String? msg, 
      List<ProfileData>? data,}){
    _error = error;
    _msg = msg;
    _data = data;
}

  GetProfileModel.fromJson(dynamic json) {
    _error = json['error'];
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ProfileData.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _msg;
  List<ProfileData>? _data;
GetProfileModel copyWith({  bool? error,
  String? msg,
  List<ProfileData>? data,
}) => GetProfileModel(  error: error ?? _error,
  msg: msg ?? _msg,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get msg => _msg;
  List<ProfileData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "31"
/// name : "Rohit"
/// email : "rohit@gmiail.com"
/// mobile : "798797987979"
/// type : "1"
/// city : "indore"
/// state : "mp"
/// password : "25d55ad283aa400af464c76d713c07ad"
/// is_verified : "1"
/// rc_card : null
/// licence : "https://developmentalphawizz.com/hojayega/uploads/profile_pics/655db91ed5636.png"
/// status : "1"
/// otp : "3903"
/// fcm_id : "fasdf"
/// latitude : "22.7549629"
/// longitude : "75.8622462"
/// created_at : "2023-11-25 09:17:27"
/// updated_at : "2023-11-22 13:47:34"
/// address : "indore"
/// pro_pic : "655db91ed5c1d.png"
/// accessories : "1"
/// dob : "2011-11-22"
/// vehicle_number : "mp09Wu48778"
/// region : "indore"
/// pincode : "452015"
/// electricity_bill : "https://developmentalphawizz.com/hojayega/uploads/profile_pics/655db91ed5da8.png"
/// policy_verification : "https://developmentalphawizz.com/hojayega/uploads/profile_pics/655db91ed5f40.png"
/// adhar_car_front : "https://developmentalphawizz.com/hojayega/uploads/profile_pics/655db91ed61c4.png"
/// adhar_car_back : "https://developmentalphawizz.com/hojayega/uploads/profile_pics/655db91ed6353.png"
/// wallet : "48"
/// cash_received : "0"
/// qr_code : ""
/// bank_name : ""
/// account_number : ""
/// ifsc_code : ""
/// upi_id : ""
/// profile_pic : "https://developmentalphawizz.com/hojayega/uploads/profile_pics/655db91ed5c1d.png"

class ProfileData {
  ProfileData({
      String? id, 
      String? name, 
      String? email, 
      String? mobile, 
      String? type, 
      String? city, 
      String? state, 
      String? password, 
      String? isVerified, 
      dynamic rcCard, 
      String? licence, 
      String? status, 
      String? otp, 
      String? fcmId, 
      String? latitude, 
      String? longitude, 
      String? createdAt, 
      String? updatedAt, 
      String? address, 
      String? proPic, 
      String? accessories, 
      String? dob, 
      String? vehicleNumber, 
      String? region, 
      String? pincode, 
      String? electricityBill, 
      String? policyVerification, 
      String? adharCarFront, 
      String? adharCarBack, 
      String? wallet, 
      String? cashReceived, 
      String? qrCode, 
      String? bankName, 
      String? accountNumber, 
      String? ifscCode, 
      String? upiId, 
      String? profilePic,}){
    _id = id;
    _name = name;
    _email = email;
    _mobile = mobile;
    _type = type;
    _city = city;
    _state = state;
    _password = password;
    _isVerified = isVerified;
    _rcCard = rcCard;
    _licence = licence;
    _status = status;
    _otp = otp;
    _fcmId = fcmId;
    _latitude = latitude;
    _longitude = longitude;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _address = address;
    _proPic = proPic;
    _accessories = accessories;
    _dob = dob;
    _vehicleNumber = vehicleNumber;
    _region = region;
    _pincode = pincode;
    _electricityBill = electricityBill;
    _policyVerification = policyVerification;
    _adharCarFront = adharCarFront;
    _adharCarBack = adharCarBack;
    _wallet = wallet;
    _cashReceived = cashReceived;
    _qrCode = qrCode;
    _bankName = bankName;
    _accountNumber = accountNumber;
    _ifscCode = ifscCode;
    _upiId = upiId;
    _profilePic = profilePic;
}

  ProfileData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _mobile = json['mobile'];
    _type = json['type'];
    _city = json['city'];
    _state = json['state'];
    _password = json['password'];
    _isVerified = json['is_verified'];
    _rcCard = json['rc_card'];
    _licence = json['licence'];
    _status = json['status'];
    _otp = json['otp'];
    _fcmId = json['fcm_id'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _address = json['address'];
    _proPic = json['pro_pic'];
    _accessories = json['accessories'];
    _dob = json['dob'];
    _vehicleNumber = json['vehicle_number'];
    _region = json['region'];
    _pincode = json['pincode'];
    _electricityBill = json['electricity_bill'];
    _policyVerification = json['policy_verification'];
    _adharCarFront = json['adhar_car_front'];
    _adharCarBack = json['adhar_car_back'];
    _wallet = json['wallet'];
    _cashReceived = json['cash_received'];
    _qrCode = json['qr_code'];
    _bankName = json['bank_name'];
    _accountNumber = json['account_number'];
    _ifscCode = json['ifsc_code'];
    _upiId = json['upi_id'];
    _profilePic = json['profile_pic'];
  }
  String? _id;
  String? _name;
  String? _email;
  String? _mobile;
  String? _type;
  String? _city;
  String? _state;
  String? _password;
  String? _isVerified;
  dynamic _rcCard;
  String? _licence;
  String? _status;
  String? _otp;
  String? _fcmId;
  String? _latitude;
  String? _longitude;
  String? _createdAt;
  String? _updatedAt;
  String? _address;
  String? _proPic;
  String? _accessories;
  String? _dob;
  String? _vehicleNumber;
  String? _region;
  String? _pincode;
  String? _electricityBill;
  String? _policyVerification;
  String? _adharCarFront;
  String? _adharCarBack;
  String? _wallet;
  String? _cashReceived;
  String? _qrCode;
  String? _bankName;
  String? _accountNumber;
  String? _ifscCode;
  String? _upiId;
  String? _profilePic;
  ProfileData copyWith({  String? id,
  String? name,
  String? email,
  String? mobile,
  String? type,
  String? city,
  String? state,
  String? password,
  String? isVerified,
  dynamic rcCard,
  String? licence,
  String? status,
  String? otp,
  String? fcmId,
  String? latitude,
  String? longitude,
  String? createdAt,
  String? updatedAt,
  String? address,
  String? proPic,
  String? accessories,
  String? dob,
  String? vehicleNumber,
  String? region,
  String? pincode,
  String? electricityBill,
  String? policyVerification,
  String? adharCarFront,
  String? adharCarBack,
  String? wallet,
  String? cashReceived,
  String? qrCode,
  String? bankName,
  String? accountNumber,
  String? ifscCode,
  String? upiId,
  String? profilePic,
}) => ProfileData(  id: id ?? _id,
  name: name ?? _name,
  email: email ?? _email,
  mobile: mobile ?? _mobile,
  type: type ?? _type,
  city: city ?? _city,
  state: state ?? _state,
  password: password ?? _password,
  isVerified: isVerified ?? _isVerified,
  rcCard: rcCard ?? _rcCard,
  licence: licence ?? _licence,
  status: status ?? _status,
  otp: otp ?? _otp,
  fcmId: fcmId ?? _fcmId,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  address: address ?? _address,
  proPic: proPic ?? _proPic,
  accessories: accessories ?? _accessories,
  dob: dob ?? _dob,
  vehicleNumber: vehicleNumber ?? _vehicleNumber,
  region: region ?? _region,
  pincode: pincode ?? _pincode,
  electricityBill: electricityBill ?? _electricityBill,
  policyVerification: policyVerification ?? _policyVerification,
  adharCarFront: adharCarFront ?? _adharCarFront,
  adharCarBack: adharCarBack ?? _adharCarBack,
  wallet: wallet ?? _wallet,
  cashReceived: cashReceived ?? _cashReceived,
  qrCode: qrCode ?? _qrCode,
  bankName: bankName ?? _bankName,
  accountNumber: accountNumber ?? _accountNumber,
  ifscCode: ifscCode ?? _ifscCode,
  upiId: upiId ?? _upiId,
  profilePic: profilePic ?? _profilePic,
);
  String? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get mobile => _mobile;
  String? get type => _type;
  String? get city => _city;
  String? get state => _state;
  String? get password => _password;
  String? get isVerified => _isVerified;
  dynamic get rcCard => _rcCard;
  String? get licence => _licence;
  String? get status => _status;
  String? get otp => _otp;
  String? get fcmId => _fcmId;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get address => _address;
  String? get proPic => _proPic;
  String? get accessories => _accessories;
  String? get dob => _dob;
  String? get vehicleNumber => _vehicleNumber;
  String? get region => _region;
  String? get pincode => _pincode;
  String? get electricityBill => _electricityBill;
  String? get policyVerification => _policyVerification;
  String? get adharCarFront => _adharCarFront;
  String? get adharCarBack => _adharCarBack;
  String? get wallet => _wallet;
  String? get cashReceived => _cashReceived;
  String? get qrCode => _qrCode;
  String? get bankName => _bankName;
  String? get accountNumber => _accountNumber;
  String? get ifscCode => _ifscCode;
  String? get upiId => _upiId;
  String? get profilePic => _profilePic;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['type'] = _type;
    map['city'] = _city;
    map['state'] = _state;
    map['password'] = _password;
    map['is_verified'] = _isVerified;
    map['rc_card'] = _rcCard;
    map['licence'] = _licence;
    map['status'] = _status;
    map['otp'] = _otp;
    map['fcm_id'] = _fcmId;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['address'] = _address;
    map['pro_pic'] = _proPic;
    map['accessories'] = _accessories;
    map['dob'] = _dob;
    map['vehicle_number'] = _vehicleNumber;
    map['region'] = _region;
    map['pincode'] = _pincode;
    map['electricity_bill'] = _electricityBill;
    map['policy_verification'] = _policyVerification;
    map['adhar_car_front'] = _adharCarFront;
    map['adhar_car_back'] = _adharCarBack;
    map['wallet'] = _wallet;
    map['cash_received'] = _cashReceived;
    map['qr_code'] = _qrCode;
    map['bank_name'] = _bankName;
    map['account_number'] = _accountNumber;
    map['ifsc_code'] = _ifscCode;
    map['upi_id'] = _upiId;
    map['profile_pic'] = _profilePic;
    return map;
  }
}