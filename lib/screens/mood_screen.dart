import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:happypulse/widgets/bottom_navigation_bar_widget.dart';

class MoodScreen extends StatefulWidget {
  const MoodScreen({super.key});

  @override
  State<MoodScreen> createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen> {
  String _selectedMood = '';

  final Map<String, String> moodMessages = {
    '😀': 'İyi hissediyorsun! Harika! Günü en iyi şekilde geçir!',
    '😊': 'Mutlusun! Keyfini çıkar ve etrafındaki insanlara ilham ver!',
    '😎': 'Kendine güveniyorsun! Bugün her şeyi başarabilirsin!',
    '😢': 'Hüzünlü hissediyorsun. Biraz dinlenmek iyi olabilir.',
    '😡': 'Sinirli hissediyorsun. Derin bir nefes al ve rahatla.',
    '😌': 'Huzurlusun. Kendine biraz zaman ayır ve rahatla.',
  };

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double emojiSize = screenHeight * 0.12; // Emoji boyutunu ayarlama

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          '../assets/logoo.png',
          height: 40,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: moodMessages.keys.map((mood) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Text(
                      mood,
                      style: TextStyle(fontSize: emojiSize),
                    ),
                    const SizedBox(width: 10),
                    // Expanded widget, metnin taşmasını engelleyecek şekilde yer kaplamayı sağlar.
                    Expanded(
                      child: Text(
                        moodMessages[mood]!,
                        style: const TextStyle(fontSize: 14), // Daha küçük yazı boyutu
                        overflow: TextOverflow.ellipsis, // Taşan metni kesmek için
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
<<<<<<< HEAD
              );
            }).toList(),
=======
              if (_selectedMood.isEmpty)
                Text(
                  'Bir mod seçin!',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
            ],
          ),
        ),
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
>>>>>>> 8671fbf9d52603c2800aa7cb4fd38f47f3dc1421
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
