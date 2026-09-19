import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_multi_screen_app/app.dart';

void main() {
  testWidgets('Campus Services app test', (WidgetTester tester) async {
    await tester.pumpWidget(const CampusServicesApp());

    expect(find.text('Campus Services'), findsOneWidget);
  });
}