import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

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

  // Takvime işaretleme yapacak fonksiyon
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      selectedDay = day;
      this.focusedDay = focusedDay;
    });
  }

  // Takvime veri ekleme fonksiyonu
  List<Event> _getEventsForDay(DateTime day) {
    return selectedEvents[day] ?? [];
  }

  // Etkinlik eklemek için fonksiyon
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
          '../assets/logo.png', // Burada logo yolunu belirtmelisiniz.
          height: 50, // Logonun yüksekliğini ayarlayabilirsiniz.
        ),
        backgroundColor: Colors.white, // AppBar arka plan rengi
        elevation: 0, // AppBar'ın altındaki gölgeyi kaldırabilirsiniz
      ),
      body: Column(
        children: [
          // Takvim widget'ı
          TableCalendar(
            firstDay: DateTime.utc(2020, 01, 01),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: focusedDay,
            selectedDayPredicate: (day) => isSameDay(selectedDay, day),
            onDaySelected: _onDaySelected,
            eventLoader: _getEventsForDay,
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.pinkAccent, // Bugün günü vurgulamak için
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.redAccent, // Seçilen günün rengi
                shape: BoxShape.circle,
              ),
              outsideDecoration: BoxDecoration(
                color: Colors.transparent,
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
          // Seçilen günde gösterilecek etkinlikler
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
      floatingActionButton: FloatingActionButton(
        onPressed: _addEvent, // Etkinlik ekle butonuna tıklayınca bu fonksiyon çalışacak
        backgroundColor: Colors.pinkAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Takvimdeki her bir gün için etkinlik sınıfı
class Event {
  final String title;

  Event(this.title);
}
