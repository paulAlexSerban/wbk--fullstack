from datetime import datetime

import time

from utils import setup_driver, clean_text, navigate_to_home_page, scrape_main_page_heading, scrape_temperature, navigate_to_login_page, login, logout, write_to_file

URL = "https://automated.pythonanywhere.com"
USERNAME = "automated"
PASSWORD = "automatedautomated"

def main():
    scraped_data = {}
    driver = setup_driver()
    while True:
        time.sleep(2)  # Allow time for the page to load
        date = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        navigate_to_home_page(driver, URL)
        main_page_heading = scrape_main_page_heading(driver)
        current_temperature = scrape_temperature(driver)

        navigate_to_login_page(driver)
        login(driver, USERNAME, PASSWORD)
        navigate_to_home_page(driver, URL)
        logout(driver)
        time.sleep(2)  # Allow time for the page to load after logout


        write_to_file(data={
            "date": date,
            "main_page_heading": main_page_heading,
            "current_temperature": current_temperature
        }, filename=f"scraped_data_{date}.txt")





if __name__ == "__main__":
    main()
