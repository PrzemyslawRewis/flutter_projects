import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:time_logger/models/time_log.dart';

final formatter = DateFormat.yMd();

class NewTimeLog extends StatefulWidget {
  const NewTimeLog(this.onAddTimeLog, {super.key});

  final void Function(TimeLog log) onAddTimeLog;
  @override
  State<NewTimeLog> createState() {
    return _NewTimeLogState();
  }
}

class _NewTimeLogState extends State<NewTimeLog> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final lastDate = now;
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  _submitTimeLogData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = (enteredAmount == null || enteredAmount <= 0);
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Invalid input'),
                content: const Text(
                    'Please make sure that provided title, spent time and date is valid!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text('OK'),
                  ),
                ],
              ));
      return;
    } else {
      widget.onAddTimeLog(
        TimeLog(
            title: _titleController.text,
            amount: enteredAmount,
            date: _selectedDate!,
            category: _selectedCategory),
      );
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    
    return LayoutBuilder(
        builder: ((context, constraints) => SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(32, 96, 32, keyboardSpace + 16),
                  child: Column(
                    children: [
                        TextField(
                          controller: _titleController,
                          maxLength: 150,
                          keyboardType: TextInputType.text,
                          decoration:
                              const InputDecoration(label: Text("Title")),
                        ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _amountController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                label: Text("Time spent"),
                                prefix: Text('Minutes '),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 32,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  _selectedDate == null
                                      ? "No date selected"
                                      : formatter.format(_selectedDate!),
                                ),
                                IconButton(
                                  onPressed: _presentDatePicker,
                                  icon: const Icon(Icons.calendar_month),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
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
                                  )
                                  .toList(),
                              onChanged: (value) {
                                if (value == null) return;
                                setState(() {
                                  _selectedCategory = value;
                                });
                              }),
                          ElevatedButton(
                            onPressed: _submitTimeLogData,
                            child: const Text("Log time"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancel"),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}
