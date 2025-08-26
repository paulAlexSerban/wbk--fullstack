import requests
from urllib.parse import urljoin, urlparse, parse_qs
import os
import re
import time
from PyPDF2 import PdfMerger
import tempfile

def download_pdf(url, output_filename="downloaded_file.pdf"):
    """
    Download PDF from Romanian Official Monitor with proper headers and session handling
    """
    
    # Create a session to handle cookies
    session = requests.Session()
    
    # Set headers to mimic a real browser
    headers = {
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        'Accept': 'application/pdf,text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7',
        'Accept-Language': 'en-US,en;q=0.9,ro;q=0.8',
        'Accept-Encoding': 'gzip, deflate, br',
        'DNT': '1',
        'Connection': 'keep-alive',
        'Upgrade-Insecure-Requests': '1',
        'Sec-Fetch-Dest': 'document',
        'Sec-Fetch-Mode': 'navigate',
        'Sec-Fetch-Site': 'none',
        'Sec-Fetch-User': '?1',
        'Cache-Control': 'no-cache',
        'Referer': 'https://monitoruloficial.ro/',
    }
    
    session.headers.update(headers)
    
    try:
        # First, try to access the main site to get any necessary cookies
        print("Getting session cookies from main site...")
        main_response = session.get("https://monitoruloficial.ro/", timeout=30)
        print(f"Main site status: {main_response.status_code}")
        
        # Add a small delay
        time.sleep(2)
        
        # Try different URL variations
        url_variations = [
            url,
            url.replace('showmo/services/', ''),
            url.replace('view.php', 'download.php'),
            url.replace('&format=pdf', ''),
            url + '&download=1',
            url + '&direct=1'
        ]
        
        for i, test_url in enumerate(url_variations):
            print(f"\n--- Trying URL variation {i+1}: {test_url} ---")
            
            response = session.get(test_url, timeout=30, allow_redirects=True)
            
            print(f"Status Code: {response.status_code}")
            print(f"Final URL: {response.url}")
            print(f"Content-Type: {response.headers.get('Content-Type', 'Not specified')}")
            print(f"Content-Length: {response.headers.get('Content-Length', 'Not specified')}")
            print(f"Content-Disposition: {response.headers.get('Content-Disposition', 'Not specified')}")
            
            # Check if we got HTML instead of PDF
            content_type = response.headers.get('Content-Type', '').lower()
            
            if 'text/html' in content_type:
                print("⚠️  Received HTML instead of PDF!")
                
                # Check if this is the homepage redirect
                if 'monitoruloficial.ro' in response.url and len(response.text) > 50000:
                    print("This appears to be a redirect to the homepage")
                    continue
                
                # Save HTML for inspection only for the first attempt
                if i == 0:
                    with open(f"response_debug_{i}.html", "w", encoding="utf-8") as f:
                        f.write(response.text)
                    print(f"HTML response saved to 'response_debug_{i}.html' for inspection")
                
                # Look for PDF links in the HTML
                pdf_patterns = [
                    r'href=["\']([^"\']*\.pdf[^"\']*)["\']',
                    r'href=["\']([^"\']*format=pdf[^"\']*)["\']',
                    r'href=["\']([^"\']*download[^"\']*pdf[^"\']*)["\']',
                    r'src=["\']([^"\']*\.pdf[^"\']*)["\']'
                ]
                
                found_pdfs = []
                for pattern in pdf_patterns:
                    matches = re.findall(pattern, response.text, re.IGNORECASE)
                    found_pdfs.extend(matches)
                
                if found_pdfs:
                    print(f"Found {len(found_pdfs)} potential PDF links:")
                    for j, link in enumerate(found_pdfs[:5]):  # Show first 5
                        full_url = urljoin(response.url, link)
                        print(f"  {j+1}. {full_url}")
                    
                    # Try the first PDF link found
                    if found_pdfs:
                        pdf_url = urljoin(response.url, found_pdfs[0])
                        print(f"\nTrying first PDF link: {pdf_url}")
                        pdf_response = session.get(pdf_url, timeout=30)
                        
                        if pdf_response.headers.get('Content-Type', '').lower().startswith('application/pdf') or \
                           pdf_response.content.startswith(b'%PDF'):
                            print("✅ Found PDF via HTML parsing!")
                            with open(output_filename, "wb") as f:
                                f.write(pdf_response.content)
                            file_size = len(pdf_response.content)
                            print(f"PDF saved as '{output_filename}' ({file_size:,} bytes)")
                            return True
                
                continue
                
            elif 'application/pdf' in content_type or response.content.startswith(b'%PDF'):
                print("✅ PDF content detected!")
                
                # Save the PDF
                with open(output_filename, "wb") as f:
                    f.write(response.content)
                
                file_size = len(response.content)
                print(f"PDF saved as '{output_filename}' ({file_size:,} bytes)")
                return True
                
            else:
                print(f"⚠️  Unexpected content type: {content_type}")
                
                # Save first 1000 bytes for inspection
                with open(f"response_sample_{i}.bin", "wb") as f:
                    f.write(response.content[:1000])
                print(f"Sample saved to 'response_sample_{i}.bin'")
                continue
        
        print("❌ None of the URL variations returned a PDF")
        return False
            
    except requests.exceptions.Timeout:
        print("❌ Request timed out")
        return False
    except requests.exceptions.RequestException as e:
        print(f"❌ Request failed: {e}")
        return False

