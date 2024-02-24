import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/rendering.dart';
import 'package:hojayegadriverapp/Helper/AppBtn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Helper/Color.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../Helper/SimBtn.dart';
import '../Helper/api.path.dart';
import '../Helper/session.dart';
import '../Model/Model.dart';
import 'Chat.dart';

class CustomerSupport extends StatefulWidget {
  @override
  _CustomerSupportState createState() => _CustomerSupportState();
}

class _CustomerSupportState extends State<CustomerSupport>
    with TickerProviderStateMixin {
  bool _isLoading = true, _isProgress = false;
  Animation? buttonSqueezeanimation;
  late AnimationController buttonController;
  bool _isNetworkAvail = true;
  List<Model> typeList = [];
  List<Model> ticketList = [];
  List<Model> statusList = [];
  List<Model> tempList = [];
  String? type, email, title, desc, status, id;
  FocusNode? nameFocus, emailFocus, descFocus;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final descController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool edit = false, show = false;
  bool fabIsVisible = true;
  ScrollController controller = new ScrollController();
  int offset = 0;
  int total = 0, curEdit = -1;
  bool isLoadingmore = true;

  @override
  void initState() {
    super.initState();
    getDriverId();
    statusList = [
      Model(id: "3", title: "Resolved"),
      Model(id: "5", title: "Reopen")
    ];
    buttonController =  AnimationController(
        duration:  Duration(milliseconds: 2000), vsync: this);
    buttonSqueezeanimation =  Tween(
      // begin: deviceWidth! * 0.7,
      end: 50.0,
    ).animate(new CurvedAnimation(
      parent: buttonController,
      curve: new Interval(
        0.0,
        0.150,
      ),
    ));
    controller = ScrollController();
    controller.addListener(() {
      setState(() {
        fabIsVisible =
            controller.position.userScrollDirection == ScrollDirection.forward;
        if (controller.offset >= controller.position.maxScrollExtent &&
            !controller.position.outOfRange) {
          isLoadingmore = true;
          if (offset < total) getTicket();
        }
      });
    });
    getType();
    getTicket();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    descController.dispose();
  }


  String? driver_id;
  getDriverId() async{
    SharedPreferences  preferences = await SharedPreferences.getInstance();
    driver_id = preferences.getString('driver_id');
    print("driver id iss innn ${driver_id}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.backgroundcolor,
      appBar: AppBar(
        backgroundColor: const Color(0xFF112c48),
        title: const Text("Customer Support", style: TextStyle(color:  Colors.white),),
        centerTitle: true,
        toolbarHeight: 60,
        elevation: 6,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16))),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
              ),
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back, color: colors.primary))
          ),
        ),
      ),
      floatingActionButton: AnimatedOpacity(
        child: FloatingActionButton(
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors.primary,
            ),
            child: Icon(
              Icons.add,
              color: colors.white,
            ),
          ),
          onPressed: () async {
            setState(() {
              edit = false;
              show = !show;

              clearAll();
            });
          },
          heroTag: null,
        ),
        duration: Duration(milliseconds: 100),
        opacity: fabIsVisible ? 1 : 0,
      ),
      body: _isNetworkAvail
          ? _isLoading
          ? SizedBox()
          : Stack(
          children: [
        SingleChildScrollView(
            controller: controller,
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  show
                      ? Card(
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.end,
                          children: [
                            setType(),
                            setEmail(),
                            setTitle(),
                            setDesc(),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                edit
                                    ? statusDropDown()
                                    : Container(),
                                Spacer(),
                                // Container(
                                //   height: 30,
                                //     width: 90,
                                //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colors.primary),
                                //     child: Center(child: Text("Send", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: colors.white),)))
                                sendButton(),
                              ],
                            )
                          ],
                        ),
                      ))
                      : Container(),
                  ticketList.length > 0
                      ? ListView.separated(
                      separatorBuilder:
                          (BuildContext context, int index) =>
                          Divider(),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: (offset < total)
                          ? ticketList.length + 1
                          : ticketList.length,
                      itemBuilder: (context, index) {
                        return (index == ticketList.length && isLoadingmore)
                            ? const Center(
                            child:
                            CircularProgressIndicator())
                            : ticketItem(index);
                      })
                      : Padding(
                        padding: const EdgeInsets.only(top: 150),
                        child: Container(
                        // height: deviceHeight! - kToolbarHeight -
                        //     MediaQuery.of(context).padding.top,
                        child: const Text("No Data To Show", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),),
                  ),)
                ],
              ),
            )),
         showCircularProgress(_isProgress, colors.primary),
      ]): noInternet(context),
    );
  }

  Widget showCircularProgress(bool _isProgress, Color color) {
    if (_isProgress) {
      return Center(
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(color),
          ));
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }


  double? deviceHeight;
  double? deviceWidth;

  Widget setType() {
    return DropdownButtonFormField(
      iconEnabledColor: colors.black,
      isDense: true,
      hint: new Text("Select Type",
        style: Theme.of(this.context).textTheme.subtitle2!.copyWith(
            color: colors.black,
            fontWeight: FontWeight.normal),
      ),
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        fillColor: colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color:  colors.white,),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide:
          BorderSide(color:  colors.black,),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      value: type,
      style: Theme.of(context)
          .textTheme
          .subtitle2!
          .copyWith(color: colors.black,),
      onChanged: (String? newValue) {
        if (mounted)
          setState(() {
            type = newValue;
          });
      },
      items: typeList.map((Model user) {
        return DropdownMenuItem<String>(
          value: user.id,
          child: Text(
            user.title!,
          ),
        );
      }).toList(),
    );
  }

  void validateAndSubmit() async {
    if (type == null)
      setSnackbar('Please Select Type');
    else if (validateAndSave()) {
      checkNetwork();
    }
  }

  Future<void> checkNetwork() async {
    bool avail = await isNetworkAvailable();
    if (avail) {
      sendRequest();
    } else {
      Future.delayed(Duration(seconds: 2)).then((_) async {
        if (mounted)
          setState(() {
            _isNetworkAvail = false;
          });
        await buttonController.reverse();
      });
    }
  }

  Future<bool> isNetworkAvailable() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }


  Future<Null> _playAnimation() async {
    try {
      await buttonController.forward();
    } on TickerCanceled {}
  }

  bool validateAndSave() {
    final form = _formkey.currentState!;
    form.save();
    if (form.validate()) {
      return true;
    }
    return false;
  }

  setEmail() {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: 10.0,
      ),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        focusNode: emailFocus,
        textInputAction: TextInputAction.next,
        controller: emailController,
        style: TextStyle(
            color: colors.black,
            fontWeight: FontWeight.normal),
        validator: (val) => validateEmail(
            val!, "Email Required",
            "Valid Email"),
        onSaved: (String? value) {
          email = value;
        },
        onFieldSubmitted: (v) {
          _fieldFocusChange(context, emailFocus!, nameFocus);
        },
        decoration: InputDecoration(
          hintText: "Email",
          hintStyle: Theme.of(this.context).textTheme.subtitle2!.copyWith(
              color: colors.black,
              fontWeight: FontWeight.normal),
          filled: true,
          fillColor: colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          focusedBorder: OutlineInputBorder(
            borderSide:
            const BorderSide(color: colors.black),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide:
            const BorderSide(color: colors.black),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  setTitle() {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: 10.0,
      ),
      child: TextFormField(
        focusNode: nameFocus,
        textInputAction: TextInputAction.next,
        controller: nameController,
        style: TextStyle(
            color: colors.black,
            fontWeight: FontWeight.normal),
        validator: (val) =>
            validateField(val!, "This Field is Required"),
        onSaved: (String? value) {
          title = value;
        },
        onFieldSubmitted: (v) {
          _fieldFocusChange(context, emailFocus!, nameFocus);
        },
        decoration: InputDecoration(
          hintText: "Title",
          hintStyle: Theme.of(this.context).textTheme.subtitle2!.copyWith(
              color: colors.black,
              fontWeight: FontWeight.normal),
          filled: true,
          fillColor: colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          focusedBorder: OutlineInputBorder(
            borderSide:
            const BorderSide(color: colors.black),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide:
            const BorderSide(color: colors.black),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  setDesc() {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: 10.0,
      ),
      child: TextFormField(
        focusNode: descFocus,
        controller: descController,
        maxLines: null,
        style: TextStyle(
            color: colors.black,
            fontWeight: FontWeight.normal),
        validator: (val) =>
            validateField(val!, "This Field is Required"),
        onSaved: (String? value) {
          desc = value;
        },
        onFieldSubmitted: (v) {
          _fieldFocusChange(context, emailFocus!, nameFocus);
        },
        decoration: InputDecoration(
          hintText: 'Description',
          hintStyle: Theme.of(this.context).textTheme.subtitle2!.copyWith(
              color: colors.black,
              fontWeight: FontWeight.normal),
          filled: true,
          fillColor: colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: colors.black),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide:
            BorderSide(color: colors.black),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode? nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  Future<void> getType() async {
    var headers = {
      'Cookie': 'ci_session=d49cf3f0250b76a714cefba85aa23f051219b8d8'
    };
    _isNetworkAvail = await isNetworkAvailable();
    if (_isNetworkAvail) {
      try {
        Response response = await post(Uri.parse("${ApiServicves.baseUrl + 'get_ticket_types'}"), headers: headers).timeout(Duration(seconds: timeOut));
        var getdata = json.decode(response.body);
        bool error = getdata["error"];
        String? msg = getdata["message"];
        if (!error) {
          var data = getdata["data"];
          typeList = (data as List)
              .map((data) =>  Model.fromSupport(data))
              .toList();
        } else {
          setSnackbar(msg!);
        }
        if (mounted)
          setState(() {
            _isLoading = false;
          });
      } on TimeoutException catch (_) {
        setSnackbar("Something went wrong. Please try again after some time");
      }
    } else {
      if (mounted)
        setState(() {
          _isNetworkAvail = false;
        });
    }
  }

  Future<void> getTicket() async {
    var headers = {
      'Cookie': 'ci_session=d49cf3f0250b76a714cefba85aa23f051219b8d8'
    };
    _isNetworkAvail = await isNetworkAvailable();
    if (_isNetworkAvail) {
      try {
        var parameter = {
          'user_id': driver_id.toString(),
          'limit': perPage.toString(),
          'offset': offset.toString(),
        };

        Response response = await post(Uri.parse("${ApiServicves.baseUrl + 'get_tickets'}"), body: parameter, headers: headers).timeout(Duration(seconds: timeOut));

        var getdata = json.decode(response.body);
        bool error = getdata["error"];
        String? msg = getdata["message"];
        if (!error) {
          var data = getdata["data"];
          total = int.parse(getdata["total"]);

          if ((offset) < total) {
            tempList.clear();
            var data = getdata["data"];
            tempList = (data as List).map((data) => new Model.fromTicket(data)).toList();
            ticketList.addAll(tempList);
            offset = offset + perPage;
          }
        } else {
          if (msg != "Ticket(s) does not exist") setSnackbar(msg!);
          isLoadingmore = false;
        }
        if (mounted)
          setState(() {
            _isLoading = false;
          });
      } on TimeoutException catch (_) {
        setSnackbar("Something went wrong. Please try again after some time");
      }
    } else {
      if (mounted)
        setState(() {
          _isNetworkAvail = false;
        });
    }
  }

  setSnackbar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg, textAlign: TextAlign.center,
        style: const TextStyle(color: colors.black),
      ),
      backgroundColor: colors.white,
      elevation: 1.0,
    ));
  }

  Widget sendButton() {
    return SimBtn(
        size: 0.4,
        title: 'Send',
        onBtnSelected: () {
          validateAndSubmit();
        });
  }

  Future<void> sendRequest() async {
    var headers = {
      'Cookie': 'ci_session=d49cf3f0250b76a714cefba85aa23f051219b8d8'
    };
    if (mounted)
      setState(() {
        _isProgress = true;
      });
    try {
      var data = {
        'user_id': driver_id.toString(),
        'subject': title,
        'description': desc,
        'ticket_type': type,
        'email': email,
      };
      if (edit) {
        data['ticket_id'] = id;
        data['status'] = status;
      }
      print("add tickett is herere ${data}");
      Response response = await post(edit ? Uri.parse("${ApiServicves.baseUrl + 'edit_ticket'}"): Uri.parse("${ApiServicves.baseUrl + 'add_ticket'}"), body: data, headers: headers).timeout(Duration(seconds: timeOut));

      if (response.statusCode == 200) {
        var getdata = json.decode(response.body);

        bool error = getdata["error"];
        String msg = getdata["message"];
        if (!error) {
          var data = getdata["data"];
          if (mounted)
            setState(() {
              if (edit)
                ticketList[curEdit] = Model.fromTicket(data[0]);
              else
                ticketList.add(Model.fromTicket(data[0]));
              edit = false;
              _isProgress = false;
              clearAll();
            });
        }
        setSnackbar(msg);
      }
    } on TimeoutException catch (_) {
      setSnackbar("Something went wrong. Please try again after some time");
    }
  }

  clearAll() {
    type = null;
    email = null;
    title = null;
    desc = null;
    emailController.text = "";
    nameController.text = "";
    descController.text = "";
  }

  Widget ticketItem(int index) {
    Color back;
    String? status = ticketList[index].status;
    //1 -> pending, 2 -> opened, 3 -> resolved, 4 -> closed, 5 -> reopened
    if (status == "1") {
      back = Colors.orange;
      status = "Pending";
    } else if (status == "2") {
      back = Colors.cyan;
      status = "Opened";
    } else if (status == "3") {
      back = Colors.green;
      status = "Resolved";
    } else if (status == "5") {
      back = Colors.cyan;
      status = "Reopen";
    } else {
      back = Colors.red;
      status = "Close";
    }
    return Card(
      elevation: 0,
      child: InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Chat(
                  id: ticketList[index].id,
                  status: ticketList[index].status,
                ),
              ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Type : " + ticketList[index].type.toString()),
                  const Spacer(),
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    decoration: BoxDecoration(
                        color: back,
                        borderRadius:
                         BorderRadius.all( Radius.circular(4.0))),
                    child: Text(
                      status,
                      style:
                      TextStyle(color: colors.white),
                    ),
                  )
                ],
              ),
              Text('Title' + " : " + ticketList[index].title!),
              Text("DESCRIPTION" + " : " + ticketList[index].desc!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text("DATE" + " : " + ticketList[index].date!),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    GestureDetector(
                        child: Container(
                          margin: const EdgeInsetsDirectional.only(start: 8),
                          padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                          decoration: const BoxDecoration(
                            color: colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(4.0),
                            ),
                          ),
                          child: const Text("Edit",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: colors.black,
                                fontSize: 11),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            edit = true;
                            show = true;
                            curEdit = index;
                            id = ticketList[index].id;
                            emailController.text = ticketList[index].email!;
                            nameController.text = ticketList[index].title!;
                            descController.text = ticketList[index].desc!;
                            type = ticketList[index].typeId;
                          });
                        }),
                    GestureDetector(
                        child: Container(
                          margin: EdgeInsetsDirectional.only(start: 8),
                          padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                          decoration: const BoxDecoration(
                              color: colors.white,
                              borderRadius:  BorderRadius.all(
                                   Radius.circular(4.0))),
                          child: const Text(
                            'Chat',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: colors.black,
                                fontSize: 11),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Chat(
                                  id: ticketList[index].id,
                                  status: ticketList[index].status,
                                ),
                              ));
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  statusDropDown() {
    return Container(
      width: MediaQuery.of(context).size.width * .4,
      child: DropdownButtonFormField(
        iconEnabledColor: colors.black,
        isDense: true,
        hint:  Text('Select Type',
          style: Theme.of(this.context).textTheme.subtitle2!.copyWith(
              color: colors.black,
              fontWeight: FontWeight.normal),
        ),
        decoration: InputDecoration(
          filled: true,
          isDense: true,
          fillColor: colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: colors.black),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide:
            BorderSide(color: colors.black),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        value: status,
        style: Theme.of(context)
            .textTheme
            .subtitle2!
            .copyWith(color: colors.black),
        onChanged: (String? newValue) {
          print("peinrtttttt ${status}");
          if (mounted)
            setState(() {
              status = newValue;
            });
        },
        items: statusList.map((Model user) {
          return DropdownMenuItem<String>(
            value: user.id,
            child: Text(
              user.title!,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget noInternet(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          noIntImage(),
          noIntText(context),
          noIntDec(context),
          AppBtn(
            title: "Try Again",
            btnAnim: buttonSqueezeanimation,
            btnCntrl: buttonController,
            onBtnSelected: () async {
              _playAnimation();
              Future.delayed(Duration(seconds: 2)).then((_) async {
                _isNetworkAvail = await isNetworkAvailable();
                if (_isNetworkAvail) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => super.widget));
                } else {
                  await buttonController.reverse();
                  if (mounted) setState(() {});
                }
              });
            },
          ),
        ]),
      ),
    );
  }
}
