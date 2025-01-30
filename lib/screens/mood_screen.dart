import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:happypulse/widgets/bottom_navigation_bar_widget.dart';
import 'package:happypulse/core/theme_provider.dart';

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
    double emojiSize = screenHeight * 0.12;

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          '../assets/logoo.png',
          height: 40,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
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
                    Expanded(
                      child: Text(
                        moodMessages[mood]!,
                        style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.onBackground),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
