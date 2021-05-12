import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:apkaleatorio/models/data.dart';
import "package:http/http.dart" as http;
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 int value=0;
int  generateRandomNumber() {

 var random = new Random();
  value = random.nextInt(1000);

    // Printing Random Number between 1 to 1000 on Terminal Window.
    print(value);
return value;
}

  final Uri _url =
      Uri.parse('https://apidoble2018113411.azurewebsites.net/api/data');

  Future<String> _sendData() async {
    Welcome data = Welcome(
      random: value,
      dataTime: DateTime.now(),
    );
    var response = await http.post(
      _url,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: welcomeToJson(data),
    );
    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
        body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child:
              ElevatedButton(
              onPressed: () => generateRandomNumber(),
              child: Text(' Genera un numero random '),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                    await _sendData();},
              child: Text(' Enviar datos '),
            )
        ])
      )
     )
   );
  }
}