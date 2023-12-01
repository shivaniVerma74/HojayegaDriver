import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:hojayegadriverapp/Helper/api.path.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Helper/Color.dart';
import '../Helper/session.dart';
import '../Model/Model.dart';
import 'package:http/http.dart' as http;

class Chat extends StatefulWidget {
  final String? id, status;
  const Chat({Key? key, this.id, this.status}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

StreamController<String>? chatstreamdata;

class _ChatState extends State<Chat> {
  TextEditingController msgController = new TextEditingController();
  List<XFile> files = [];
  List<Model> chatList = [];
  late Map<String?, String> downloadlist;
  String _filePath = "";

  ScrollController _scrollController = new ScrollController();

  String? CUR_TICK_ID = '';

  get prefs => null;

  @override
  void initState() {
    super.initState();
    getDriverId();
    downloadlist = new Map<String?, String>();
    CUR_TICK_ID = widget.id;
    // FlutterDownloader.registerCallback(downloadCallback);
    setupChannel();
    getMsg();
  }

  String? driver_id;
  getDriverId() async{
    SharedPreferences  preferences = await SharedPreferences.getInstance();
    driver_id = preferences.getString('driver_id');
    print("driver id iss innn ${driver_id}");
  }

  @override
  void dispose() {
    CUR_TICK_ID = '';
    if (chatstreamdata != null) chatstreamdata!.sink.close();
    super.dispose();
  }

  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort send =
    IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.backgroundcolor,
      appBar: AppBar(
        backgroundColor: const Color(0xFF112c48),
        title: const Text("Chat", style: TextStyle(color:  Colors.white),),
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
      body: Column(
        children: <Widget>[buildListMessage(), msgRow()],
      ),
    );
  }

  void setupChannel() {
    chatstreamdata = StreamController<String>(); //.broadcast();
    chatstreamdata!.stream.listen((response) {
      setState(() {
        final res = json.decode(response);
        Model message;
        String mid;
        message = Model.fromChat(res["data"]);
        chatList.insert(0, message);
        files.clear();
      });
    });
  }

  void insertItem(String response) {
    if (chatstreamdata != null) chatstreamdata!.sink.add(response);
    _scrollController.animateTo(0.0,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  Widget buildListMessage() {
    return Flexible(
      child: ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (context, index) => msgItem(index, chatList[index]),
        itemCount: chatList.length,
        reverse: true,
        controller: _scrollController,
      ),
    );
  }

  Widget msgItem(int index, Model message) {
    if (message.uid == driver_id.toString()) {
      //Own message
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(),
          ),
          Flexible(
            flex: 2,
            child: MsgContent(index, message),
          ),
        ],
      );
     } else {
      //Other's message
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 2,
            child: MsgContent(index, message),
          ),
          Flexible(
            flex: 1,
            child: Container(),
          ),
        ],
      );
    }
  }

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);


  Widget MsgContent(int index, Model message) {
    //String filetype = message.attachment_mime_type.trim();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: message.uid == driver_id.toString()
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: <Widget>[
        message.uid == driver_id.toString()
            ? Container()
            : Padding(
           padding: EdgeInsets.only(top: 10),
           child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // ClipOval(child:
              // message.profile == null || message.profile.isEmpty? Image.asset("assets/images/placeholder.png",width: 25, height: 25,)
              //     :FadeInImage.assetNetwork(
              //   image: message.profile,
              //   placeholder: "assets/images/placeholder.png",
              //   width: 25,
              //   height: 25,
              //   fit: BoxFit.cover,
              // )),
              Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text(capitalize(message.name!),
                    style:
                    const TextStyle(color: colors.white, fontSize: 12)),
              ),
            ],
          ),
        ),
        ListView.builder(
            itemBuilder: (context, index) {
              return attachItem(message.attach!, index, message);
            },
            itemCount: message.attach!.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true),
        message.msg != null && message.msg!.isNotEmpty
            ? Card(
          elevation: 0.0,
          color: message.uid == driver_id.toString()
              ? colors.white
              : colors.white,
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
            child: Column(
              crossAxisAlignment: message.uid == driver_id.toString()
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: <Widget>[
                Text("${message.msg}",
                    style: const TextStyle(
                        color: colors.black)),
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 5),
                  child: Text(message.date!,
                      style: const TextStyle(
                          color: colors.black,
                          fontSize: 9),
                  ),
                ),
              ],
             ),
           ),
          ): Container(),
      ],
    );
  }

  // void _requestDownload(String? url, String? mid) async {
  //   bool checkpermission = await Checkpermission();
  //   if (checkpermission) {
  //     if (Platform.isIOS) {
  //       Directory target = await getApplicationDocumentsDirectory();
  //       _filePath = target.path.toString();
  //     } else {
  //       Directory? downloadsDirectory =
  //       await (DownloadsPathProvider.downloadsDirectory);
  //       _filePath = downloadsDirectory!.path.toString();
  //     }
  //
  //     String fileName = url!.substring(url.lastIndexOf("/") + 1);
  //     File file = new File(_filePath + "/" + fileName);
  //     bool hasExisted = await file.exists();
  //
  //     if (downloadlist.containsKey(mid)) {
  //       final tasks = await FlutterDownloader.loadTasksWithRawQuery(
  //           query:
  //           "SELECT status FROM task WHERE task_id=${downloadlist[mid]}");
  //
  //       if (tasks == 4 || tasks == 5) downloadlist.remove(mid);
  //     }
  //
  //     if (hasExisted) {
  //       final _openFile = await OpenFilex.open(_filePath + "/" + fileName);
  //     } else if (downloadlist.containsKey(mid)) {
  //       setSnackbar("Downloading");
  //     } else {
  //       setSnackbar("Downloading");
  //       final taskid = await FlutterDownloader.enqueue(
  //           url: url,
  //           savedDir: _filePath,
  //           headers: {"auth": "test_for_sql_encoding"},
  //           showNotification: true,
  //           openFileFromNotification: true);
  //       setState(() {
  //         downloadlist[mid] = taskid.toString();
  //       });
  //     }
  //   }
  // }

  Future<bool> Checkpermission() async {
    var status = await Permission.storage.status;

    if (status != PermissionStatus.granted) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
      ].request();
      if (statuses[Permission.storage] == PermissionStatus.granted) {
        FileDirectoryPrepare();
        return true;
      }
    } else {
      FileDirectoryPrepare();
      return true;
    }
    return false;
  }

  Future<Null> FileDirectoryPrepare() async {
    // _filePath = (await _findLocalPath()) +
    //     Platform.pathSeparator +
    //     'Download'; //"${StringsRes.mainappname}";
    if (Platform.isIOS) {
      Directory target = await getApplicationDocumentsDirectory();
      _filePath = target.path.toString();
    } else {
      // Directory? downloadsDirectory = await (DownloadsPathProvider.downloadsDirectory);
      // _filePath = downloadsDirectory!.path.toString();
    }
  }

  // _imgFromGallery() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);
  //   if (result != null) {
  //     files = result.paths.map((path) => File(path!)).toList();
  //     if (mounted) setState(() {});
  //   } else {
  //     // User canceled the picker
  //   }
  // }

  Future<void> sendMessage(String message) async {
    setState(() {
      msgController.text = "";
    });
    var request = http.MultipartRequest('POST', Uri.parse(ApiServicves.sendMsg));
    request.fields.addAll({
      'user_type': 'user',
      'user_id': driver_id.toString(),
      'ticket_id': widget.id!,
      'message': message
    });

    if (files != null) {
      for (int i = 0; i < files.length; i++) {
        var pic = await http.MultipartFile.fromPath('attachments[]', files[i].path);
        request.files.add(pic);
      }
    }
   print("image in send api ${request.fields} ${request.files}");
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    var getdata = json.decode(responseString);
    bool error = getdata["error"];
    String? msg = getdata['message'];
    var data = getdata["data"];
    if (!error) {
      insertItem(responseString);
    }
  }

  Future<void> getMsg() async {
    var headers = {
      'Cookie': 'ci_session=e383e7cb957b022113ec4509d4124e59d0856a16'
    };
    try {
      var data = {
        'ticket_id': widget.id,
      };

      Response response = await post(Uri.parse(ApiServicves.baseUrl + 'get_messages'), body: data, headers: headers).timeout(Duration(seconds: timeOut));

      if (response.statusCode == 200) {
        var getdata = json.decode(response.body);

        bool error = getdata["error"];
        String? msg = getdata["message"];

        if (!error) {
          var data = getdata["data"];
          chatList =
              (data as List).map((data) => new Model.fromChat(data)).toList();
        } else {
          if (msg != "Ticket Message(s) does not exist") setSnackbar(msg!);
        }
        if (mounted) setState(() {});
      }
    } on TimeoutException catch (_) {
      // setSnackbar("Something went wrong");
    }
  }

  setSnackbar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: new Text(
        msg,
        textAlign: TextAlign.center,
        style: TextStyle(color: colors.black),
      ),
      backgroundColor: colors.white,
      elevation: 1.0,
    ));
  }

  final picker = ImagePicker();
  _imgFromGallery() async {
    final List<XFile>? pickedFile = await picker.pickMultiImage(imageQuality: 80);
    setState(() {
      if (pickedFile!.isNotEmpty) {
        files.addAll(pickedFile);
        // msgController.text = "${files.length} image selected";
        if (mounted) setState(() {});
      } else {
        print('No image selected.');
      }
    });

    ///----
  }

  msgRow() {
    return widget.status != "4"
        ? Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        color: colors.white,
        child: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                _imgFromGallery();
              },
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: colors.primary,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(
                  Icons.add,
                  color: colors.white,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                children: [
                  if(files != null && files.length>0)
                  Text("${files.length} image selected"),
                  TextField(
                    controller: msgController,
                    maxLines: null,
                    style: const TextStyle(
                      color: colors.black,
                    ),
                    decoration: const InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(
                            color: colors.black),
                        border: InputBorder.none),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            FloatingActionButton(
              mini: true,
              onPressed: () {
                print("wokingggggggggg");
                if (msgController.text.trim().length > 0 || files.length > 0) {
                  sendMessage(msgController.text.trim());
                }
              },
              child: Icon(
                Icons.send,
                color: colors.white,
                size: 18,
              ),
              backgroundColor: colors.primary,
              elevation: 0,
            ),
          ],
        ),
      ),
    ): Container();
  }

  Widget attachItem(List<attachment> attach, int index, Model message) {
    String? file = attach[index].media;
    String? type = attach[index].type;
    String icon;
    if (type == "video")
      icon = "assets/images/video.png";
    else if (type == "document")
      icon = "assets/images/doc.png";
    else if (type == "spreadsheet")
      icon = "assets/images/sheet.png";
    else
      icon = "assets/images/zip.png";

    return file == null
        ? Container()
        : Stack(
      alignment: Alignment.bottomRight,
      children: <Widget>[
        Card(
          //margin: EdgeInsets.only(right: message.sender_id == myid ? 10 : 50, left: message.sender_id == myid ? 50 : 10, bottom: 10),
          elevation: 0.0,
          color: message.uid == driver_id.toString()
              ? colors.black
              : colors.white,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: message.uid == driver_id.toString()
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: <Widget>[
                //_messages[index].issend ? Container() : Center(child: SizedBox(height:20,width: 20,child: new CircularProgressIndicator(backgroundColor: ColorsRes.secondgradientcolor,))),

                GestureDetector(
                  onTap: () {
                    // _requestDownload(attach[index].media, message.id);
                  },
                  child: type == "image"
                      ? Image.network(file,
                      width: 250,
                      height: 150,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => erroWidget(150))
                      : Image.asset(
                    icon,
                    width: 100,
                    height: 100,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text(message.date!,
                style: TextStyle(
                    color: colors.black,
                    fontSize: 9)),
          ),
        ),
      ],
    );
  }
}
