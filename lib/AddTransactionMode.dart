import 'dart:convert';
import 'package:bank/Bank_api_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Transmode extends StatefulWidget {
  const Transmode({Key? key}) : super(key: key);

  @override
  State<Transmode> createState() => _TransmodeState();
}

class _TransmodeState extends State<Transmode> {
  @override
  Future<Bank> createAlbum(String title) async {
    final response = await http.post(
      Uri.parse('http://rawgymtest.gtgym.in/Bank/GetBankDetails'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'bankName': 'bankName',
        'ifsccode': 'ifsccode',
        'branch': "branch",
        'acctype': "acctype",
        'accno': '"accno"'
      }),
    );

    if (response.statusCode == 200) {
      return Bank.fromJson(jsonDecode(response.body)['success']);
    } else {
      throw Exception('Failed to create album.');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100,
        width: 200,
        color: Colors.cyanAccent,
      ),
    );
  }
}
