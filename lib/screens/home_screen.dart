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
        title: Image.asset(
          '../assets/logo.png', // Burada logo yolunu belirtmelisiniz.
          height: 50, // Logonun yüksekliğini ayarlayabilirsiniz.
        ),
        backgroundColor: Colors.white, // AppBar arka plan rengi
        elevation: 0, // AppBar'ın altındaki gölgeyi kaldırabilirsiniz
      ),
      body: Center(
        child: Text("Ana Sayfa"),
      ),
      bottomNavigationBar: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                context.go('/home');
              },
            ),
            IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () {
                context.go('/calendar');
              },
            ),
            IconButton(
              icon: Icon(Icons.mood),
              onPressed: () {},
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
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
    );
  }
}
