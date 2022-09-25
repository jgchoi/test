import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mobile_iam_poc/app.dart' as app;

main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('integration-test', () {
    testWidgets('Do sokmething', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(find.text('Welcome!'), findsOneWidget);
    }, tags: 'C222333');
  });
}
