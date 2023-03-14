import 'dart:convert';

import 'package:bank/Bank_api_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _customState();
}

class _customState extends State<Post> {
  List<Bank> transList = [];
  String strTitle = "Bank";

  @override
  void initState() {
    FetchBank();
  }

  Future<List<Bank>> FetchBank() async {
    final resp = await http.post(
      Uri.parse("http://rawgymtest.gtgym.in/Bank/GetBankDetails"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{"gymId": "5"}),
    );
    print(resp.body);
    if (resp.statusCode == 200) {
      transList.clear();
      print(jsonDecode(resp.body)['bankDetails']);
      (jsonDecode(resp.body)['bankDetails'] as List).forEach((s) {
        print(s);
        transList.add(Bank.fromJson(s));
        print(transList.last.bankName);
        //print(countryList.length);
      });

      return transList;
    }
    throw ("Faild to load");
  }

  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.grey,
        appBar: AppBar(),
        body: Container(
          //color: Colors.cyanAccent,
          child: FutureBuilder<List<Bank>>(
            future: FetchBank(),
            builder: (context, projectSnap) {
              if (projectSnap.hasData) {
                return ListView.builder(
                  itemCount: projectSnap.data!.length,
                  itemBuilder: (context, index) {
                    Bank project = projectSnap.data![index];
                    return Card(
                        color: Colors.grey,
                        child: Row(children: [
                          GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                /*     Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => click(
                                  projectSnap.data![index].transactionModeId
                                      .toString(),
                                  projectSnap.data![index].userName
                                      .toString())));*/
                              },
                              child: Column(
                                children: [
                                  // Text(projectSnap.data![index].branch.toString()),
                                  // Text(
                                  //     projectSnap.data![index].ifsccode.toString()),
                                  // Text(projectSnap.data![index].accno.toString()),
                                  // Text(projectSnap.data![index].accounttype
                                  //     .toString()),
                                  Container(
                                    height: 40,
                                    width: 200,
                                    //color: Colors.cyanAccent,
                                    child: const Center(
                                      child: Text(
                                        "Bank information",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 2),
                                        height: 30,
                                        width: 350,
                                        //color: Colors.cyanAccent,
                                        child: const Text(
                                          "Bank Name",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),

                                  Container(
                                    height: 30,
                                    width: 350,
                                    //color: Colors.cyan,
                                    margin: EdgeInsets.only(left: 2),

                                    child: Text(
                                        projectSnap.data![index].bankName
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500
                                            //backgroundColor: Colors.cyanAccent),
                                            )),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 350,
                                    margin: EdgeInsets.only(left: 2),
                                    //color: Colors.cyanAccent,
                                    child: const Text(
                                      "Branch",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 350,
                                    //color: Colors.cyan,
                                    margin: EdgeInsets.only(left: 2),

                                    child: Text(
                                        projectSnap.data![index].branch
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500
                                            //backgroundColor: Colors.cyanAccent),
                                            )),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 350,
                                    //color: Colors.cyanAccent,
                                    margin: EdgeInsets.only(left: 2),
                                    child: const Text(
                                      "Ifsccode",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 350,
                                    //color: Colors.cyan,
                                    margin: EdgeInsets.only(left: 2),

                                    child: Text(
                                        projectSnap.data![index].ifsccode
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500
                                            //backgroundColor: Colors.cyanAccent),
                                            )),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 350,
                                    //color: Colors.cyanAccent,
                                    margin: EdgeInsets.only(left: 2),
                                    child: const Text(
                                      "Acc NO",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 350,
                                    //color: Colors.cyan,
                                    margin: EdgeInsets.only(left: 2),

                                    child: Text(
                                        projectSnap.data![index].accno
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500
                                            //backgroundColor: Colors.cyanAccent),
                                            )),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 350,
                                    //color: Colors.cyanAccent,
                                    margin: EdgeInsets.only(left: 2),
                                    child: const Text(
                                      "Accounttype",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 350,
                                    //color: Colors.cyan,
                                    margin: EdgeInsets.only(left: 2),

                                    child: Text(
                                        projectSnap.data![index].accounttype
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500
                                            //backgroundColor: Colors.cyanAccent),
                                            )),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              )),
                        ]));
                  },
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ));
  }
}
