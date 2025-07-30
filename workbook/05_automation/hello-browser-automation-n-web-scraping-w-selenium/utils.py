import time



def clean_text(text):
    """Extract only temperature from the text."""
    output = text.split(": ")[1]
    return output

def navigate_to_home_page(driver, url):
    """Navigate to the home page."""
    driver.get(url)
    time.sleep(2)  # Wait for the page to load
    print("Navigated to home page.")

def scrape_main_page_heading(driver):
    # Wait for the page to load and display the text
    driver.implicitly_wait(10)
    heading = driver.find_element(by="xpath", value="/html/body/div[1]/div/h1[1]")
    return heading.text

def scrape_temperature(driver):
    """Scrape the temperature from the main page."""
    driver.implicitly_wait(10)
    temperature_el = driver.find_element(by="css selector", value="#displaytimer div")
    return clean_text(temperature_el.text)

def navigate_to_login_page(driver):
    """Navigate to the login page."""
    driver.find_element(by="css selector", value="a[href='/login/']").click()
    time.sleep(2)  # Wait for the page to load
    print("Navigated to login page.")

def login(driver, username, password):
    """Log in to the website."""
    driver.find_element(by="css selector", value="#id_username").send_keys(username)
    driver.find_element(by="css selector", value="#id_password").send_keys(password)
    driver.find_element(by="css selector", value="button[type='submit']").click()
    time.sleep(2)  # Wait for login to complete
    print("Logged in successfully!")

def logout(driver):
    """Log out of the website."""
    driver.find_element(by="css selector", value="a[href='/logout/']").click()
    time.sleep(2)  # Wait for logout to complete
    print("Logged out successfully!")

def write_to_file(data, filename="scraped_data.txt"):
    """Write scraped data to a file."""
    with open(filename, "a") as file:
        file.write(f"{data}\n")
    print(f"Data written to {filename}")
    return filename