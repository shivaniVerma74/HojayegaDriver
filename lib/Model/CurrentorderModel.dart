/// error : false
/// message : "Get Orders List"
/// data : [{"id":"1","pickup_location":"Pawar Villa, N-430, Singapore Green View, Risi Nagar, Talawali Chanda, Indore, Madhya Pradesh 452007, India","pickup_address":"89898998asdf","latitude":"22.7195796","longitude":"75.8577274","pickup_name":"Rohit","pickup_number":"878978989789","pick_zone":"Tearasdfsdfas","time_slot":"16:3718:37","vehicle_type":"2","product_type":"1","product_description":"testsdfasfas","note":"adfasdfasdf","reciever_id":"3","created_at":"2023-11-18 18:48:33","user_id":"1","image":"655db91ed5636.png","amount":"","payment_type":"","from_time":"","to_time":"","driver_id":"31","status":"1","total_km":"","username":"Abhay singh","email":"abhaysingh@gmail.com","f_name":"","l_name":"","countrycode":"","mobile":"8878505050","profession":"","exp_job_title":"","exp_employer":"","exp_country":"","exp_start_date":"","exp_end_date":"","exp_current_work":"","exp_description":"","edu_school_name":"","edu_degree":"","edu_field":"","edu_start_date":"","edu_end_date":"","edu_percentage":"","edu_current_study":"","skills_des":"","summary_des":"","accomplishments_des":"","finalize_des":"","password":"","profile_pic":"6558b9a9118ce.jpg","facebook_id":"","type":"","isGold":"0","address":"","city":"Indore","state":"Madhya Pradesh","country":"","device_token":"","agreecheck":"0","otp":null,"wallet":"0.00","oauth_provider":null,"oauth_uid":null,"last_login":null,"updated_at":"2023-11-22 18:30:43","refferal_code":"","friend_code":"","parcel_id":"7","drop_history":[{"id":"3","parcel_order_id":"7","drop_location":"Rotal Plati","drop_name":"tes","drop_number":"78788","drop_address":"8887878998","drop_zone":"Tearasdfsdf","creat_date":"2023-11-23 11:03:38","user_id":"1","km":"7.3 km","delivery_charge":"0","drop_latitude":"","drop_longitude":""}]},{"id":"1","pickup_location":"Pawar Villa, N-430, Singapore Green View, Risi Nagar, Talawali Chanda, Indore, Madhya Pradesh 452007, India","pickup_address":"8998","latitude":"22.7195796","longitude":"75.8577274","pickup_name":"asdfasdfsda","pickup_number":"7898989","pick_zone":"teaafdasfadsf","time_slot":"yes","vehicle_type":"2","product_type":"1","product_description":"tesatasdfasd","note":"afdasdfasdfasdf","reciever_id":"10,11","created_at":"2023-11-18 18:48:33","user_id":"1","image":"656083676f5d9.JPG","amount":"60","payment_type":"CASH","from_time":"16:37","to_time":"18:37","driver_id":"31","status":"1","total_km":"16","username":"Abhay singh","email":"abhaysingh@gmail.com","f_name":"","l_name":"","countrycode":"","mobile":"8878505050","profession":"","exp_job_title":"","exp_employer":"","exp_country":"","exp_start_date":"","exp_end_date":"","exp_current_work":"","exp_description":"","edu_school_name":"","edu_degree":"","edu_field":"","edu_start_date":"","edu_end_date":"","edu_percentage":"","edu_current_study":"","skills_des":"","summary_des":"","accomplishments_des":"","finalize_des":"","password":"","profile_pic":"6558b9a9118ce.jpg","facebook_id":"","type":"","isGold":"0","address":"","city":"Indore","state":"Madhya Pradesh","country":"","device_token":"","agreecheck":"0","otp":null,"wallet":"0.00","oauth_provider":null,"oauth_uid":null,"last_login":null,"updated_at":"2023-11-22 18:30:43","refferal_code":"","friend_code":"","parcel_id":"30","drop_history":[{"id":"10","parcel_order_id":"30","drop_location":"469, Khajrana, Indore, Madhya Pradesh 452016, India","drop_name":"raj","drop_number":"78788","drop_address":"8887878998","drop_zone":"Tearasdfsdf","creat_date":"2023-11-24 16:35:11","user_id":"1","km":"8.8 km","delivery_charge":"30","drop_latitude":"22.7613248","drop_longitude":"75.9082275"},{"id":"11","parcel_order_id":"30","drop_location":"QW6H+GMJ, Near DPS, Aashirwad Villas, Nipania, Indore, Madhya Pradesh 452010, India","drop_name":"Raj","drop_number":"78788","drop_address":"8887878998","drop_zone":"teaafdasfad","creat_date":"2023-11-24 16:35:12","user_id":"1","km":"8.8 km","delivery_charge":"30","drop_latitude":"22.7613248","drop_longitude":"75.9082275"}]}]

