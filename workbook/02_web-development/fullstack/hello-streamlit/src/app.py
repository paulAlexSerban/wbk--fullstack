import streamlit as st
import pandas as pd
import numpy as np

st.title('Hello Streamlit!')

st.write("Here's our first attempt at using data to create a table:")

df = pd.DataFrame({
    'first column': [1, 2, 3, 4],
    'second column': [10, 20, 30, 40]
})

st.write(df)

chart_data = pd.DataFrame(
     np.random.randn(20, 3),
     columns=['a', 'b', 'c'])

st.line_chart(chart_data)

st.title("Streamlit Text Input Example")

name = st.text_input("Enter your name")
age = st.slider("Enter your age", 0, 100, 25)

options = ["Option 1", "Option 2", "Option 3"]
option = st.selectbox("Choose any option", options)

if name:
    st.write(f"Hello {name}")
    st.write(f"You are {age} years old")
    st.write(f"You chose {option}")

uploaded_file = st.file_uploader("Choose a CSV file", type="csv")
if uploaded_file is not None:
    data = pd.read_csv(uploaded_file)
    # st.write(data)
    
    edited_data = st.data_editor(data)
    # st.write(edited_data)
    
    csv = edited_data.to_csv(index=False).encode('utf-8')
    
    st.download_button(
        label="Download CSV",
        data=csv,
        file_name="edited_data.csv",
        mime="text/csv"
    )