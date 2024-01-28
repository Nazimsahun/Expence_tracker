import 'package:expance_tracker/Widgets/expanses_list/expanse_item.dart';
import 'package:expance_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpansesList extends StatelessWidget {
  const ExpansesList(
      {required this.onRemoveExpance, required this.expanses, super.key});
  final void Function(Expanse expanse) onRemoveExpance;
  final List<Expanse> expanses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expanses.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: Theme.of(context).cardTheme.margin,
        ),
        key: ValueKey(expanses[index]),
        child: ExpanseItem(expanses[index]),
        onDismissed: (direction) {
          onRemoveExpance(expanses[index]);
        },
      ),
    );
  }
}