def download_pdf_page(url, page_num, output_filename="downloaded_page.pdf"):
    """
    Download a single PDF page from Romanian Official Monitor
    """
    
    # Create a session to handle cookies
    session = requests.Session()
    
    # Set headers to mimic a real browser
    headers = {
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        'Accept': 'application/pdf,text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7',
        'Accept-Language': 'en-US,en;q=0.9,ro;q=0.8',
        'Accept-Encoding': 'gzip, deflate, br',
        'DNT': '1',
        'Connection': 'keep-alive',
        'Upgrade-Insecure-Requests': '1',
        'Sec-Fetch-Dest': 'document',
        'Sec-Fetch-Mode': 'navigate',
        'Sec-Fetch-Site': 'none',
        'Sec-Fetch-User': '?1',
        'Cache-Control': 'no-cache',
        'Referer': 'https://monitoruloficial.ro/',
    }
    
    session.headers.update(headers)
    
    try:
        # Modify URL to include the specific page number
        parsed = urlparse(url)
        params = parse_qs(parsed.query)
        params['page'] = [str(page_num)]
        
        # Reconstruct URL with new page parameter
        new_query = '&'.join([f"{k}={v[0]}" for k, v in params.items()])
        page_url = f"{parsed.scheme}://{parsed.netloc}{parsed.path}?{new_query}"
        
        print(f"Attempting to download page {page_num} from: {page_url}")
        
        response = session.get(page_url, timeout=30, allow_redirects=True)
        
        print(f"Page {page_num} - Status Code: {response.status_code}")
        print(f"Page {page_num} - Content-Type: {response.headers.get('Content-Type', 'Not specified')}")
        
        # Check if we got HTML instead of PDF
        content_type = response.headers.get('Content-Type', '').lower()
        
        if 'text/html' in content_type:
            print(f"⚠️  Page {page_num}: Received HTML instead of PDF!")
            
            # Check if this is the homepage redirect (page doesn't exist)
            if 'monitoruloficial.ro' in response.url and len(response.text) > 50000:
                print(f"Page {page_num} appears to redirect to homepage - likely doesn't exist")
                return False
            
            return False
            
        elif 'application/pdf' in content_type or response.content.startswith(b'%PDF'):
            print(f"✅ Page {page_num}: PDF content detected!")
            
            # Save the PDF page
            with open(output_filename, "wb") as f:
                f.write(response.content)
            
            file_size = len(response.content)
            print(f"Page {page_num} saved as '{output_filename}' ({file_size:,} bytes)")
            return True
            
        else:
            print(f"⚠️  Page {page_num}: Unexpected content type: {content_type}")
            return False
            
    except requests.exceptions.Timeout:
        print(f"❌ Page {page_num}: Request timed out")
        return False
    except requests.exceptions.RequestException as e:
        print(f"❌ Page {page_num}: Request failed: {e}")
        return False

