import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  late Map<DateTime, List<String>> _events;
  late List<String> _selectedEvents;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;

    // Set random preset events
    _events = {
      DateTime.now().add(Duration(days: 5)): ['Rehab Session'],
      DateTime.now().add(Duration(days: 6)): ['Rehab Session'],
      DateTime.now().add(Duration(days: 12)): ['Rehab Session'],
      DateTime.now().add(Duration(days: 13)): ['Rehab Session'],
      DateTime(2025, 2, 20): ['Conference on Drug Prevention'],
      DateTime.now().add(Duration(days: 10)): ['Support Group Meeting'],
      DateTime.now().add(Duration(days: 17)): ['Therapy Meeting'],
    };
    // Initialize events for the selected day
    _selectedEvents = _getEventsForDay(_selectedDay!);
  }

  /// Fetches events for the selected day
  List<String> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  /// Adds an event for the selected day
  void _addEvent(String event) {
    if (_selectedDay != null) {
      if (_events[_selectedDay!] == null) {
        _events[_selectedDay!] = [];
      }
      _events[_selectedDay!]!.add(event);
      setState(() {
        // Ensure that _selectedEvents reflects the latest list of events
        _selectedEvents = _getEventsForDay(_selectedDay!);
      });
    }
  }

  /// Dialog to add an event
  void _showAddEventDialog() {
    final TextEditingController eventController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Event'),
          content: TextField(
            controller: eventController,
            decoration: const InputDecoration(hintText: 'Enter event title'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (eventController.text.isNotEmpty) {
                  _addEvent(eventController.text);
                }
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime(2000),
            lastDay: DateTime(2100),
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
                _selectedEvents = _getEventsForDay(selectedDay);
              });
            },
            eventLoader: _getEventsForDay,
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.deepPurple,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.deepOrange,
                shape: BoxShape.circle,
              ),
              markerDecoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: const HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: _selectedEvents.isNotEmpty
                ? ListView.builder(
                    itemCount: _selectedEvents.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        child: ListTile(
                          leading: const Icon(Icons.event, color: Colors.deepPurple),
                          title: Text(_selectedEvents[index]),
                        ),
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      'No events for this day.',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddEventDialog,
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add),
      ),
    );
  }
}
