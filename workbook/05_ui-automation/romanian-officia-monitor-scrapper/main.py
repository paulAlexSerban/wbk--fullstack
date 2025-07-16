import time
import datetime
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException
from webdriver_manager.chrome import ChromeDriverManager


search_term = "puzzles"


def setup_driver():
    options = webdriver.ChromeOptions()
    options.add_argument("disable-infobars")
    options.add_argument("start-maximized")
    options.add_argument("disable-dev-shm-usage")
    options.add_argument("no-sandbox")
    options.add_experimental_option("excludeSwitches", ["enable-automation"])
    options.add_argument("disable-blink-features=AutomationControlled")
    service = Service(ChromeDriverManager().install())
    return webdriver.Chrome(service=service, options=options)


driver = setup_driver()
wait = WebDriverWait(driver, 20)

driver.get("https://monitoruloficial.ro/e-monitor")
dates = [
    "07/07/2025 3:00:00",
    "08/07/2025 3:00:00",
    "09/07/2025 3:00:00",
    "10/07/2025 3:00:00",
    "11/07/2025 3:00:00",
    "14/07/2025 3:00:00",
    "15/07/2025 3:00:00",
    "16/07/2025 3:00:00",
]

findings = {}


def convert_date_to_timestamp(date_str):
    """Convert DD/MM/YYYY to timestamp format"""
    try:
        date_obj = datetime.datetime.strptime(date_str, "%d/%m/%Y %H:%M:%S")
        timestamp = int(date_obj.timestamp() * 1000)
        return str(timestamp)
    except ValueError as e:
        print(f"Error converting date {date_str}: {e}")
        return None


def search_search_term_in_tab(window_handle, tab_url):
    """Search for search_term in a specific tab"""
    try:
        driver.switch_to.window(window_handle)
        print(f"Switched to tab: {tab_url}")
        time.sleep(3)

        print("Looking for toolbar in tab...")
        wait.until(
            EC.presence_of_element_located((By.ID, "toolbar_documentViewer"))
        )
        print("Toolbar found!")

        search_input = wait.until(
            EC.presence_of_element_located(
                (By.XPATH, '//*[@id="toolbar_documentViewer"]/input[3]')
            )
        )

        search_input.clear()
        search_input.send_keys(search_term)
        print(f"Successfully entered search_term: {search_term}")

        search_input.send_keys(Keys.RETURN)
        print("Pressed Enter to search")

        time.sleep(2)


        try:
            search_results = driver.find_elements(
                By.CSS_SELECTOR, ".flowpaper_searchabstract_result"
            )
        except Exception as e:
            print(f"? Could not determine search results for {tab_url}: {e}")
            return False

        if search_results:
            print(f"✓ search_term '{search_term}' found in {tab_url}")
            findings[tab_url] = {
                "search_term": search_term,
                "results": [result.text for result in search_results],
            }
            print(findings)
            print("Closing browser...")
            driver.quit()
            return True
        else:
            print(f"✗ search_term '{search_term}' not found in {tab_url}")
            return False
    except TimeoutException:
        print(f"Timeout: Could not find search elements in {tab_url}")
        return False
    except (KeyError, AttributeError, ValueError) as e:
        print(f"Error searching in {tab_url}: {e}")
        return False
        return False


def select_calendar_date(timestamp):
    date_element = wait.until(
        EC.element_to_be_clickable((By.CSS_SELECTOR, f'td[data-date="{timestamp}"]'))
    )
    date_element.click()
    print(f"Clicked date with timestamp: {timestamp}")


def main():
    converted_dates = []
    for date in dates:
        converted_timestamp = convert_date_to_timestamp(date)
        if converted_timestamp:
            converted_dates.append(converted_timestamp)
            print(f"Date {date} converted to timestamp: {converted_timestamp}")

    print(f"Converted dates: {converted_dates}")

    try:
        for timestamp in converted_dates:
            select_calendar_date(timestamp)
            doc_links = wait.until(
                EC.presence_of_all_elements_located(
                    (
                        By.CSS_SELECTOR,
                        'a.btn.btn-outline-primary[href^="/Monitorul-Oficial--PIV--"]',
                    )
                )
            )

            if doc_links:
                print(
                    f"Found {len(doc_links)} document links for timestamp {timestamp}."
                )

                # Store original window
                original_window = driver.current_window_handle
                opened_tabs = []

                # Open all documents in new tabs
                for i in range(len(doc_links)):
                    try:
                        # Re-find the elements each time
                        current_doc_links = wait.until(
                            EC.presence_of_all_elements_located(
                                (
                                    By.CSS_SELECTOR,
                                    'a.btn.btn-outline-primary[href^="/Monitorul-Oficial--PIV--"]',
                                )
                            )
                        )

                        if i < len(current_doc_links):
                            doc_link = current_doc_links[i]
                            doc_url = doc_link.get_attribute("href")
                            print(f"Opening document {i+1}: {doc_url}")

                            # Click to open in new tab
                            doc_link.click()
                            time.sleep(1)
                            # Wait for new tab to open
                            wait.until(
                                lambda d: len(d.window_handles) > len(opened_tabs) + 1
                            )

                            # Get the new tab handle
                            all_windows = driver.window_handles
                            new_tab = [
                                w
                                for w in all_windows
                                if w != original_window and w not in opened_tabs
                            ][0]
                            opened_tabs.append(new_tab)

                            print(f"Opened tab {i+1}: {new_tab}")

                    except Exception as e:
                        print(f"Error opening document {i+1}: {e}")
                        continue

                # Now search for search_term in each opened tab
                print(
                    f"\nSearching for search_term '{search_term}' in {len(opened_tabs)} opened tabs..."
                )
                found_results = []

                for idx, tab_handle in enumerate(opened_tabs):
                    try:
                        # Get tab URL for reporting
                        driver.switch_to.window(tab_handle)
                        tab_url = driver.current_url

                        print(f"\n--- Searching in tab {idx+1}: {tab_url} ---")
                        found = search_search_term_in_tab(tab_handle, tab_url)

                        if found:
                            found_results.append(
                                {
                                    "tab": idx + 1,
                                    "url": tab_url,
                                    "window_handle": tab_handle,
                                }
                            )

                        # Optional: Close tab after search (comment out if you want to keep tabs open)
                        # driver.close()

                    except Exception as e:
                        print(f"Error processing tab {idx+1}: {e}")
                        continue

                # Switch back to original window
                driver.switch_to.window(original_window)

                # Report results
                if found_results:
                    print(
                        f"\n🎉 search_term '{search_term}' found in {len(found_results)} document(s):"
                    )
                    for result in found_results:
                        print(f"  - Tab {result['tab']}: {result['url']}")
                else:
                    print(
                        f"\n❌ search_term '{search_term}' not found in any documents for date {timestamp}"
                    )

                # Close all opened tabs
                for tab_handle in opened_tabs:
                    try:
                        driver.switch_to.window(tab_handle)
                        driver.close()
                    except:
                        pass

                # Switch back to original window
                driver.switch_to.window(original_window)

            else:
                print(f"No document links found for timestamp {timestamp}")

    except Exception as e:
        print(f"Main loop error: {e}")
    finally:
        print("Closing browser...")
        driver.quit()
    print("Script completed successfully.")
    print("Findings:", findings)


if __name__ == "__main__":
    main()
