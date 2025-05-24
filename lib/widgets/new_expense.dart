import 'package:flutter/material.dart';
class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {

  final _titleController = TextEditingController();
  final _amountController =  TextEditingController();

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

  void _presentDatePicker(){
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final lastDate = DateTime(now.year + 1, now.month, now.day);
    showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: lastDate);
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
                const Text('Select Date'),
                IconButton(
                    onPressed: _presentDatePicker,
                    icon: Icon(Icons.calendar_month))
              ],
            )
          ],
        ),
        Row(
          children: [
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
