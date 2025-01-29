// bottom_navigation_bar_widget.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
