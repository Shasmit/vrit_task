import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vrit_task/shorten_model.dart';
import 'package:vrit_task/static.dart';

class HttpsServices {
  http.Client client = http.Client();
  String apiEndpoint = "api.rebrandly.com";

  Future<http.Response?> postUrl(
      String destination, BuildContext context) async {
    try {
      var response = await http.post(
        Uri.https(
          apiEndpoint,
          '/v1/links',
        ),
        headers: {
          "Content-Type": "application/json",
          "apikey": "9910f0a0a0d44dfa9c295a3211fe18c6",
        },
        body: json.encode({
          "destination": destination,
        }),
      );
      if (response.statusCode == 200) {
        print("Response: ${response.body}");
        var detailData = await json.decode(response.body);
        var linkData = LinkData.fromJson(detailData);
        StaticVariables.linkData = linkData;
        StaticVariables.shortUrl = detailData['shortUrl'];
      } else if (response.statusCode == 401 ||
          response.statusCode == 400 ||
          response.statusCode == 404) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              backgroundColor: Colors.black,
              title: Text(
                response.body.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'PoppinsMedium',
                  fontSize: 16,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Ok',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'PoppinsMedium',
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }
      return response;
    } catch (error) {
      // Handle potential errors gracefully
      print("Error fetching api details: $error");
      rethrow; // Rethrow the error to allow for further handling
    }
  }
}
