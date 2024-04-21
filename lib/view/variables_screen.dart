import 'package:flutter/material.dart';
import 'package:stock_scan_task/model/model.dart';

class VariableScreen extends StatefulWidget {
  final List<Criteria> criteria;
  const VariableScreen({super.key, required this.criteria});

  @override
  State<VariableScreen> createState() => _VariableScreenState();
}

class _VariableScreenState extends State<VariableScreen> {
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
            itemCount: widget.criteria.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  for (var criteria in widget.criteria)
                    ListTile(
                      title: criteria.variable!.isNotEmpty
                          ? Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: criteria.variable!.keys.map((key) {
                                  return ListView.builder(
                                      itemCount: criteria.variable![key][index],
                                      itemBuilder: (context, index) {
                                        return Expanded(
                                          child: Column(
                                            children: [
                                              Text(
                                                '$key: ${criteria.variable![key]}',
                                                style: const TextStyle(
                                                  fontSize: 10.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              const Divider(),
                                            ],
                                          ),
                                        );
                                      });
                                }).toList(),
                              ),
                          )
                          : null,
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
