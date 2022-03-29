import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailedScreen extends StatefulWidget {
  String explanation;
  String date;

  DetailedScreen({required this.explanation, required this.date});

  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
        'Detailed Screen',
        textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[
            const Text(
              'Date:',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            Text(
              widget.date,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
              width: 20.0,
              height: 20.0,
            ),
            const Text(
              'Explanation:',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            Text(
              widget.explanation,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16.0,

              ),
            ),
            const SizedBox(
              width: 20.0,
              height: 20.0,
            ),
          ],),
      ),);
  }
}

