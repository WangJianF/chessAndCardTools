# autoCocosManifestTool
* 生成cocos2d-x热更新manifest文件
* assets放入资源文件，如src,res等
* 然后运行autoManifest.py
* 对应的资源将被拷贝到targetDir目录下，同时生成project.manifest及version.manifest文件
* 请在autoManifest.py中修改tab.packageUrl为你的服务器地址,tab["version"]为版本号,targetDir为更新目录
