import 'package:flutter/material.dart';

import 'package:interview_app/screens/detailed_screen.dart';
import 'package:interview_app/api/nasa_api.dart';
import 'package:interview_app/models/planetary_model.dart';

String detailedScreen = 'Detailed Screen';
String api_key = "o0UtQ0CY7Zq2JLTXyO0ptUMQ3o5E3nsYf6zx4aBu";

class MasterScreen extends StatefulWidget {
  const MasterScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MasterScreen> createState() => _MasterScreenState();
}

class _MasterScreenState extends State<MasterScreen> {
  late Future<Planetary> planetary;

  @override
  void initState() {
    NasaApi api = NasaApi();
    planetary = api.getData();
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
          child: FutureBuilder<Planetary>(
            future: planetary,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
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
                    !snapshot.hasData
                        ? Container()
                        : Text(
                            snapshot.data!.title,
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
                    !snapshot.hasData
                        ? Container()
                        : Text(
                            snapshot.data!.media_type,
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
                                    explanation: snapshot.data!.explanation,
                                    date: snapshot.data!.date,
                                  )));
                        },
                        child: Text(detailedScreen))
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ));
  }
}
