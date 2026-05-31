import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pulse_brief/app.dart';

void main() {
  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  testWidgets('PulseBrief renders the home dashboard', (WidgetTester tester) async {
    await tester.pumpWidget(const PulseBriefApp());
    await tester.pump();

    expect(find.text('PulseBrief'), findsOneWidget);
    expect(find.text('Smart news, beautifully organized.'), findsOneWidget);

    await tester.pumpWidget(const SizedBox.shrink());
  });
}