class CurrentorderModel {
  CurrentorderModel({
      bool? error, 
      String? message, 
      List<Data>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  CurrentorderModel.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<Data>? _data;
CurrentorderModel copyWith({  bool? error,
  String? message,
  List<Data>? data,
}) => CurrentorderModel(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "1"
/// pickup_location : "Pawar Villa, N-430, Singapore Green View, Risi Nagar, Talawali Chanda, Indore, Madhya Pradesh 452007, India"
/// pickup_address : "89898998asdf"
/// latitude : "22.7195796"
/// longitude : "75.8577274"
/// pickup_name : "Rohit"
/// pickup_number : "878978989789"
/// pick_zone : "Tearasdfsdfas"
/// time_slot : "16:3718:37"
/// vehicle_type : "2"
/// product_type : "1"
/// product_description : "testsdfasfas"
/// note : "adfasdfasdf"
/// reciever_id : "3"
/// created_at : "2023-11-18 18:48:33"
/// user_id : "1"
/// image : "655db91ed5636.png"
/// amount : ""
/// payment_type : ""
/// from_time : ""
/// to_time : ""
/// driver_id : "31"
/// status : "1"
/// total_km : ""
/// username : "Abhay singh"
/// email : "abhaysingh@gmail.com"
/// f_name : ""
/// l_name : ""
/// countrycode : ""
/// mobile : "8878505050"
/// profession : ""
/// exp_job_title : ""
/// exp_employer : ""
/// exp_country : ""
/// exp_start_date : ""
/// exp_end_date : ""
/// exp_current_work : ""
/// exp_description : ""
/// edu_school_name : ""
/// edu_degree : ""
/// edu_field : ""
/// edu_start_date : ""
/// edu_end_date : ""
/// edu_percentage : ""
/// edu_current_study : ""
/// skills_des : ""
/// summary_des : ""
/// accomplishments_des : ""
/// finalize_des : ""
/// password : ""
/// profile_pic : "6558b9a9118ce.jpg"
/// facebook_id : ""
/// type : ""
/// isGold : "0"
/// address : ""
/// city : "Indore"
/// state : "Madhya Pradesh"
/// country : ""
/// device_token : ""
/// agreecheck : "0"
/// otp : null
/// wallet : "0.00"
/// oauth_provider : null
/// oauth_uid : null
/// last_login : null
/// updated_at : "2023-11-22 18:30:43"
/// refferal_code : ""
/// friend_code : ""
/// parcel_id : "7"
/// drop_history : [{"id":"3","parcel_order_id":"7","drop_location":"Rotal Plati","drop_name":"tes","drop_number":"78788","drop_address":"8887878998","drop_zone":"Tearasdfsdf","creat_date":"2023-11-23 11:03:38","user_id":"1","km":"7.3 km","delivery_charge":"0","drop_latitude":"","drop_longitude":""}]

class Data {
  Data({
      String? id, 
      String? pickupLocation, 
      String? pickupAddress, 
      String? latitude, 
      String? longitude, 
      String? pickupName, 
      String? pickupNumber, 
      String? pickZone, 
      String? timeSlot, 
      String? vehicleType, 
      String? productType, 
      String? productDescription, 
      String? note, 
      String? recieverId, 
      String? createdAt, 
      String? userId, 
      String? image, 
      String? amount, 
      String? paymentType, 
      String? fromTime, 
      String? toTime, 
      String? driverId, 
      String? status, 
      String? totalKm, 
      String? username, 
      String? email, 
      String? fName, 
      String? lName, 
      String? countrycode, 
      String? mobile, 
      String? profession, 
      String? expJobTitle, 
      String? expEmployer, 
      String? expCountry, 
      String? expStartDate, 
      String? expEndDate, 
      String? expCurrentWork, 
      String? expDescription, 
      String? eduSchoolName, 
      String? eduDegree, 
      String? eduField, 
      String? eduStartDate, 
      String? eduEndDate, 
      String? eduPercentage, 
      String? eduCurrentStudy, 
      String? skillsDes, 
      String? summaryDes, 
      String? accomplishmentsDes, 
      String? finalizeDes, 
      String? password, 
      String? profilePic, 
      String? facebookId, 
      String? type, 
      String? isGold, 
      String? address, 
      String? city, 
      String? state, 
      String? country, 
      String? deviceToken, 
      String? agreecheck, 
      dynamic otp, 
      String? wallet, 
      dynamic oauthProvider, 
      dynamic oauthUid, 
      dynamic lastLogin, 
      String? updatedAt, 
      String? refferalCode, 
      String? friendCode, 
      String? parcelId, 
      List<DropHistory>? dropHistory,}){
    _id = id;
    _pickupLocation = pickupLocation;
    _pickupAddress = pickupAddress;
    _latitude = latitude;
    _longitude = longitude;
    _pickupName = pickupName;
    _pickupNumber = pickupNumber;
    _pickZone = pickZone;
    _timeSlot = timeSlot;
    _vehicleType = vehicleType;
    _productType = productType;
    _productDescription = productDescription;
    _note = note;
    _recieverId = recieverId;
    _createdAt = createdAt;
    _userId = userId;
    _image = image;
    _amount = amount;
    _paymentType = paymentType;
    _fromTime = fromTime;
    _toTime = toTime;
    _driverId = driverId;
    _status = status;
    _totalKm = totalKm;
    _username = username;
    _email = email;
    _fName = fName;
    _lName = lName;
    _countrycode = countrycode;
    _mobile = mobile;
    _profession = profession;
    _expJobTitle = expJobTitle;
    _expEmployer = expEmployer;
    _expCountry = expCountry;
    _expStartDate = expStartDate;
    _expEndDate = expEndDate;
    _expCurrentWork = expCurrentWork;
    _expDescription = expDescription;
    _eduSchoolName = eduSchoolName;
    _eduDegree = eduDegree;
    _eduField = eduField;
    _eduStartDate = eduStartDate;
    _eduEndDate = eduEndDate;
    _eduPercentage = eduPercentage;
    _eduCurrentStudy = eduCurrentStudy;
    _skillsDes = skillsDes;
    _summaryDes = summaryDes;
    _accomplishmentsDes = accomplishmentsDes;
    _finalizeDes = finalizeDes;
    _password = password;
    _profilePic = profilePic;
    _facebookId = facebookId;
    _type = type;
    _isGold = isGold;
    _address = address;
    _city = city;
    _state = state;
    _country = country;
    _deviceToken = deviceToken;
    _agreecheck = agreecheck;
    _otp = otp;
    _wallet = wallet;
    _oauthProvider = oauthProvider;
    _oauthUid = oauthUid;
    _lastLogin = lastLogin;
    _updatedAt = updatedAt;
    _refferalCode = refferalCode;
    _friendCode = friendCode;
    _parcelId = parcelId;
    _dropHistory = dropHistory;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _pickupLocation = json['pickup_location'];
    _pickupAddress = json['pickup_address'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _pickupName = json['pickup_name'];
    _pickupNumber = json['pickup_number'];
    _pickZone = json['pick_zone'];
    _timeSlot = json['time_slot'];
    _vehicleType = json['vehicle_type'];
    _productType = json['product_type'];
    _productDescription = json['product_description'];
    _note = json['note'];
    _recieverId = json['reciever_id'];
    _createdAt = json['created_at'];
    _userId = json['user_id'];
    _image = json['image'];
    _amount = json['amount'];
    _paymentType = json['payment_type'];
    _fromTime = json['from_time'];
    _toTime = json['to_time'];
    _driverId = json['driver_id'];
    _status = json['status'];
    _totalKm = json['total_km'];
    _username = json['username'];
    _email = json['email'];
    _fName = json['f_name'];
    _lName = json['l_name'];
    _countrycode = json['countrycode'];
    _mobile = json['mobile'];
    _profession = json['profession'];
    _expJobTitle = json['exp_job_title'];
    _expEmployer = json['exp_employer'];
    _expCountry = json['exp_country'];
    _expStartDate = json['exp_start_date'];
    _expEndDate = json['exp_end_date'];
    _expCurrentWork = json['exp_current_work'];
    _expDescription = json['exp_description'];
    _eduSchoolName = json['edu_school_name'];
    _eduDegree = json['edu_degree'];
    _eduField = json['edu_field'];
    _eduStartDate = json['edu_start_date'];
    _eduEndDate = json['edu_end_date'];
    _eduPercentage = json['edu_percentage'];
    _eduCurrentStudy = json['edu_current_study'];
    _skillsDes = json['skills_des'];
    _summaryDes = json['summary_des'];
    _accomplishmentsDes = json['accomplishments_des'];
    _finalizeDes = json['finalize_des'];
    _password = json['password'];
    _profilePic = json['profile_pic'];
    _facebookId = json['facebook_id'];
    _type = json['type'];
    _isGold = json['isGold'];
    _address = json['address'];
    _city = json['city'];
    _state = json['state'];
    _country = json['country'];
    _deviceToken = json['device_token'];
    _agreecheck = json['agreecheck'];
    _otp = json['otp'];
    _wallet = json['wallet'];
    _oauthProvider = json['oauth_provider'];
    _oauthUid = json['oauth_uid'];
    _lastLogin = json['last_login'];
    _updatedAt = json['updated_at'];
    _refferalCode = json['refferal_code'];
    _friendCode = json['friend_code'];
    _parcelId = json['parcel_id'];
    if (json['drop_history'] != null) {
      _dropHistory = [];
      json['drop_history'].forEach((v) {
        _dropHistory?.add(DropHistory.fromJson(v));
      });
    }
  }
  String? _id;
  String? _pickupLocation;
  String? _pickupAddress;
  String? _latitude;
  String? _longitude;
  String? _pickupName;
  String? _pickupNumber;
  String? _pickZone;
  String? _timeSlot;
  String? _vehicleType;
  String? _productType;
  String? _productDescription;
  String? _note;
  String? _recieverId;
  String? _createdAt;
  String? _userId;
  String? _image;
  String? _amount;
  String? _paymentType;
  String? _fromTime;
  String? _toTime;
  String? _driverId;
  String? _status;
  String? _totalKm;
  String? _username;
  String? _email;
  String? _fName;
  String? _lName;
  String? _countrycode;
  String? _mobile;
  String? _profession;
  String? _expJobTitle;
  String? _expEmployer;
  String? _expCountry;
  String? _expStartDate;
  String? _expEndDate;
  String? _expCurrentWork;
  String? _expDescription;
  String? _eduSchoolName;
  String? _eduDegree;
  String? _eduField;
  String? _eduStartDate;
  String? _eduEndDate;
  String? _eduPercentage;
  String? _eduCurrentStudy;
  String? _skillsDes;
  String? _summaryDes;
  String? _accomplishmentsDes;
  String? _finalizeDes;
  String? _password;
  String? _profilePic;
  String? _facebookId;
  String? _type;
  String? _isGold;
  String? _address;
  String? _city;
  String? _state;
  String? _country;
  String? _deviceToken;
  String? _agreecheck;
  dynamic _otp;
  String? _wallet;
  dynamic _oauthProvider;
  dynamic _oauthUid;
  dynamic _lastLogin;
  String? _updatedAt;
  String? _refferalCode;
  String? _friendCode;
  String? _parcelId;
  List<DropHistory>? _dropHistory;
Data copyWith({  String? id,
  String? pickupLocation,
  String? pickupAddress,
  String? latitude,
  String? longitude,
  String? pickupName,
  String? pickupNumber,
  String? pickZone,
  String? timeSlot,
  String? vehicleType,
  String? productType,
  String? productDescription,
  String? note,
  String? recieverId,
  String? createdAt,
  String? userId,
  String? image,
  String? amount,
  String? paymentType,
  String? fromTime,
  String? toTime,
  String? driverId,
  String? status,
  String? totalKm,
  String? username,
  String? email,
  String? fName,
  String? lName,
  String? countrycode,
  String? mobile,
  String? profession,
  String? expJobTitle,
  String? expEmployer,
  String? expCountry,
  String? expStartDate,
  String? expEndDate,
  String? expCurrentWork,
  String? expDescription,
  String? eduSchoolName,
  String? eduDegree,
  String? eduField,
  String? eduStartDate,
  String? eduEndDate,
  String? eduPercentage,
  String? eduCurrentStudy,
  String? skillsDes,
  String? summaryDes,
  String? accomplishmentsDes,
  String? finalizeDes,
  String? password,
  String? profilePic,
  String? facebookId,
  String? type,
  String? isGold,
  String? address,
  String? city,
  String? state,
  String? country,
  String? deviceToken,
  String? agreecheck,
  dynamic otp,
  String? wallet,
  dynamic oauthProvider,
  dynamic oauthUid,
  dynamic lastLogin,
  String? updatedAt,
  String? refferalCode,
  String? friendCode,
  String? parcelId,
  List<DropHistory>? dropHistory,
}) => Data(  id: id ?? _id,
  pickupLocation: pickupLocation ?? _pickupLocation,
  pickupAddress: pickupAddress ?? _pickupAddress,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  pickupName: pickupName ?? _pickupName,
  pickupNumber: pickupNumber ?? _pickupNumber,
  pickZone: pickZone ?? _pickZone,
  timeSlot: timeSlot ?? _timeSlot,
  vehicleType: vehicleType ?? _vehicleType,
  productType: productType ?? _productType,
  productDescription: productDescription ?? _productDescription,
  note: note ?? _note,
  recieverId: recieverId ?? _recieverId,
  createdAt: createdAt ?? _createdAt,
  userId: userId ?? _userId,
  image: image ?? _image,
  amount: amount ?? _amount,
  paymentType: paymentType ?? _paymentType,
  fromTime: fromTime ?? _fromTime,
  toTime: toTime ?? _toTime,
  driverId: driverId ?? _driverId,
  status: status ?? _status,
  totalKm: totalKm ?? _totalKm,
  username: username ?? _username,
  email: email ?? _email,
  fName: fName ?? _fName,
  lName: lName ?? _lName,
  countrycode: countrycode ?? _countrycode,
  mobile: mobile ?? _mobile,
  profession: profession ?? _profession,
  expJobTitle: expJobTitle ?? _expJobTitle,
  expEmployer: expEmployer ?? _expEmployer,
  expCountry: expCountry ?? _expCountry,
  expStartDate: expStartDate ?? _expStartDate,
  expEndDate: expEndDate ?? _expEndDate,
  expCurrentWork: expCurrentWork ?? _expCurrentWork,
  expDescription: expDescription ?? _expDescription,
  eduSchoolName: eduSchoolName ?? _eduSchoolName,
  eduDegree: eduDegree ?? _eduDegree,
  eduField: eduField ?? _eduField,
  eduStartDate: eduStartDate ?? _eduStartDate,
  eduEndDate: eduEndDate ?? _eduEndDate,
  eduPercentage: eduPercentage ?? _eduPercentage,
  eduCurrentStudy: eduCurrentStudy ?? _eduCurrentStudy,
  skillsDes: skillsDes ?? _skillsDes,
  summaryDes: summaryDes ?? _summaryDes,
  accomplishmentsDes: accomplishmentsDes ?? _accomplishmentsDes,
  finalizeDes: finalizeDes ?? _finalizeDes,
  password: password ?? _password,
  profilePic: profilePic ?? _profilePic,
  facebookId: facebookId ?? _facebookId,
  type: type ?? _type,
  isGold: isGold ?? _isGold,
  address: address ?? _address,
  city: city ?? _city,
  state: state ?? _state,
  country: country ?? _country,
  deviceToken: deviceToken ?? _deviceToken,
  agreecheck: agreecheck ?? _agreecheck,
  otp: otp ?? _otp,
  wallet: wallet ?? _wallet,
  oauthProvider: oauthProvider ?? _oauthProvider,
  oauthUid: oauthUid ?? _oauthUid,
  lastLogin: lastLogin ?? _lastLogin,
  updatedAt: updatedAt ?? _updatedAt,
  refferalCode: refferalCode ?? _refferalCode,
  friendCode: friendCode ?? _friendCode,
  parcelId: parcelId ?? _parcelId,
  dropHistory: dropHistory ?? _dropHistory,
);
  String? get id => _id;
  String? get pickupLocation => _pickupLocation;
  String? get pickupAddress => _pickupAddress;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get pickupName => _pickupName;
  String? get pickupNumber => _pickupNumber;
  String? get pickZone => _pickZone;
  String? get timeSlot => _timeSlot;
  String? get vehicleType => _vehicleType;
  String? get productType => _productType;
  String? get productDescription => _productDescription;
  String? get note => _note;
  String? get recieverId => _recieverId;
  String? get createdAt => _createdAt;
  String? get userId => _userId;
  String? get image => _image;
  String? get amount => _amount;
  String? get paymentType => _paymentType;
  String? get fromTime => _fromTime;
  String? get toTime => _toTime;
  String? get driverId => _driverId;
  String? get status => _status;
  String? get totalKm => _totalKm;
  String? get username => _username;
  String? get email => _email;
  String? get fName => _fName;
  String? get lName => _lName;
  String? get countrycode => _countrycode;
  String? get mobile => _mobile;
  String? get profession => _profession;
  String? get expJobTitle => _expJobTitle;
  String? get expEmployer => _expEmployer;
  String? get expCountry => _expCountry;
  String? get expStartDate => _expStartDate;
  String? get expEndDate => _expEndDate;
  String? get expCurrentWork => _expCurrentWork;
  String? get expDescription => _expDescription;
  String? get eduSchoolName => _eduSchoolName;
  String? get eduDegree => _eduDegree;
  String? get eduField => _eduField;
  String? get eduStartDate => _eduStartDate;
  String? get eduEndDate => _eduEndDate;
  String? get eduPercentage => _eduPercentage;
  String? get eduCurrentStudy => _eduCurrentStudy;
  String? get skillsDes => _skillsDes;
  String? get summaryDes => _summaryDes;
  String? get accomplishmentsDes => _accomplishmentsDes;
  String? get finalizeDes => _finalizeDes;
  String? get password => _password;
  String? get profilePic => _profilePic;
  String? get facebookId => _facebookId;
  String? get type => _type;
  String? get isGold => _isGold;
  String? get address => _address;
  String? get city => _city;
  String? get state => _state;
  String? get country => _country;
  String? get deviceToken => _deviceToken;
  String? get agreecheck => _agreecheck;
  dynamic get otp => _otp;
  String? get wallet => _wallet;
  dynamic get oauthProvider => _oauthProvider;
  dynamic get oauthUid => _oauthUid;
  dynamic get lastLogin => _lastLogin;
  String? get updatedAt => _updatedAt;
  String? get refferalCode => _refferalCode;
  String? get friendCode => _friendCode;
  String? get parcelId => _parcelId;
  List<DropHistory>? get dropHistory => _dropHistory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['pickup_location'] = _pickupLocation;
    map['pickup_address'] = _pickupAddress;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['pickup_name'] = _pickupName;
    map['pickup_number'] = _pickupNumber;
    map['pick_zone'] = _pickZone;
    map['time_slot'] = _timeSlot;
    map['vehicle_type'] = _vehicleType;
    map['product_type'] = _productType;
    map['product_description'] = _productDescription;
    map['note'] = _note;
    map['reciever_id'] = _recieverId;
    map['created_at'] = _createdAt;
    map['user_id'] = _userId;
    map['image'] = _image;
    map['amount'] = _amount;
    map['payment_type'] = _paymentType;
    map['from_time'] = _fromTime;
    map['to_time'] = _toTime;
    map['driver_id'] = _driverId;
    map['status'] = _status;
    map['total_km'] = _totalKm;
    map['username'] = _username;
    map['email'] = _email;
    map['f_name'] = _fName;
    map['l_name'] = _lName;
    map['countrycode'] = _countrycode;
    map['mobile'] = _mobile;
    map['profession'] = _profession;
    map['exp_job_title'] = _expJobTitle;
    map['exp_employer'] = _expEmployer;
    map['exp_country'] = _expCountry;
    map['exp_start_date'] = _expStartDate;
    map['exp_end_date'] = _expEndDate;
    map['exp_current_work'] = _expCurrentWork;
    map['exp_description'] = _expDescription;
    map['edu_school_name'] = _eduSchoolName;
    map['edu_degree'] = _eduDegree;
    map['edu_field'] = _eduField;
    map['edu_start_date'] = _eduStartDate;
    map['edu_end_date'] = _eduEndDate;
    map['edu_percentage'] = _eduPercentage;
    map['edu_current_study'] = _eduCurrentStudy;
    map['skills_des'] = _skillsDes;
    map['summary_des'] = _summaryDes;
    map['accomplishments_des'] = _accomplishmentsDes;
    map['finalize_des'] = _finalizeDes;
    map['password'] = _password;
    map['profile_pic'] = _profilePic;
    map['facebook_id'] = _facebookId;
    map['type'] = _type;
    map['isGold'] = _isGold;
    map['address'] = _address;
    map['city'] = _city;
    map['state'] = _state;
    map['country'] = _country;
    map['device_token'] = _deviceToken;
    map['agreecheck'] = _agreecheck;
    map['otp'] = _otp;
    map['wallet'] = _wallet;
    map['oauth_provider'] = _oauthProvider;
    map['oauth_uid'] = _oauthUid;
    map['last_login'] = _lastLogin;
    map['updated_at'] = _updatedAt;
    map['refferal_code'] = _refferalCode;
    map['friend_code'] = _friendCode;
    map['parcel_id'] = _parcelId;
    if (_dropHistory != null) {
      map['drop_history'] = _dropHistory?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "3"
/// parcel_order_id : "7"
/// drop_location : "Rotal Plati"
/// drop_name : "tes"
/// drop_number : "78788"
/// drop_address : "8887878998"
/// drop_zone : "Tearasdfsdf"
/// creat_date : "2023-11-23 11:03:38"
/// user_id : "1"
/// km : "7.3 km"
/// delivery_charge : "0"
/// drop_latitude : ""
/// drop_longitude : ""

class DropHistory {
  DropHistory({
      String? id, 
      String? parcelOrderId, 
      String? dropLocation, 
      String? dropName, 
      String? dropNumber, 
      String? dropAddress, 
      String? dropZone, 
      String? creatDate, 
      String? userId, 
      String? km, 
      String? deliveryCharge, 
      String? dropLatitude, 
      String? dropLongitude,}){
    _id = id;
    _parcelOrderId = parcelOrderId;
    _dropLocation = dropLocation;
    _dropName = dropName;
    _dropNumber = dropNumber;
    _dropAddress = dropAddress;
    _dropZone = dropZone;
    _creatDate = creatDate;
    _userId = userId;
    _km = km;
    _deliveryCharge = deliveryCharge;
    _dropLatitude = dropLatitude;
    _dropLongitude = dropLongitude;
}

  DropHistory.fromJson(dynamic json) {
    _id = json['id'];
    _parcelOrderId = json['parcel_order_id'];
    _dropLocation = json['drop_location'];
    _dropName = json['drop_name'];
    _dropNumber = json['drop_number'];
    _dropAddress = json['drop_address'];
    _dropZone = json['drop_zone'];
    _creatDate = json['creat_date'];
    _userId = json['user_id'];
    _km = json['km'];
    _deliveryCharge = json['delivery_charge'];
    _dropLatitude = json['drop_latitude'];
    _dropLongitude = json['drop_longitude'];
  }
  String? _id;
  String? _parcelOrderId;
  String? _dropLocation;
  String? _dropName;
  String? _dropNumber;
  String? _dropAddress;
  String? _dropZone;
  String? _creatDate;
  String? _userId;
  String? _km;
  String? _deliveryCharge;
  String? _dropLatitude;
  String? _dropLongitude;
DropHistory copyWith({  String? id,
  String? parcelOrderId,
  String? dropLocation,
  String? dropName,
  String? dropNumber,
  String? dropAddress,
  String? dropZone,
  String? creatDate,
  String? userId,
  String? km,
  String? deliveryCharge,
  String? dropLatitude,
  String? dropLongitude,
}) => DropHistory(  id: id ?? _id,
  parcelOrderId: parcelOrderId ?? _parcelOrderId,
  dropLocation: dropLocation ?? _dropLocation,
  dropName: dropName ?? _dropName,
  dropNumber: dropNumber ?? _dropNumber,
  dropAddress: dropAddress ?? _dropAddress,
  dropZone: dropZone ?? _dropZone,
  creatDate: creatDate ?? _creatDate,
  userId: userId ?? _userId,
  km: km ?? _km,
  deliveryCharge: deliveryCharge ?? _deliveryCharge,
  dropLatitude: dropLatitude ?? _dropLatitude,
  dropLongitude: dropLongitude ?? _dropLongitude,
);
  String? get id => _id;
  String? get parcelOrderId => _parcelOrderId;
  String? get dropLocation => _dropLocation;
  String? get dropName => _dropName;
  String? get dropNumber => _dropNumber;
  String? get dropAddress => _dropAddress;
  String? get dropZone => _dropZone;
  String? get creatDate => _creatDate;
  String? get userId => _userId;
  String? get km => _km;
  String? get deliveryCharge => _deliveryCharge;
  String? get dropLatitude => _dropLatitude;
  String? get dropLongitude => _dropLongitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['parcel_order_id'] = _parcelOrderId;
    map['drop_location'] = _dropLocation;
    map['drop_name'] = _dropName;
    map['drop_number'] = _dropNumber;
    map['drop_address'] = _dropAddress;
    map['drop_zone'] = _dropZone;
    map['creat_date'] = _creatDate;
    map['user_id'] = _userId;
    map['km'] = _km;
    map['delivery_charge'] = _deliveryCharge;
    map['drop_latitude'] = _dropLatitude;
    map['drop_longitude'] = _dropLongitude;
    return map;
  }

}