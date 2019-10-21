destination ?= platform=iOS Simulator,name=iPhone Xs

xcodegen:
	xcodegen

test: xcodegen
	set -o pipefail && \
	xcodebuild clean test \
	  -sdk iphoneos \
	  -destination "$(destination)" \
	  -project DemoApp.xcodeproj \
	  -scheme DemoApp \
	  -allowProvisioningUpdates \
	  -configuration Debug \
	  -derivedDataPath build \
	  | xcpretty

cc-coverage.json: build
	xcrun xccov view --json `find build/Logs/Test/ -name *.xccovreport` > cc-coverage.json

send-coverage-report-to-codeclimate: cc-coverage.json
	curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-latest-darwin-amd64 > ./cc-test-reporter
	chmod +x ./cc-test-reporter
	./cc-test-reporter format-coverage -t xccov cc-coverage.json
	./cc-test-reporter upload-coverage
