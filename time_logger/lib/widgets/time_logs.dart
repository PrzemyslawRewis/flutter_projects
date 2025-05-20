import 'package:time_logger/models/time_log.dart';
import 'package:time_logger/widgets/chart/chart.dart';
import 'package:time_logger/widgets/new_time_log.dart';
import 'package:flutter/material.dart';
import 'package:time_logger/widgets/time_logs_list/time_logs_list.dart';

class TimeLogs extends StatefulWidget {
  const TimeLogs({super.key});

  @override
  State<TimeLogs> createState() {
    return _TimeLogsState();
  }
}

class _TimeLogsState extends State<TimeLogs> {
  final List<TimeLog> _savedTimeLogs = [
    TimeLog(
        title: "Java course",
        amount: 20,
        date: DateTime.now(),
        category: Category.learning),
    TimeLog(
        title: "Swimming",
        amount: 2,
        date: DateTime.now(),
        category: Category.exercise),
  ];

  void _openLogTimeOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewTimeLog(_logTime),
    );
  }

  void _logTime(TimeLog log) {
    setState(() {
      _savedTimeLogs.add(log);
    });
  }

  void _removeTimeLog(TimeLog log) {
    final timeLogIndex = _savedTimeLogs.indexOf(log);
    setState(() {
      _savedTimeLogs.remove(log);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 4),
        content: const Text('Time log deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _savedTimeLogs.insert(timeLogIndex, log);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = const Center(
      child: Text('No time logged.'),
    );
    if (_savedTimeLogs.isNotEmpty) {
      mainContent = TimeLogsList(
        timeLogsList: _savedTimeLogs,
        onRemoveTimeLog: _removeTimeLog,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Time tracker"),
      ),
      body: width < 1000
          ? Column(children: [
              Chart(timeLogs: _savedTimeLogs),
              Expanded(
                child: mainContent,
              ),
            ])
          : Row(children: [
              Expanded(
                child: Chart(timeLogs: _savedTimeLogs),
              ),
              Expanded(
                child: mainContent,
              ),
            ]),
      floatingActionButton: FloatingActionButton(
        onPressed: _openLogTimeOverlay,
        child: const Icon(Icons.add),
      ),
    );
  }
}
