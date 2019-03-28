# -*- coding: utf-8 -*-
import os
import requests
from bs4 import BeautifulSoup
from selenium import webdriver
from pyvirtualdisplay import Display


# We use PyVirtualDisplay (a Python wrapper for Xvfb) 
# to run headless WebDriver tests.
display = Display(visible=0, size=(800, 600))
display.start()


# URLs can be shortened URLs 
url = 'http://kcy.me/wge8'
print url
req = requests.get(url)
print req.url
 
 
soup = BeautifulSoup(req.text, 'lxml')
print soup.title.string.encode('utf-8')
print soup.findAll(attrs={"name":"description"})[0]['content'].encode('utf-8')


driver = webdriver.Firefox()
driver.get(req.url)
fname = os.path.join(os.path.dirname(__file__), 'screenshot2.png')

# Capture a sreenshot or the URL
driver.get_screenshot_as_file(fname)

# Closing down
driver.close()
display.stop()
