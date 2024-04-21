import 'dart:convert';
import 'package:stock_scan_task/model/model.dart';
import 'package:http/http.dart' as http;

class ApiRepository {
  final String baseUrl = 'http://coding-assignment.bombayrunning.com/data.json';
  List<StockData> stockData = [];

  Future<List<StockData>> fetchData() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      final List<dynamic> itemList = json.decode(response.body);
      final data = itemList.map((item) => StockData.fromJson(item)).toList();

      stockData.addAll(data);

      return data;
    } catch (error) {
      throw Exception('Failed to fetch data');
    }
  }
}
