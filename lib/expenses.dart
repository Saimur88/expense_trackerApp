import 'package:flutter/material.dart';
import 'models/expense.dart';
class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {

  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter Course',
        amount: 19.99,
        category: Category.work,
        date: DateTime.now()),
    Expense(
        title: 'Cinema',
        amount: 15.69,
        category: Category.leisure,
        date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("The Chart"),
          Text("Expenses.....")
        ],
      ),
    );
  }
}
