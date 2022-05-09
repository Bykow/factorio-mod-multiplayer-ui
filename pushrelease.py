#!/bin/python

import sys
import os
import requests
import shutil
import zipfile
import json
from os import getenv

MOD_PORTAL_URL = "https://mods.factorio.com"
INIT_UPLOAD_URL = f"{MOD_PORTAL_URL}/api/v2/mods/releases/init_upload"

# Variables and dir to exclude from archive
apikey = getenv("MOD_UPLOAD_API_KEY")
modname = "multiplayer-ui"
moddir = "multiplayer-ui"
excludelist = [".github", ".gitignore", ".git", "pushrelease.py"]

# Read version from info.json
f = open(os.path.join(os.getcwd(), moddir, 'info.json'))
infojson = json.load(f)
version = infojson['version']

# Construct filename ex: multiplayer-ui_0.2.1.zip
filename = modname + "_" + version + ".zip"

# Create temp dir with content to be zipped
source_dir = os.path.join(os.getcwd())
destination_dir = os.path.join(os.getcwd(), moddir)

if os.path.isdir(destination_dir):
    shutil.rmtree(destination_dir)

shutil.copytree(source_dir, destination_dir)

# Zip without excluded files and dirs
zf = zipfile.ZipFile(filename, "w")
for dirname, subdirs, files in os.walk(moddir):
    for excludeitem in excludelist:
        if excludeitem in subdirs:
            subdirs.remove(excludeitem)
        elif excludeitem in files:
            files.remove(excludeitem)
    zf.write(dirname)
    for filename in files:
        zf.write(os.path.join(dirname, filename))
zf.close()

# Remove temp folder
shutil.rmtree(destination_dir)

# Push release to portal
# request_body = data = {"mod": modname}
# request_headers = {"Authorization": f"Bearer {apikey}"}

# response = requests.post(
#     INIT_UPLOAD_URL,
#     data=request_body,
#     headers=request_headers)

# if not response.ok:
#     print(f"init_upload failed: {response.text}")
#     sys.exit(1)

# upload_url = response.json()["upload_url"]

# with open(filename, "rb") as f:
#     request_body = {"file": f}
#     response = requests.post(upload_url, files=request_body)

# if not response.ok:
#     print(f"upload failed: {response.text}")
#     sys.exit(1)

# print(f"upload successful: {response.text}")
