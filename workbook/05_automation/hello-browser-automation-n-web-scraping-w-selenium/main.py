from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager



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
    driver.get("https://www.paulserban.eu")
    return driver


def main():
    driver = setup_driver()
    try:
        # Wait for the page to load and display the text
        driver.implicitly_wait(10)
        element = driver.find_element(by="xpath", value="//h1/span/span[1]")
        print(element.text)
    finally:
        driver.quit()


if __name__ == "__main__":
    main()
