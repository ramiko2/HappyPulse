import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:happypulse/widgets/bottom_navigation_bar_widget.dart';
import 'package:happypulse/core/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/logoo.png',
          height: 40,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        actions: [
          Switch(
            value: themeProvider.isDark,
            onChanged: (value) {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              '../assets/dongu.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Regl döngüsü kadın yaşamında doğal bir süreçtir. Regl dönemi takvimi bu sürecin genel seyrini takip etmek adına önemlidir. '
                    'Adet hesaplama ise hem menstrüasyon sağlığı hem de hamilelik ihtimali açısından kadınların sıklıkla başvurduğu yöntemler arasında bulunur. '
                    'Regl döngüsünün normal seyrinin dışına çıkması vücutta bazı sorunların varlığına işaret edebilir. Bu nedenle adet takvimi takibi kadınların özen göstermesi gereken durumlardan biridir. '
                    '\n\nREGL DÖNGÜSÜ NEDİR, KAÇ GÜNDE BİR REGL OLUNUR?'
                    '\nKadınlardaki üreme sistemi yumurtalıklardan salgılanan hormonlar tarafından yönetilir. '
                    'Her sağlıklı kadın, ortalama 28 günde bir söz konusu hormonların etkisiyle regl döngüsü yaşar. '
                    'Normal şartlar altında kadınlar, rutin regl semptomları ile birlikte her ay 21 ila 35 gün arasında değişen uzunluklarda regl döngüsü yaşar. '
                    '\n\nREGL HESAPLAMA NASIL YAPILIR?'
                    '\nRegl günü hesaplama yöntemi kadınların sağlıklı menstrüasyon döngüsü açısından önem taşır. '
                    'Pek çok kadın, vücutta meydana gelen değişimler sebebiyle yaşamında bu döneme göre planlamalar yapabilir.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                  child: Icon(
                    CupertinoIcons.person_circle,
                    size: 50,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                accountName: const Text("Hoşgeldiniz"),
                accountEmail: const Text("rabiyatanbas@gmail.com"),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              ListTile(
                leading: const Icon(CupertinoIcons.home),
                title: const Text('Ana Sayfa'),
                onTap: () {
                  context.go('/home');
                },
              ),
              ListTile(
                leading: const Icon(CupertinoIcons.calendar_today),
                title: const Text('Takvim'),
                onTap: () {
                  context.go('/calendar');
                },
              ),
              ListTile(
                leading: const Icon(CupertinoIcons.smiley),
                title: const Text('Ruh Hali'),
                onTap: () {
                  context.go('/mood');
                },
              ),
              const Spacer(),
              const Divider(),
              TextButton(
                onPressed: () {
                  context.go('/login');
                },
                child: const Text("Çıkış Yap", style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
