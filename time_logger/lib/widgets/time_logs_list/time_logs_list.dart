import 'package:time_logger/widgets/time_logs_list/time_log_item.dart';
import 'package:flutter/material.dart';
import 'package:time_logger/models/time_log.dart';

class TimeLogsList extends StatelessWidget {
  const TimeLogsList(
      {super.key, required this.timeLogsList, required this.onRemoveTimeLog});
  final void Function(TimeLog log) onRemoveTimeLog;
  final List<TimeLog> timeLogsList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: timeLogsList.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(timeLogsList[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error,
          margin: EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal),
        ),
        onDismissed: (direction) {
          onRemoveTimeLog(timeLogsList[index]);
        },
        child: TimeLogItem(timeLogsList[index]),
      ),
    );
  }
}
