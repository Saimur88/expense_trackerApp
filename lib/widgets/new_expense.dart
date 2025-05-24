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
  Category _selectedCategory = Category.leisure;

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

  void _submitExpenseData(){
  final enteredAmount = double.tryParse(_amountController.text);
  final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if(_titleController.text.trim().isEmpty || amountIsInvalid || _selectedDate == null){
      showDialog(
          context: context, 
          builder: (ctx) => AlertDialog(
            title: Text('Invalid Input'),
            content: const Text('Please make sure a valid title, amount, date was entered.'),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(ctx);
                  },
                  child:const Text('Okay'))
            ],
          ),);
      return;
      
    }
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
        const SizedBox(height: 16,),
        Row(
          children: [
            DropdownButton(
              value: _selectedCategory,
                items: Category.values
                    .map(
                    (category) => DropdownMenuItem(
                      value: category,
                      child: Text(
                        category.name.toUpperCase(),
                      ),
                    ),
                    ).toList(),

                onChanged: (value){
                  if(value == null){
                    return;
                  }
                 setState(() {
                   _selectedCategory = value;
                 });

                }
                ),
           const Spacer(),
           TextButton(
               onPressed: (){
                 Navigator.pop(context);
               },
               child: Text('Cancel')),
            ElevatedButton(
                onPressed: _submitExpenseData,
                child: Text("Save Expense"))
          ],
        )
        
      ],
    ),
    );
    

}
}
