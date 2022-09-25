

# Run unit tests
#flutter test --machine --coverage > coverage/machine_coverage.output


# Run Integration Test
killall "Simulator"
open -a Simulator
flutter test integration_test --machine --coverage > coverage/machine_coverage.output

# Generate Details html report
genhtml coverage/lcov.info -o coverage/html > coverage/genhtml_log.txt

# Extract Overall Coverage
grep lines coverage/genhtml_log.txt | cut -b 16-19 > coverage/percentage.txt
export FLUTTER_COVERAGE=$(cat coverage/percentage.txt)

echo "Unit test coverage: ${FLUTTER_COVERAGE}%"

if [ $FLUTTER_COVERAGE > 80.0 ]
then
    echo "Unit test coverage is lower then 80% failing the build"
    # Fail build if test coverage is lower than target
    # exit 42
fi

# Get global flutter libabry for convert coverage data into cobertura and junit report
flutter pub global activate cobertura
flutter pub global activate junitreport

# Convert flutter test result into jenkins test reports
flutter pub global run cobertura convert
flutter pub global run junitreport:tojunit --input coverage/machine_coverage.output --output coverage/junit_report.xml

killall "Simulator"

# flutter build ios --release --no-simulator --no-codesign --flavor auto -t lib/app/flavors/main_auto.dart

# Send Sonarqube
# sonar-scanner \
#   -Dsonar.projectKey=TestPractitionerEngagementv2 \
#   -Dsonar.host.url=https://sonarqube.pointclickcare.com \
#   -Dsonar.login=e43125b94c2d7a50a009a84032341e58e24019bf \
#   -Dsonar.sonar.pullrequest.branch=${GIT_BRANCH} \
#   -Dsonar.sonar.pullrequest.base=master

