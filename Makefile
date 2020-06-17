SOURCE="https://www.ocenaudio.com/downloads/ocenaudio_debian64.deb?"
DESTINATION="build.deb"
OUTPUT="Ocenaudio.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget --output-document=$(DESTINATION) --continue $(SOURCE)
	
	dpkg -x $(DESTINATION) build
	rm -rf AppDir/application
	
	mkdir --parents AppDir/application
	cp -r build/opt/ocenaudio/* AppDir/application

	chmod +x AppDir/AppRun

	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(OUTPUT)
	chmod +x $(OUTPUT)

	#rm -f $(DESTINATION)
	#rm -rf AppDir/application
	#rm -rf build
