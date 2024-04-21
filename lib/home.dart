import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:vrit_task/http_service.dart';
import 'package:vrit_task/routes.dart';
import 'package:vrit_task/static.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final urlController = TextEditingController();
  final shortUrlController = TextEditingController();
  bool isShortened = false;
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'URL Shortner',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'PoppinsSemiBold',
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight * 0.05,
              ),
              const Text(
                'Shorten your URL',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontFamily: 'PoppinsSemiBold',
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              const Text(
                'Enter your URL',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'PoppinsMedium',
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              SizedBox(
                width: screenWidth * 0.8,
                child: TextFormField(
                  controller: urlController,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'PoppinsMedium',
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Enter URL',
                    hintStyle: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'PoppinsMedium',
                      fontSize: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    HttpsServices().postUrl(urlController.text, context);
                    if (StaticVariables.shortUrl != '') {
                      isShortened = true;
                      shortUrlController.text = StaticVariables.shortUrl;
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 10,
                  ),
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Shorten',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'PoppinsSemiBold',
                    fontSize: 16,
                  ),
                ),
              ),
              isShortened
                  ? Column(
                      children: [
                        SizedBox(
                          height: screenHeight * 0.05,
                        ),
                        const Text(
                          'Shortened URL :',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontFamily: 'PoppinsMedium',
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        SizedBox(
                          width: screenWidth * 0.8,
                          child: TextFormField(
                            readOnly: true,
                            style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'PoppinsMedium',
                              fontSize: 15,
                            ),
                            initialValue: StaticVariables.shortUrl,
                            decoration: InputDecoration(
                              hintText: 'Shortened URL',
                              hintStyle: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'PoppinsMedium',
                                fontSize: 16,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  FlutterClipboard.copy(
                                      StaticVariables.shortUrl);

                                  setState(() {
                                    isShortened = false;
                                    urlController.clear();
                                  });
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 50,
                                  vertical: 10,
                                ),
                                backgroundColor: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'Copy',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'PoppinsSemiBold',
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.05,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  urlController.clear();
                                  isShortened = false;
                                });
                                Navigator.pushNamed(
                                  context,
                                  AppRoute.qrRoute,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 50,
                                  vertical: 10,
                                ),
                                backgroundColor: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'View Qr',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'PoppinsSemiBold',
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
