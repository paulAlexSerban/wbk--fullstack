from datetime import datetime
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import time

from utils import clean_text, navigate_to_home_page, scrape_main_page_heading, scrape_temperature, navigate_to_login_page, login, logout, write_to_file

URL = "https://automated.pythonanywhere.com"
USERNAME = "automated"
PASSWORD = "automatedautomated"

scraped_data = {}

def setup_driver():
    options = webdriver.ChromeOptions()
    options.add_argument("disable-infobars")
    options.add_argument("start-maximized")
    options.add_argument("disable-dev-shm-usage")
    options.add_argument("no-sandbox")
    options.add_experimental_option("excludeSwitches", ["enable-automation"])
    options.add_argument("disable-blink-features=AutomationControlled")
    service = Service(ChromeDriverManager().install())
    driver = webdriver.Chrome(service=service, options=options)
    driver.get(URL)
    return driver





def main():
    driver = setup_driver()
    while True:
        try:
            time.sleep(2)  # Allow time for the page to load
            date = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            navigate_to_home_page(driver, URL)
            main_page_heading = scrape_main_page_heading(driver)
            current_temperature = scrape_temperature(driver)

            navigate_to_login_page(driver)
            login(driver, USERNAME, PASSWORD)
            navigate_to_home_page(driver, URL)
            logout(driver)

            scraped_data = {
                "date": date,
                "main_page_heading": main_page_heading,
                "current_temperature": current_temperature
            }

            write_to_file(data=scraped_data, filename=f"scraped_data_{date}.txt")
        except Exception as e:
            print(f"An error occurred: {e}")
            break
        finally:
            driver.quit()


if __name__ == "__main__":
    main()
