import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertest/json_placeholder_model.dart';
import 'package:fluttertest/json_placeholder_service.dart';
import 'package:fluttertest/main.dart';
import 'package:mocktail/mocktail.dart';

class MockJsonPlaceholderService extends Mock
    implements JsonPlaceholderService {}

void main() {
  final mockJsonPlaceholderService = MockJsonPlaceholderService();

  testWidgets('Should display api text on button click',
      (WidgetTester tester) async {
    // Given
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MyApp(client: mockJsonPlaceholderService),
    );

    // When
    // Stub http request
    final json = {
      "userId": 1,
      "id": 1,
      "title": "delectus aut autem",
      "completed": false
    };
    final response = JsonPlaceholderModel.fromJson(json);
    when(() => mockJsonPlaceholderService.getPlaceholder())
        .thenAnswer((_) async => response);

    // Click the button
    final button = find.byType(ElevatedButton);
    expect(button, findsOneWidget);
    await tester.tap(button);
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 2));

    // Then
    verify(() => mockJsonPlaceholderService.getPlaceholder()).called(1);
    expect(find.text('delectus aut autem'), findsOneWidget);
  });
}
