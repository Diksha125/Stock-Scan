import 'package:flutter/material.dart';
import 'package:stock_scan_task/model/model.dart';
import 'package:stock_scan_task/view/variables_screen.dart';

class SubCriteria extends StatefulWidget {
  final List<Criteria> criteria;
  final StockData stockData;
  const SubCriteria(
      {super.key, required this.criteria, required this.stockData});

  @override
  State<SubCriteria> createState() => _SubCriteriaState();
}

class _SubCriteriaState extends State<SubCriteria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 50.0),
        child: Container(
          width: double.infinity,
          color: Theme.of(context).colorScheme.onBackground,
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                width: double.infinity,
                color: Colors.lightBlueAccent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.stockData.name}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.background,
                      ),
                    ),
                    Text(
                      '${widget.stockData.tag}',
                      style: TextStyle(
                          fontSize: 10,
                          color: widget.stockData.color == "green"
                              ? Colors.green
                              : Colors.red),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: widget.criteria.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return index >= 0
                        ? const Padding(
                            padding: EdgeInsets.only(
                                top: 10.0, bottom: 10.0, left: 16),
                            child: Text(
                              'and',
                              style: TextStyle(
                                fontSize: 8,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : const SizedBox();
                  },
                  itemBuilder: (context, index) {
                    final Criteria data = widget.criteria[index];
                    return InkWell(
                      onTap: () {
                        if(widget.criteria[index].variable!.isEmpty != true) {
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VariableScreen(
                              criteria: widget.criteria,
                            ),
                          ),
                        );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          data.text.toString(),
                          style: const TextStyle(
                            fontSize: 10.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
