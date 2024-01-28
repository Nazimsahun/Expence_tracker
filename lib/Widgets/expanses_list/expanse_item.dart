import 'package:expance_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpanseItem extends StatelessWidget {
  const ExpanseItem(this.expanse, {super.key});
  final Expanse expanse;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expanse.title),
            Row(
              children: [
                Text('\$${expanse.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expanse.category]),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(expanse.formattedDate)
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
