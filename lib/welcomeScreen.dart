import 'package:flutter/material.dart';
import 'package:review_based_disease_prediction_app/predictionScreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/Vector.png'),
                      ),
                    ),
                  ),
                  const Text('CONSULT',
                      style: TextStyle(
                          fontFamily: 'Poppins-Regular',
                          fontSize: 32,
                          color: Color.fromARGB(255, 0, 146, 102),
                          fontWeight: FontWeight.w900))
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 163,
                width: 230,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/Group 1.png',
                      ),
                      fit: BoxFit.fill),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              const Text(
                'Ask our patients’s \nAssistant for disease prediction and \ndrug Recommendation.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Poppins-Regular',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Introducing our new app that utilizes machine learning to predict potential diseases and recommend appropriate medications based on user symptoms.. Stay informed and take control of your health with our user-friendly and reliable app.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Poppins-Regular',
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PredictionScreen();
                  }));
                },
                child: Container(
                  height: 54,
                  width: 295,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 0, 146, 102),
                      borderRadius: BorderRadius.circular(30)),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontFamily: 'Poppins-Regular',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
