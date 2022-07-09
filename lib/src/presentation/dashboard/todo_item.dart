import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), color: Colors.white24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cooking with mom",
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(height: 8.0),
                Text(
                  "21 December 2021 - 14.00",
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
          Checkbox(
            checkColor: Colors.black,
            value: false,
            onChanged: (value) {},
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          )
        ],
      ),
    );
  }
}
