from dotenv import load_dotenv
import os
from flask import Flask, request, jsonify
import google.generativeai as genai

# Load environment variables
load_dotenv()

# Configure the Gemini model
genai.configure(api_key=os.getenv("GOOGLE_API_KEY"))
model = genai.GenerativeModel("gemini-pro")
chat = model.start_chat(history=[])

app = Flask(__name__)

# Function to load Gemini Pro model to get responses
def get_gemini_response(question):
    prompt_template = (
        "You are an intelligent healthcare assistant bot with expertise in physical activities, dietary habits, "
        "sleep patterns, and mental health. Provide detailed, accurate, and empathetic responses to the following "
        "question. If the question is not related to these topics, respond with 'This is out of scope.'\n\n"
        "Question: {}\n"
        "Answer:"
    )

    response = model.generate_content(prompt_template.format(question), stream=True)
    full_text = ""
    for chunk in response:
        full_text += chunk.text
    return full_text

# Define categories and keywords
categories = {
    "physical_activities": ["exercise", "workout", "running", "jogging", "yoga"],
    "dietary_habits": ["diet", "nutrition", "food", "meal", "calories"],
    "sleep_patterns": ["sleep", "rest", "nap", "insomnia"],
    "mental_health": ["mental health", "meditation", "stress", "anxiety", "therapy"]
}

def is_within_scope(question):
    for category, keywords in categories.items():
        if any(keyword in question.lower() for keyword in keywords):
            return True
    return False

@app.route('/ask', methods=['POST'])
def ask_question():
    data = request.json
    question = data.get('question', '')

    if not question:
        return jsonify({"error": "No question provided"}), 400

    if is_within_scope(question):
        response = get_gemini_response(question)
    else:
        response = "This is out of scope"

    return jsonify({"question": question, "response": response})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=int(os.environ.get('PORT', 5000)))