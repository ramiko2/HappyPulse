import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:happypulse/screens/boarding_screen.dart';
import 'package:happypulse/screens/home_screen.dart';
import 'package:happypulse/screens/calendar_screen.dart';  // CalendarScreen import edin

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
          path: '/calendar',  // CalendarScreen rotası buraya eklenmiş olmalı
          builder: (context, state) => const CalendarScreen(),
        ),
      ],
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,  // GoRouter yapılandırması burada kullanılıyor
    );
  }
}
