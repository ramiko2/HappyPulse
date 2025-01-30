import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:happypulse/screens/boarding_screen.dart';
import 'package:happypulse/screens/home_screen.dart';
import 'package:happypulse/screens/calendar_screen.dart';
import 'package:happypulse/screens/mood_screen.dart';
import 'package:happypulse/screens/login_screen.dart';
import 'package:happypulse/core/theme_provider.dart'; // Güncellenmiş dosya yolu

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    final GoRouter router = GoRouter(
      initialLocation: '/', // Başlangıç ekranı olarak BoardingScreen yönlendirilir
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const BoardingScreen(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen(),
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
      routerConfig: router,
      theme: themeProvider.isDark ? darkTheme : lightTheme,
      themeMode: themeProvider.isDark ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
