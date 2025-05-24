import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses list/expenses_item.dart';
import '../../models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key,
  required this.expenses,
  required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx , index) => Dismissible(
        background: Container(
        margin: EdgeInsets.symmetric(
          horizontal: Theme.of(context).cardTheme.margin!.horizontal,),
          color: Theme.of(context).colorScheme.error.withValues(alpha: 0.75),
        ),
          key: ValueKey(expenses[index]),
          onDismissed: (direction){
            onRemoveExpense(expenses[index]);
          },
          child: ExpensesItem(expense: expenses[index])),

    );
  }
}
