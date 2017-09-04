#!/usr/bin/env python
# -*- coding: utf-8 -*-

import json, hashlib, os, shutil, zipfile, datetime

assetsDir = "./assets"
targetDir = "target_test"
targetTab = {}
tab = {}
tab["packageUrl"] = "http://www.baidu.com/" + targetDir
tab["remoteManifestUrl"] = tab["packageUrl"] + "/project.manifest"
tab["remoteVersionUrl"] = tab["packageUrl"] + "/version.manifest"
tab["version"] = "1"
tab["minVersion"] = "0"
tab["androidUrl"] = ""
tab["iosUrl"] = ""
tab["engineVersion"] = "cocos2d-x-3.11.1"

def travelDir(path):
	for x in os.listdir(path):
		fileName = os.path.join(path, x)
		if os.path.isdir(fileName):
			travelDir(fileName)
		elif os.path.isfile(fileName):
			travelCb(fileName)

def checkInvalidFile(file):
	if file.find(" ") == -1:
		return False
	elif file.find("  ") == -1:
		return False
	elif all(u'\u4e00' <= char <= u'\u9fff' for char in file):
		return False
	return True

def travelCb(file):
	fileName = os.path.relpath(file, assetsDir)
	fileName = fileName.replace('\\', '/')
	targetTab[fileName] = {}
	targetTab[fileName]["md5"] = hashlib.md5(file).hexdigest()
	targetTab[fileName]["size"] = os.path.getsize(file)


if os.path.exists(targetDir):
	shutil.rmtree(targetDir)
shutil.copytree(assetsDir, targetDir)

travelDir(assetsDir)

file = open(os.path.join(targetDir, "version.manifest"), "w")
file.write(json.dumps(tab, sort_keys=True, indent=4, separators=(',', ': ')))
file.close()

tab["assets"] = targetTab
tab["searchPaths"] = {}
file = open(os.path.join(targetDir, "project.manifest"), "w")
file.write(json.dumps(tab, sort_keys=True, indent=4, separators=(',', ': ')))
file.close()

zipName = "%s_%s.zip" %(targetDir, datetime.datetime.now().strftime('%Y%m%d%H%M%S'))
file = zipfile.ZipFile(zipName, "w", zipfile.ZIP_DEFLATED)
for dirpath, dirnames, filenames in os.walk(targetDir):
	for filename in filenames:
		file.write(os.path.join(dirpath, filename))
file.close()