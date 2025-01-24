import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

  void _updateMood(String mood) {
    setState(() {
      _selectedMood = mood;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double emojiSize = screenHeight * 0.08;

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: moodMessages.keys.map((mood) {
                  return GestureDetector(
                    onTap: () => _updateMood(mood),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        mood,
                        style: TextStyle(fontSize: emojiSize),
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 30),
              if (_selectedMood.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Modun: $_selectedMood',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      moodMessages[_selectedMood]!,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
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
      drawer: const Drawer(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(),
              Text("İLETİŞİM", style: TextStyle(fontSize: 18)),
              Divider(),
              Text("Rabiya Tanbaş"),
              Divider(),
              Text("rabiyatanbas@gmail.com"),
              Divider(),
              Text("+905308406837"),
              Divider(),
              Text("https://github.com/ramiko2"),
            ],
          ),
        ),
      ),
    );
  }
}
