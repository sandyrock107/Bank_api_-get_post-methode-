import 'dart:convert';
import 'package:bank/testapi.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Addbankinformation extends StatefulWidget {
  const Addbankinformation({Key? key}) : super(key: key);

  @override
  State<Addbankinformation> createState() => _AddbankinformationState();
}

class _AddbankinformationState extends State<Addbankinformation> {
  @override
  TextEditingController txtAccNo = new TextEditingController();
  TextEditingController txtBankname = new TextEditingController();
  TextEditingController txtifsc = new TextEditingController();
  TextEditingController txtbranch = new TextEditingController();
  TextEditingController txtaccountType = new TextEditingController();

  Future<bool> CreateBank() async {
    final response = await http.post(
      Uri.parse('http://rawgymtest.gtgym.in/Bank/InsertBank'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "gymId": "5",
        "bankId": "0",
        "accountNo": txtAccNo.text,
        "bankName": txtBankname.text,
        "ifscCode": txtifsc.text,
        "branch": txtbranch.text,
        "accountType": txtaccountType.text,
        "createdBy": "1"
      }),
    );

    if (response.statusCode == 200) {
      return (jsonDecode(response.body)['success']);
    } else {
      throw Exception('Failed to create album.');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 200,
                  //color: Colors.cyanAccent,
                  child: const Center(
                    child: Text(
                      "Bank Information",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 60),
                  height: 35,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (await CreateBank()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Post()),
                        );
                      } else {
                        print("Failes");
                      }
                    },
                    child: Text("ADD"),

                    //}
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      // backgroundColor: Colors.blueGrey,
      // body: Column(
      //   children: [
      //     SizedBox(
      //       height: 100,
      //     ),
      //     Container(
      //       height: 40,
      //       width: 200,
      //       //color: Colors.cyanAccent,
      //       child: const Center(
      //         child: Text(
      //           "Bank information",
      //           style: TextStyle(
      //               color: Colors.black,
      //               fontSize: 24,
      //               fontWeight: FontWeight.bold),
      //         ),
      //       ),
      //     ),
      //     SizedBox(
      //       height: 50,
      //     ),
      //     Container(
      //       height: 30,
      //       width: 400,
      //       //color: Colors.cyanAccent,
      //       child: const Text(
      //         "Bank Name",
      //         style: TextStyle(
      //             color: Colors.black,
      //             fontSize: 20,
      //             fontWeight: FontWeight.w700),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 5.0),
      //       child: TextFormField(
      //         controller: txtBankname,
      //         decoration: InputDecoration(
      //             fillColor: Colors.white.withOpacity(0.6),
      //             filled: true,
      //             border: OutlineInputBorder(),
      //             labelText: "Bank name",
      //             labelStyle:
      //                 new TextStyle(color: Colors.black, fontSize: 18.0)),
      //       ),
      //     ),
      //     Container(
      //       height: 30,
      //       width: 400,
      //       //color: Colors.cyanAccent,
      //       child: const Text(
      //         "Account No",
      //         style: TextStyle(
      //             color: Colors.black,
      //             fontSize: 20,
      //             fontWeight: FontWeight.w700),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 5.0),
      //       child: TextFormField(
      //         controller: txtAccNo,
      //         decoration: InputDecoration(
      //             fillColor: Colors.white.withOpacity(0.6),
      //             filled: true,
      //             border: OutlineInputBorder(),
      //             labelText: "Account No",
      //             labelStyle:
      //                 new TextStyle(color: Colors.black, fontSize: 18.0)),
      //       ),
      //     ),
      //     Container(
      //       height: 30,
      //       width: 400,
      //       //color: Colors.cyanAccent,
      //       child: const Text(
      //         "Ifsc code",
      //         style: TextStyle(
      //             color: Colors.black,
      //             fontSize: 20,
      //             fontWeight: FontWeight.w700),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 5.0),
      //       child: TextFormField(
      //         controller: txtifsc,
      //         decoration: InputDecoration(
      //             fillColor: Colors.white.withOpacity(0.6),
      //             filled: true,
      //             border: OutlineInputBorder(),
      //             labelText: "Ifsc code",
      //             labelStyle:
      //                 new TextStyle(color: Colors.black, fontSize: 18.0)),
      //       ),
      //     ),
      //     Container(
      //       height: 30,
      //       width: 400,
      //       //color: Colors.cyanAccent,
      //       child: const Text(
      //         "Branch",
      //         style: TextStyle(
      //             color: Colors.black,
      //             fontSize: 20,
      //             fontWeight: FontWeight.w700),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 5.0),
      //       child: TextFormField(
      //         controller: txtbranch,
      //         decoration: InputDecoration(
      //             fillColor: Colors.white.withOpacity(0.6),
      //             filled: true,
      //             border: OutlineInputBorder(),
      //             labelText: "Branch",
      //             labelStyle:
      //                 new TextStyle(color: Colors.black, fontSize: 18.0)),
      //       ),
      //     ),
      //     Container(
      //       height: 30,
      //       width: 400,
      //       //color: Colors.cyanAccent,
      //       child: const Text(
      //         "Account type",
      //         style: TextStyle(
      //             color: Colors.black,
      //             fontSize: 20,
      //             fontWeight: FontWeight.w700),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 5.0),
      //       child: TextFormField(
      //         controller: txtaccountType,
      //         decoration: InputDecoration(
      //             fillColor: Colors.white.withOpacity(0.6),
      //             filled: true,
      //             border: OutlineInputBorder(),
      //             labelText: "Account type",
      //             labelStyle:
      //                 new TextStyle(color: Colors.black, fontSize: 18.0)),
      //       ),
      //     ),
      //     SizedBox(
      //       height: 50,
      //     ),
      //     Container(
      //       height: 35,
      //       width: 100,
      //       child: ElevatedButton(
      //         onPressed: () async {
      //           if (await CreateBank()) {
      //             //if (formKey.currentContext!.()) {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) => const Post()),
      //             );
      //           } else {
      //             print("Failes");
      //           }
      //         },
      //         child: Text("SAVE"),
      //
      //         //}
      //       ),
      //     ),
      //   ],
      // ),

      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, top: 10, right: 10),
            height: 300,
            width: 370,
            //color: Colors.cyanAccent,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.grey, Colors.green],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            /* decoration: BoxDecoration(

                  border: Border.all(width: 1),

                  borderRadius: BorderRadius.all(Radius.circular(3.5))),*/
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 20,
                      width: 120,
                      margin: EdgeInsets.only(left: 5),
                      child: const Text(
                        "Account No  :",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 20,
                      width: 200,
                      //color: Colors.cyanAccent,
                      child: TextFormField(
                        controller: txtAccNo,
                        style: TextStyle(fontSize: 14),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Enter your name",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      height: 20,
                      width: 120,
                      child: const Text(
                        "Bank Name  :",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 20,
                      width: 200,
                      //color: Colors.cyanAccent,
                      child: TextFormField(
                        controller: txtBankname,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Enetr your bank name"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 20,
                      width: 120,
                      margin: EdgeInsets.only(left: 5),
                      child: const Text(
                        "Branch Name :",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 20,
                      width: 200,
                      //color: Colors.cyanAccent,
                      child: TextFormField(
                        controller: txtbranch,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Enter your branch"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 20,
                      width: 120,
                      margin: EdgeInsets.only(left: 5),
                      child: const Text(
                        "IFSC Code  :",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 20,
                      width: 200,
                      //color: Colors.cyanAccent,
                      child: TextFormField(
                        controller: txtifsc,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Enter your IFSC",
                            fillColor: Colors.cyanAccent),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 20,
                      width: 120,
                      margin: EdgeInsets.only(left: 5),
                      child: const Text(
                        "Account type :",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 20,
                      width: 200,
                      //color: Colors.cyanAccent,
                      child: TextFormField(
                        controller: txtaccountType,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Account type"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, top: 30),
                      height: 40,
                      width: 177,
                      child:
                          ElevatedButton(onPressed: () {}, child: Text("Edit")),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, top: 30),
                      height: 40,
                      width: 177,
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("Rename")),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: 40,
            width: 400,
            //color: Colors.blue,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.grey, Colors.black38],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            child: Center(
              child: const Text(
                "WELCOME TO BANK",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          SizedBox(
            height: 185,
          ),
          Container(
            height: 40,
            width: 400,
            //color: Colors.blue,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.grey, Colors.black38],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            child: const Text(
              "Description",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 175,
            width: 400,
            //color: Colors.blue,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.grey, Colors.black38],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            child: const Center(
              child: Text(
                "Bank Cards Website Template is a net banking category website template with a best-looking cards availability display in the background itself and the three cards down to the banner show the offers provided by the company and no of customers available in your banking cards service. ",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
