import 'package:flutter/material.dart';
import 'package:stock_scan_task/controller/repo.dart';
import 'package:stock_scan_task/model/model.dart';
import 'package:stock_scan_task/view/sub_criteria_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiRepository apiRepository = ApiRepository();
  StockData stockData = StockData();

  @override
  void initState() {
    apiRepository.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
        child: FutureBuilder<List<StockData>>(
          future: apiRepository.fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final List<StockData>? stockData = snapshot.data;
              return stockData != null
                  ? Container(
                      width: double.infinity,
                      color: Theme.of(context).colorScheme.onBackground,
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 25),
                      child: ListView.builder(
                        itemCount: stockData.length,
                        itemBuilder: (context, index) {
                          final StockData data = stockData[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SubCriteria(
                                    criteria: data.criteria!,
                                    stockData: data,
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.name.toString(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                  ),
                                ),
                                Text(
                                  data.tag.toString(),
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: data.color == "green"
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                ),
                                const Divider()
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  : const Center(child: Text('No data available'));
            }
          },
        ),
      ),
    );
  }
}
