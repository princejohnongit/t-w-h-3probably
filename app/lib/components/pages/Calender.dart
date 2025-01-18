import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  late Map<DateTime, List<dynamic>> _events;
  late List<dynamic> _selectedEvents;

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _events = {};
    _selectedEvents = [];
  }

  @override
  void dispose() {
    // No need to dispose _calendarFormat
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedEvents = _events[selectedDay] ?? [];
    });
  }

  void _addEvent() {
    DateTime selectedDay = DateTime.now(); // Replace with actual selected day logic
    if (_events[selectedDay] != null) {
      _events[selectedDay]?.add('New Event');
    } else {
      _events[selectedDay] = ['New Event'];
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Column(
        children: <Widget>[
          TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime(2000),
            lastDay: DateTime(2100),
            calendarFormat: _calendarFormat,
            eventLoader: (day) => _events[day] ?? [],
            onDaySelected: (selectedDay, focusedDay) => _onDaySelected(selectedDay, focusedDay),
          ),
          ..._selectedEvents.map((event) => ListTile(
                title: Text(event),
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addEvent,
        child: Icon(Icons.add),
      ),
    );
  }
}