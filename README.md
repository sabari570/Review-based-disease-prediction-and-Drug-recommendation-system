##Disease Prediction and Drug Recommendation System

This project is a mobile application that uses user reviews to predict diseases and recommend appropriate drugs. The system consists of two parts: a Flutter-based mobile application for user interaction and a Flask-based RESTful API for backend processing.

#Installation
#Flutter Mobile Application
Clone the repository

    git clone https://github.com/sabari570/Review-based-disease-prediction-and-Drug-recommendation-system.git
    Open the project in a Flutter-supported IDE (e.g., Android Studio, Visual Studio Code, etc.)

Run the following command to install dependencies:

flutter pub get
Run the application on an emulator or a physical device:

    flutter run

#Flask RESTful API

Create and activate a virtual environment:

    virtualenv venv
    source venv/bin/activate

Install dependencies:

Run the following command to start the Flask application:

python main.py


#Usage

1. Open the mobile application.
2. Enter a review of a drug.
3. Click the predict button.
4. Wait for the application to display the predicted disease and the recommended drugs.

API Endpoints
The Flask API has the following endpoints:

POST /predict_disease: This endpoint takes in a drug review as input and returns the predicted disease and recommended drugs.

#Technologies Used
Flutter
Flask
Python
Machine learning (Scikit-learn)
Natural Language Processing (NLTK)