def download_all_pages(base_url, max_pages=32, output_filename="complete_monitor.pdf"):
    """
    Download all pages from 1 to max_pages and concatenate them into a single PDF
    """
    
    print(f"=== Downloading pages 1-{max_pages} ===\n")
    
    # Create temporary directory for individual page PDFs
    temp_dir = tempfile.mkdtemp()
    downloaded_pages = []
    
    try:
        # Download each page
        for page_num in range(1, max_pages + 1):
            print(f"\n--- Downloading page {page_num}/{max_pages} ---")
            
            temp_filename = os.path.join(temp_dir, f"page_{page_num:02d}.pdf")
            
            success = download_pdf_page(base_url, page_num, temp_filename)
            
            if success:
                downloaded_pages.append(temp_filename)
                print(f"✅ Page {page_num} downloaded successfully")
            else:
                print(f"❌ Page {page_num} failed to download")
                
                # If we fail to get a page, check if we've reached the end
                if page_num > 1:
                    print(f"Assuming page {page_num} doesn't exist - stopping here")
                    break
            
            # Add delay between requests to be respectful
            time.sleep(1)
        
        # Merge all downloaded PDFs
        if downloaded_pages:
            print(f"\n--- Merging {len(downloaded_pages)} pages into single PDF ---")
            
            merger = PdfMerger()
            
            for page_file in downloaded_pages:
                print(f"Adding {os.path.basename(page_file)} to merged PDF")
                merger.append(page_file)
            
            # Write the merged PDF
            with open(output_filename, 'wb') as output_file:
                merger.write(output_file)
            
            merger.close()
            
            print(f"✅ Successfully created merged PDF: {output_filename}")
            print(f"Total pages merged: {len(downloaded_pages)}")
            
            # Get final file size
            final_size = os.path.getsize(output_filename)
            print(f"Final PDF size: {final_size:,} bytes")
            
            return True
        else:
            print("❌ No pages were successfully downloaded")
            return False
            
    finally:
        # Clean up temporary files
        print(f"\n--- Cleaning up temporary files ---")
        for temp_file in downloaded_pages:
            try:
                os.remove(temp_file)
                print(f"Removed {os.path.basename(temp_file)}")
            except:
                pass
        
        try:
            os.rmdir(temp_dir)
            print("Removed temporary directory")
        except:
            pass

def try_alternative_pdf_urls(doc_id, subfolder, page=1):
    """
    Try different URL patterns commonly used by Romanian Official Monitor
    """
    base_patterns = [
        f"https://monitoruloficial.ro/ramo_customs/emonitor/showmo/services/view.php?doc={doc_id}&format=pdf&subfolder={subfolder}&page={page}",
        f"https://monitoruloficial.ro/ramo_customs/emonitor/showmo/view.php?doc={doc_id}&format=pdf&subfolder={subfolder}&page={page}",
        f"https://monitoruloficial.ro/emonitor/showmo/services/view.php?doc={doc_id}&format=pdf&subfolder={subfolder}&page={page}",
        f"https://monitoruloficial.ro/pdf/{subfolder}/{doc_id}.pdf",
        f"https://monitoruloficial.ro/monitorul-oficial/{subfolder}/{doc_id}.pdf",
        f"https://monitoruloficial.ro/monitorul-oficial--pi--{doc_id.replace('0520', '')}-{subfolder.split('/')[0]}.pdf",
    ]
    
    return base_patterns

def extract_url_parameters(url):
    """
    Extract parameters from the URL for alternative URL construction
    """
    parsed = urlparse(url)
    params = parse_qs(parsed.query)
    
    doc_id = params.get('doc', [''])[0]
    subfolder = params.get('subfolder', [''])[0]
    page = params.get('page', ['1'])[0]
    
    return doc_id, subfolder, page

if __name__ == "__main__":
    url = "https://monitoruloficial.ro/ramo_customs/emonitor/showmo/services/view.php?doc=0520253852&format=pdf&subfolder=5/2025/&page=1"
    
    print("=== Romanian Official Monitor PDF Downloader (All Pages) ===\n")
    
    # Try to download all pages (1-32)
    success = download_all_pages(url, max_pages=32, output_filename="monitor_oficial_complete.pdf")
    
    if not success:
        print("\n--- Trying alternative URL patterns ---")
        
        # Extract parameters from original URL
        doc_id, subfolder, page = extract_url_parameters(url)
        
        if doc_id and subfolder:
            print(f"Extracted: doc_id={doc_id}, subfolder={subfolder}")
            
            # Try alternative URL patterns
            alt_urls = try_alternative_pdf_urls(doc_id, subfolder, 1)
            
            for i, alt_url in enumerate(alt_urls):
                print(f"\n--- Trying alternative pattern {i+1} for all pages ---")
                success = download_all_pages(alt_url, max_pages=32, output_filename=f"monitor_oficial_alt_{i+1}.pdf")
                if success:
                    break
        
        if not success:
            print("\n--- Manual steps to try ---")
            print("1. Open the URL in your browser")
            print("2. Check if you can navigate through pages manually")
            print("3. The site might require login or have anti-bot protection")
            print("4. Try accessing https://monitoruloficial.ro/e-monitor/ directly")
            print("5. Install PyPDF2 if you get import errors: pip install PyPDF2")