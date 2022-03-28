import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:interview_app/detailed_screen.dart';

Map mapResponse = {};
String detailedScreen = 'Detailed Screen';
String api_key = "o0UtQ0CY7Zq2JLTXyO0ptUMQ3o5E3nsYf6zx4aBu";

class MasterScreen extends StatefulWidget {
  const MasterScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MasterScreen> createState() => _MasterScreenState();
}

class _MasterScreenState extends State<MasterScreen> {
  Future getData() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "https://api.nasa.gov/planetary/apod?api_key=" '$api_key'));
    if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightGreenAccent,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            widget.title,
            textAlign: TextAlign.center,
          ),
        ),
        body: Center(
          child: Visibility(
            visible: mapResponse.isNotEmpty,
            replacement: const Text(
              'Data is Loading...',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Title:',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 20.0,
                  ),
                ),
                mapResponse.isEmpty
                    ? Container()
                    : Text(
                        mapResponse["title"],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                const SizedBox(
                  width: 20.0,
                  height: 20.0,
                ),
                const Text(
                  'Media Type:',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 20.0,
                  ),
                ),
                mapResponse.isEmpty
                    ? Container()
                    : Text(
                        mapResponse["media_type"],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                const SizedBox(
                  width: 20.0,
                  height: 20.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailedScreen(
                                explanation:
                                    mapResponse['explanation'].toString(),
                                date: mapResponse['date'].toString(),
                              )));
                    },
                    child: Text(detailedScreen))
              ],
            ),
          ),
        ));
  }
}
