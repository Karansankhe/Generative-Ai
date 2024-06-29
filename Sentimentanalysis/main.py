from flask import Flask, request, jsonify
from textblob import TextBlob

app = Flask(__name__)

def get_sentiment(text):
    blob = TextBlob(text)
    sentiment_score = blob.sentiment.polarity
    if sentiment_score < -0.5:
        return "very negative"
    elif sentiment_score < 0:
        return "negative"
    elif sentiment_score == 0:
        return "neutral"
    elif sentiment_score <= 0.5:
        return "positive"
    else:
        return "very positive"

@app.route('/sentiment', methods=['POST'])
def analyze_sentiment():
    data = request.json
    
    # Check if request.json is None or if 'text' key is missing or empty
    if not data or 'text' not in data or not data['text']:
        return jsonify({"error": "Invalid JSON data or missing 'text' field."}), 400

    user_input = data['text']
    sentiment = get_sentiment(user_input)
    
    response = {
        "text": user_input,
        "sentiment": sentiment
    }
    return jsonify(response)

if __name__ == '__main__':
    app.run(debug=True)
