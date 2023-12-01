import 'dart:convert';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../Helper/color.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {


  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  Future<Null> _refresh() {
    return callApi();
  }
  Future<Null> callApi() async {
    getTermsConditionsDataApi();
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    getTermsConditionsDataApi();
  }

  var privacyPolicy;
  var privacyPolicyTitle;

  getTermsConditionsDataApi() async {
    var headers = {
      'Cookie': 'ci_session=5139fabebb6db295c72e0ae04ffdc37238cc5f0a'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://developmentalphawizz.com/hojayega/driver/api/static_pages'));
    request.fields.addAll({
      'id': '4'
    });

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print('_____termconditionss${response.statusCode}');
      final result =  await response.stream.bytesToString();
      final jsonResponse = json.decode(result);
      print('______asdsadsa____${result}');
      setState(() {
        privacyPolicy = jsonResponse['setting']['html'];
        privacyPolicyTitle = jsonResponse['setting']['title'];
      });
    }
    else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.backgroundcolor,
      appBar: AppBar(
        backgroundColor: const Color(0xFF112c48),
        title: const Text("PrivacyPolicy", style: TextStyle(color:  Colors.white),),
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
              child: Icon(Icons.arrow_back, color: colors.primary,)
            // IconButton(
            //   icon: const Icon(
            //     Icons.menu,
            //     color: Color(0xFF3a9f3e),
            //   ),
            //   onPressed: () {
            //     _key.currentState!.openDrawer();
            //   },
            // ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8,top: 5),
            child: Text("${privacyPolicyTitle}",style: TextStyle(fontSize: 16,color: colors.black,fontWeight: FontWeight.bold),),
          ),
          privacyPolicy == null || privacyPolicy == "" ? Center(child: CircularProgressIndicator(color: colors.secondary))
              : Html(
              data: privacyPolicy
          ),
        ],
      ),
    );
  }
}
