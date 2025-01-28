import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:go_router/go_router.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late Map<DateTime, List<Event>> selectedEvents;
  late DateTime selectedDay;
  late DateTime focusedDay;

  @override
  void initState() {
    super.initState();
    selectedDay = DateTime.now();
    focusedDay = DateTime.now();
    selectedEvents = {};
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      selectedDay = day;
      this.focusedDay = focusedDay;
    });
  }

  List<Event> _getEventsForDay(DateTime day) {
    return selectedEvents[day] ?? [];
  }

  void _addEvent() {
    showDialog(
      context: context,
      builder: (context) {
        String eventTitle = '';
        return AlertDialog(
          title: const Text('Yeni Etkinlik Ekle'),
          content: TextField(
            onChanged: (value) {
              eventTitle = value;
            },
            decoration: const InputDecoration(hintText: 'Etkinlik Başlığı'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (eventTitle.isNotEmpty) {
                  setState(() {
                    if (selectedEvents[selectedDay] == null) {
                      selectedEvents[selectedDay] = [];
                    }
                    selectedEvents[selectedDay]?.add(Event(eventTitle));
                  });
                }
                Navigator.of(context).pop();
              },
              child: const Text('Ekle'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('İptal'),
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
        title: Image.asset(
          'assets/logoo.png',
          height: 40,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 01, 01),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: focusedDay,
            selectedDayPredicate: (day) => isSameDay(selectedDay, day),
            onDaySelected: _onDaySelected,
            eventLoader: _getEventsForDay,
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.redAccent,
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleTextStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
              leftChevronIcon: const Icon(
                Icons.arrow_left,
                color: Colors.pink,
              ),
              rightChevronIcon: const Icon(
                Icons.arrow_right,
                color: Colors.pink,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: _getEventsForDay(selectedDay)
                  .map((event) => ListTile(
                title: Text(event.title),
              ))
                  .toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                context.go('/home');
              },
            ),
            IconButton(
              icon: const Icon(Icons.calendar_today),
              onPressed: () {
                context.go('/calendar');
              },
            ),
            IconButton(
              icon: const Icon(Icons.mood),
              onPressed: () {
                context.go('/mood');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addEvent,
        backgroundColor: Colors.grey,
        child: const Icon(Icons.add),
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(),
              TextButton(
                onPressed: () {
                  context.go('/home');
                },
                child: const Text("Ana Sayfa", style: TextStyle(fontSize: 18)),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  context.go('/calendar');
                },
                child: const Text("Takvim", style: TextStyle(fontSize: 18)),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  context.go('/mood');
                },
                child: const Text("Duygu Durumu", style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Event {
  final String title;

  Event(this.title);
}
