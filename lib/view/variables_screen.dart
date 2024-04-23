import 'package:flutter/material.dart';
import 'package:stock_scan_task/model/model.dart';

class VariableScreen extends StatelessWidget {
  final List<Criteria> criteria;

  VariableScreen({super.key, required this.criteria});

  final list = [-3, -1, -2, -5, -10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
        child: Container(
          width: double.infinity,
          color: Theme.of(context).colorScheme.onBackground,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 25),
          child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: list.length,
              itemBuilder: (ctx, innerIndex) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      list[innerIndex].toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const Divider()
                  ],
                );
              }
          ),
        ),
      ),
    );
  }
}
