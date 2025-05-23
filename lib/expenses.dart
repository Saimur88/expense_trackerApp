import 'package:expense_tracker/widgets/expenses%20list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
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

  void _openAddExpenseOverlay(){
    showModalBottomSheet(context: context,
        builder: (ctx) => NewExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay,
              icon:const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Text("The Chart"),
         Expanded(
           child: ExpensesList(
               expenses: _registeredExpenses,
           ),
         ),
        ],
      ),
    );
  }
}
