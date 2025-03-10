import requests


def get_data(URL):
    try:
        response = requests.get(URL)
        response.raise_for_status()  # Raise an error for bad responses (4xx and 5xx)
        print(f"Status Code: {response.status_code}")
        print("Response JSON:")
        return response.json()
    except requests.exceptions.RequestException as error:
        print(f"API Request Failed: {error}")
        
def create_data(URL, data):
    try:
        response = requests.post(URL, json=data)
        response.raise_for_status()  # Raise an error for bad responses (4xx and 5xx)
        print(f"Status Code: {response.status_code}")
        print("Response JSON:")
        return response.json()
    except requests.exceptions.RequestException as error:
        print(f"API Request Failed: {error}")
        
def update_data(URL, data):
    try:
        response = requests.put(URL, json=data)
        response.raise_for_status()  # Raise an error for bad responses (4xx and 5xx)
        print(f"Status Code: {response.status_code}")
        print("Response JSON:")
        return response.json()
    except requests.exceptions.RequestException as error:
        print(f"API Request Failed: {error}")
        
def delete_data(URL):
    try:
        response = requests.delete(URL)
        response.raise_for_status()  # Raise an error for bad responses (4xx and 5xx)
        print(f"Status Code: {response.status_code}")
        print("Response JSON:")
        return response.json()
    except requests.exceptions.RequestException as error:
        print(f"API Request Failed: {error}")