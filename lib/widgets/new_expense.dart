import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {

  final _titleController = TextEditingController();
  final _amountController =  TextEditingController();
  DateTime? _selectedDate;

  @override
  void disposeTitle() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  void disposeAmount() {
    _amountController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final lastDate = DateTime(now.year + 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: lastDate);
    setState(() {
      _selectedDate = pickedDate;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(16),
    child: Column(
      children: [
        TextField(
          controller: _titleController,
          maxLength: 50,
          decoration: const InputDecoration(
            label: Text("Title")
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefixText: '\$ ',
                    label: Text("Amount")
                ),
              ),
            ),
            SizedBox(width:  16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(_selectedDate == null ? 'No Date Selected'
                    : formatter.format(_selectedDate!) ),
                IconButton(
                    onPressed: _presentDatePicker,
                    icon: Icon(Icons.calendar_month))
              ],
            )
          ],
        ),
        Row(
          children: [
            DropdownButton(
                items: Category.values
                    .map(
                    (category) => DropdownMenuItem(
                      value: category,
                      child: Text(
                        category.name.toString(),
                      ),
                    ),
                    ).toList(),

                onChanged: (value){
                  print(value);

                }
                ),
           TextButton(
               onPressed: (){
                 Navigator.pop(context);
               },
               child: Text('Cancel')),
            ElevatedButton(
                onPressed: (){
                  print(_titleController.text);
                  print(_amountController.text);
                },
                child: Text("Save Expense"))
          ],
        )
        
      ],
    ),
    );
    

}
}
