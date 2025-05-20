import 'package:time_logger/models/time_log.dart';
import 'package:flutter/material.dart';

class TimeLogItem extends StatelessWidget {
  const TimeLogItem(this.timeLog, {super.key});
  final TimeLog timeLog;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 26,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              timeLog.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text('${timeLog.amount.toStringAsFixed(0)} minutes'),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[timeLog.category]),
                    const SizedBox(width: 16),
                    Text(timeLog.formattedDate)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
