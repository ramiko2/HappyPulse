import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:happypulse/screens/boarding_screen.dart';
import 'package:happypulse/screens/home_screen.dart';
import 'package:happypulse/screens/calendar_screen.dart';
import 'package:happypulse/screens/mood_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const BoardingScreen(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/calendar',
          builder: (context, state) => const CalendarScreen(),
        ),
        GoRoute(
          path: '/mood',
          builder: (context, state) => const MoodScreen(),
        ),
      ],
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
