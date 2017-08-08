# To install the Python client library:
# pip install -U selenium

# Import the Selenium 2 namespace (aka "webdriver")
import fileinput
import glob
import string
import sys
import os
import argparse
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import Select

import base64
from binascii import hexlify
import getpass
import os
import select
import socket
import sys
import time
import traceback
import pxssh
import getpass
import re

parser = argparse.ArgumentParser()
parser.add_argument("-u", "--user", help="Phabricator username")
parser.add_argument("-p", "--password", help="Phabricator password")
parser.add_argument("-d", "--dir", help="Directory where code reviews will be saved")
parser.add_argument("-f", "--filename", help="Filename of review list")
parser.add_argument("-s", "--suffix", help="Suffix of all PDFs")

try:
	args = parser.parse_args()
	if not (args.user):# or args.password or args.dir or args.filename):
		parser.print_help()
		sys.exit(2)

	if not (args.password):# or args.password or args.dir or args.filename):
		parser.print_help()
		sys.exit(2)

	if not (args.dir):# or args.password or args.dir or args.filename):
		parser.print_help()
		sys.exit(2)

	if not (args.filename):# or args.password or args.dir or args.filename):
		parser.print_help()
		sys.exit(2)
except Exception as e:
	print(e)
	parser.print_help()
	sys.exit(2)

#######################################################################
phabricatorURL = "dynomite.sncorp.smith-nephew.com/"
phabricatorUserName = args.user
phabricatorUserPassword = args.password
# Path to save PDF
destinationPath = args.dir + "/"
filenamePath = args.filename

print("Username :" + phabricatorUserName)
#print("Password :" + phabricatorUserPassword)
print("Destination Path :" + destinationPath)
print("Filename Path :" + filenamePath)

fileSuffix = ""
if args.suffix:
	fileSuffix = args.suffix
	print("Suffix :" + fileSuffix)
###################################################################
# generate a list of all the reviews in the file
with open(filenamePath) as f:
    content = f.readlines()
# you may also want to remove whitespace characters like `\n` at the end of each line
content = [x.strip() for x in content] 

r = re.compile(".*" + phabricatorURL + "*")
reviewURLList = filter(r.match, content)

#print(reviewURLList)

# Google Chrome
driverPDF = webdriver.PhantomJS('phantomjs', service_args=[
                                '--ignore-ssl-errors=true'])

def runPDFScript(script, args):
    driverPDF.execute('executePhantomScript', {
                      'script': script, 'args': args})

def replace_all(text, dic):
    for i, j in dic.iteritems():
        text = text.replace(i, j)
    return text

# hack while the python interface lags
driverPDF.command_executor._commands['executePhantomScript'] = (
    'POST', '/session/$sessionId/phantom/execute')

def logInPhabricator(driver):
        # ------------------------------
        # Go to phabricator
    driver.get('https://' + phabricatorURL + '')
    # print(driverPDF.title)
    # Enter credentials
    elementUser = driver.find_element_by_name("username")
    elementUser.send_keys(phabricatorUserName)
    elementPass = driver.find_element_by_name("password")
    elementPass.send_keys(phabricatorUserPassword)

    # Submit the form!
    submit_button = driver.find_element_by_name('__submit__')
    submit_button.click()

logInPhabricator(driverPDF)

# Generate the review document list

for review in reviewURLList:
    reviewSplit = review.split("/")
    reviewID = reviewSplit[len(reviewSplit) - 1]
    reviewFileName = destinationPath + "CodeReview-" + reviewID + ".pdf"
    reviewURL = review.split("/")
    print("Saving code review " + reviewURL[len(reviewURL) -1] + " to " + reviewFileName)
    reviewURL = "https://" + phabricatorURL + reviewURL[len(reviewURL) -1];
    print("Getting URL: " + reviewURL)
    driverPDF.get(reviewURL)
    WebDriverWait(driverPDF, 30)
    time.sleep(10) 
    # print(driverPDF.title)
    # WebDriverWait(driverPDF, 20).until(EC.presence_of_element_located((By.NAME,"__submit__")))
    el = driverPDF.find_element_by_name('__submit__')

  # seconds
    #<button type="submit" name="__submit__">Submit</button>
    # set page format
    # inside the execution script, webpage is "this"
    pageFormat = '''this.paperSize = {format: "A4", orientation: "portrait" };'''
    runPDFScript(pageFormat, [])
    # render current page
    render = 'this.render("{file_name}")'.format(
        file_name=reviewFileName)
    runPDFScript(render, [])

# Close the browser!
driverPDF.quit()

