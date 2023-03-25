import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PredictionScreen extends StatefulWidget {
  const PredictionScreen({Key? key}) : super(key: key);

  @override
  State<PredictionScreen> createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  TextEditingController reviewController = TextEditingController();
  String originalReview = '';
  String predictedDisease = '';
  List<dynamic> drugList = [];
  bool isValidate = true;

  void fetchResult() async {
    String url = 'http://65d5-103-149-158-212.ngrok.io/predict_disease';
    Map<String, String> inputData = {"text": originalReview};
    try {
      var client = http.Client();
      final inputDataJson = jsonEncode(inputData);
      final response = await client.post(Uri.parse(url),
          body: inputDataJson, headers: {"Content-Type": "application/json"});
      print('Result is: ${response.body}');
      var resultDict = jsonDecode(response.body);
      print('Disease: ${resultDict['disease']}');
      print('Drugs length: ${drugList.length}');
      print('Drugs: ${resultDict['drug_list'][0]}');
      setState(() {
        predictedDisease = resultDict['disease'];
        drugList = resultDict['drug_list'];
      });
    } catch (e) {
      print('Exception is: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 146, 102),
        title: Text(
          'Disease Prediction System',
          style: TextStyle(
              fontFamily: 'Poppins-Regular',
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: Container(
                  height: 163,
                  width: 230,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/undraw_Personal_opinions_re_qw29.png',
                        ),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Enter Medical Issue For Drug Recommendation',
                style: TextStyle(
                    fontFamily: 'Poppins-Regular',
                    fontSize: 15,
                    color: Color.fromARGB(255, 0, 51, 36),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: reviewController,
                  maxLines: null,
                  decoration: InputDecoration(
                      hintText: 'Enter Your medical review',
                      errorText: isValidate ? null : 'Enter some review',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 146, 102), width: 3),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 146, 102), width: 3),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.red, width: 3),
                      )),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 0, 146, 102)),
                onPressed: () {
                  print(reviewController.text);
                  setState(() {
                    originalReview = reviewController.text;
                    if (originalReview == '') {
                      print('Nothing to predict');
                      setState(() {
                        isValidate = false;
                      });
                    } else {
                      isValidate = true;
                      fetchResult();
                      reviewController.text = '';
                    }
                  });
                },
                child: Text(
                  'Predict',
                  style: TextStyle(
                      fontFamily: 'Poppins-Regular',
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Original Entered Review',
                style: TextStyle(
                  fontFamily: 'Poppins-Regular',
                  fontSize: 18,
                  color: Color.fromARGB(255, 0, 51, 36),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(originalReview,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 1, 61, 43), fontSize: 15)),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                'Predicted Medical Condition',
                style: TextStyle(
                  fontFamily: 'Poppins-Regular',
                  fontSize: 18,
                  color: Color.fromARGB(255, 0, 51, 36),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(predictedDisease,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 1, 61, 43))),
              SizedBox(
                height: 18,
              ),
              Text(
                'Top 3 Recommended Drugs',
                style: TextStyle(
                  fontFamily: 'Poppins-Regular',
                  fontSize: 18,
                  color: Color.fromARGB(255, 0, 51, 36),
                  fontWeight: FontWeight.bold,
                ),
              ),
              drugList.isEmpty
                  ? Text('')
                  : Container(
                      child: Column(
                        children: [
                          Text(
                            drugList[0],
                            style: TextStyle(
                              fontFamily: 'Poppins-Regular',
                              fontSize: 18,
                              color: Color.fromARGB(255, 0, 51, 36),
                            ),
                          ),
                          Text(
                            drugList[1],
                            style: TextStyle(
                              fontFamily: 'Poppins-Regular',
                              fontSize: 18,
                              color: Color.fromARGB(255, 0, 51, 36),
                            ),
                          ),
                          Text(
                            drugList[2],
                            style: TextStyle(
                              fontFamily: 'Poppins-Regular',
                              fontSize: 18,
                              color: Color.fromARGB(255, 0, 51, 36),
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
