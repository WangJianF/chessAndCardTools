#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os, shutil

needPvr = True
needPng = False

assetsDir = "./assets"
targetDir = "./target"
pvrcczDir = os.path.join(targetDir, "pvrccz")
pngDir = os.path.join(targetDir, "png")
pvrcczCmdStr = "TexturePacker --format cocos2d --size-constraints NPOT --texture-format pvr2ccz --data %s.plist --sheet %s.pvr.ccz %s"
pngCmdStr = "TexturePacker --format cocos2d --size-constraints NPOT --data %s.plist --sheet %s.png %s"

if os.path.exists(targetDir):
	shutil.rmtree(targetDir)

for x in os.listdir(assetsDir):
	fileName = os.path.join(assetsDir, x)
	if needPvr:
		pvrDirName = os.path.join(pvrcczDir, x)
		pvrName = os.path.join(pvrDirName, x)
		os.system(pvrcczCmdStr %(pvrName, pvrName, fileName))

	if needPng:
		pngDirName = os.path.join(pngDir, x)
		pngName = os.path.join(pngDirName, x)
		os.system(pngCmdStr %(pngName, pngName, fileName))