import 'package:expance_tracker/Widgets/chart/chart.dart';
import 'package:expance_tracker/Widgets/expanses_list/expanse_list.dart';
import 'package:expance_tracker/Widgets/new_expanse.dart';
import 'package:expance_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expanse> _registeredExpanses = [
    Expanse(
        title: "Flutter Course ",
        amount: 19.99,
        date: DateTime.now(),
        category: Category.Work),
    Expanse(
        title: "Cenima ",
        amount: 15.34,
        date: DateTime.now(),
        category: Category.Leisure)
  ];
  // ignore: non_constant_identifier_names
  void _OpenAddModelOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpanse(onAddExpense: _addExapance),
    );
  }

  void _addExapance(Expanse expanse) {
    setState(() {
      _registeredExpanses.add(expanse);
    });
  }

  void _removeExpance(Expanse expanse) {
    final expanceIndex = _registeredExpanses.indexOf(expanse);
    setState(() {
      _registeredExpanses.remove(expanse);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Expance Deleted'),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registeredExpanses.insert(expanceIndex, expanse);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent =
        const Center(child: Text("the list is Empty , add some!"));
    if (_registeredExpanses.isNotEmpty) {
      mainContent = ExpansesList(
          expanses: _registeredExpanses, onRemoveExpance: _removeExpance);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Expanse Tracker "),
        actions: [
          IconButton(
              onPressed: _OpenAddModelOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpanses),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
