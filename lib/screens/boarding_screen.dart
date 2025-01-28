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
              'assets/happypulse.png',  // Resmin doğru yolunu kontrol edin
              width: 450,
              height: 600,
            ),
            const SizedBox(height: 40),
            // Burada sadece "Giriş Yap" butonuna tıklanacak
            TextButton(
              onPressed: () {
                context.go('/login');  // Giriş yap butonuna tıklanınca Login sayfasına yönlendir
              },
              child: Text(
                'Giriş Yap',
                style: TextStyle(color: Colors.purple), // Metin rengi
              ),
            ),
          ],
        ),
      ),
    );
  }
}
