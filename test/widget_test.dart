import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stock_scan_task/controller/repo.dart';
import 'package:stock_scan_task/model/model.dart';
import 'package:stock_scan_task/view/home.dart';

class MockApiRepository extends Mock implements ApiRepository {}

void main() {
  group('MyHomePage Widget Test', () {
    late MockApiRepository mockApiRepository;

    setUp(() {
      mockApiRepository = MockApiRepository();
    });

    testWidgets('Loading State', (WidgetTester tester) async {
      when(mockApiRepository.fetchData()).thenAnswer((_) async => []);

      await tester.pumpWidget(const MaterialApp(home: MyHomePage()));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Error State', (WidgetTester tester) async {
      final error = 'Error fetching data';
      when(mockApiRepository.fetchData()).thenThrow(error);

      await tester.pumpWidget(MaterialApp(home: MyHomePage()));

      expect(find.text('Error: $error'), findsOneWidget);
    });

    testWidgets('Loaded State', (WidgetTester tester) async {
      final stockData = [
        StockData(
            name: 'Top gainers',
            tag: 'Intraday buying seen in last 15 minutes',
            color: 'green',
            criteria: []),
        StockData(
            name: 'Stock B',
            tag: 'Intraday buying seen in last 15 minutes',
            color: 'green',
            criteria: []),
      ];
      when(mockApiRepository.fetchData()).thenAnswer((_) async => stockData);

      await tester.pumpWidget(const MaterialApp(home: MyHomePage()));

      expect(find.text('Top gainers'), findsOneWidget);
      expect(find.text('Stock B'), findsOneWidget);
    });
  });
}
