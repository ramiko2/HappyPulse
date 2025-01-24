import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
          '../assets/logoo.png', // Logo dosyasının doğru yolu
          height: 40,  // Logonun yüksekliğini ayarlayabilirsiniz
        ),
        backgroundColor: Colors.white,  // AppBar'ın arka plan rengini beyaz yapıyoruz
        elevation: 0,  // AppBar altındaki gölgeyi kaldırıyoruz
      ),
      body: const Center(
        child: Text("Ana Sayfa"),
      ),
      bottomNavigationBar: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                // Ana sayfaya git
                context.go('/home');
              },
            ),
            IconButton(
              icon: const Icon(Icons.calendar_today),
              onPressed: () {
                // Takvim ekranına git
                context.go('/calendar');  // Burada doğru rota kullanılıyor
              },
            ),
            IconButton(
              icon: const Icon(Icons.mood),
              onPressed: () {
                // Mood veya başka bir işlev ekleyebilirsiniz
                print("Mood butonuna tıklandı!");
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
              Text("Rabiya Tanbaş", style: TextStyle(fontSize: 18)),
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
