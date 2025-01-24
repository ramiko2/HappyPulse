import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HappyPulse"),
        //leading: Icon(Icons.water_drop, size: 40.0, color: Colors.red),
        actions: [
          Icon(Icons.water_drop, size: 40.0, color: Colors.red),
        ],
      ),
      body: Center(
        child: Text("Ana Sayfa"),
      ),
      bottomNavigationBar: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.home),
            Icon(Icons.calendar_today),
            Icon(Icons.mood),
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}
