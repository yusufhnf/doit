import 'package:flutter/material.dart';

class InfoContainerWidget extends StatelessWidget {
  const InfoContainerWidget(
      {Key? key, required this.label, required this.count})
      : super(key: key);
  final String label;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$count",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
