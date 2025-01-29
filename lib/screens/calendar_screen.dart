import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:happypulse/widgets/bottom_navigation_bar_widget.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late DateTime selectedDay;
  late DateTime focusedDay;

  @override
  void initState() {
    super.initState();
    selectedDay = DateTime.now();
    focusedDay = DateTime.now();
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      selectedDay = day;
      this.focusedDay = focusedDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

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
            firstDay: DateTime(now.year, now.month, 1), // Bu ayın ilk günü
            lastDay: DateTime(now.year, now.month + 1, 0), // Bu ayın son günü
            focusedDay: focusedDay,
            selectedDayPredicate: (day) => isSameDay(selectedDay, day),
            onDaySelected: _onDaySelected,
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.purple,
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleTextStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.purple, // Ay başlığı kırmızı
              ),
            ),
          ),
          // Diğer içerikler burada
        ],
      ),
<<<<<<< HEAD
      bottomNavigationBar: const BottomNavigationBarWidget(),
=======
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
>>>>>>> 8671fbf9d52603c2800aa7cb4fd38f47f3dc1421
    );
  }
}
