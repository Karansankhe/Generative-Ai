from dotenv import load_dotenv
load_dotenv()

import os
import streamlit as st
from PIL import Image
import google.generativeai as genai

genai.configure(api_key=os.getenv("GOOGLE_API_KEY"))

# Function to load gemini pro model to get responses
model = genai.GenerativeModel("gemini-pro-vision")

def get_gemini_response(input, image, prompt):
    model = genai.GenerativeModel('gemini-pro-vision')
    response = model.generate_content([input, image[0], prompt])
    return response.text

def input_image_setup(uploaded_files):
    # Check if files have been uploaded
    image_parts = []
    for uploaded_file in uploaded_files:
        bytes_data = uploaded_file.getvalue()
        image_parts.append({
            "mime_type": uploaded_file.type,
            "data": bytes_data
        })
    return image_parts

# Initialize our Streamlit app
st.set_page_config(page_title="Gemini Image Demo")

st.header("Gemini Application")
input_text = st.text_input("Input Prompt: ", key="input")
uploaded_files = st.file_uploader("Choose images...", type=["jpg", "jpeg", "png"], accept_multiple_files=True)

if uploaded_files:
    for uploaded_file in uploaded_files:
        image = Image.open(uploaded_file)
        st.image(image, caption="Uploaded Image.", use_column_width=True)

submit = st.button("Tell me about the images")

input_prompt = """
               You are an expert in understanding invoices.
               You will receive input images as invoices &
               you will have to answer questions based on the input image.
               """

# If the submit button is clicked
if submit:
    if uploaded_files:
        image_data = input_image_setup(uploaded_files)
        responses = [get_gemini_response(input_text, [img], input_prompt) for img in image_data]
        
        st.subheader("The Responses are")
        for idx, response in enumerate(responses):
            st.write(f"Response for Image {idx + 1}:")
            st.write(response)
    else:
        st.error("Please upload at least one image.")
