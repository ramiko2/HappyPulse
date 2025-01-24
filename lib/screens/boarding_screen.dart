import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BoardingScreen extends StatelessWidget {
  const BoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/happypulse.png', // Görselin doğru yolda olduğundan emin olun
              width: 450, // Genişlik
              height: 600, // Yükseklik
            ),
            const SizedBox(height: 40), // Görsel ile buton arası boşluk
            ElevatedButton(
              onPressed: () {
                context.go('/home'); // Butona tıklandığında home sayfasına gider
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple, // Buton rengi
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Happy Pulse',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
