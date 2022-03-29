import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:interview_app/models/planetary_model.dart';

class NasaApi {
  Map mapResponse = {};
  String api_key = "o0UtQ0CY7Zq2JLTXyO0ptUMQ3o5E3nsYf6zx4aBu";

  Future<Planetary> getData() async {
    http.Response response;

    response = await http
        .get(Uri.parse("https://api.nasa.gov/planetary/apod?api_key=$api_key"));
    if (response.statusCode == 200) {
      String data = response.body;
      mapResponse = json.decode(data);

      return Planetary.fromJson(mapResponse);
    } else {
      throw Exception("Something went Wrong");
    }
  }
}
