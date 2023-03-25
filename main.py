from flask import Flask, request, jsonify
import joblib
import pandas as pd

app = Flask(__name__)

model = joblib.load('disease_prediction_model.pkl')
df = pd.read_csv('drugsComTrain_raw.tsv', sep='\t')


@app.route('/index')
def index():
    return 'Hey Sabari!!'


@app.route('/get_data', methods=['POST'])
def get_data():
    data = request.get_json(force=True)
    name = data['name']
    desc = data['desc']
    data_return = {'name': name, 'desc': desc}
    return data_return


def top_drug_recommender(condition):
    df_top = df[(df['rating'] >= 9) & (df['usefulCount'] >= 100)].sort_values(by=['rating', 'usefulCount'],
                                                                              ascending=[False, False])
    drug_list = df_top[df_top['condition'] == condition]['drugName'].head(3).tolist()
    return drug_list


@app.route('/predict_disease', methods=['POST'])
def predict_disease():
    data = request.get_json(force=True)
    text = data['text']
    prediction = model.predict([text])
    drugs = top_drug_recommender(prediction[0])
    return jsonify(disease=prediction[0],
                   drug_list=drugs)


if __name__ == '__main__':
    app.run(debug=True, port=4000)
