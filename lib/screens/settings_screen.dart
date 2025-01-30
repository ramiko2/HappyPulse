import 'package:flutter/material.dart';
import 'package:happypulse/core/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key); // Const constructor ekledim

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Ayarlar', style: theme.textTheme.titleLarge), // Güncellendi
        backgroundColor: colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hesap Ayarları',
              style: theme.textTheme.titleMedium?.copyWith( // Güncellendi
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            ListTile(
              leading: Icon(Icons.person, color: colorScheme.onSurface),
              title: Text(
                'Kullanıcı Adı',
                style: theme.textTheme.bodyLarge?.copyWith( // Güncellendi
                  color: colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'misafir27',
                style: theme.textTheme.bodyMedium?.copyWith( // Güncellendi
                  color: colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
              onTap: () {
                // Kullanıcı adı değiştirme işlemi
              },
            ),
            Divider(color: colorScheme.secondary),
            Text(
              'Uygulama Ayarları',
              style: theme.textTheme.titleMedium?.copyWith( // Güncellendi
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            SwitchListTile(
              title: Text(
                'Koyu Tema',
                style: theme.textTheme.bodyLarge?.copyWith( // Güncellendi
                  color: colorScheme.onSurface,
                ),
              ),
              value: false,
              onChanged: (bool value) {
                // Tema değiştirme işlemi
              },
              activeColor: colorScheme.primary,
            ),
            ListTile(
              leading: Icon(Icons.notifications, color: colorScheme.onSurface),
              title: Text(
                'Bildirimler',
                style: theme.textTheme.bodyLarge?.copyWith( // Güncellendi
                  color: colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Bildirim ayarlarınızı yönetin',
                style: theme.textTheme.bodyMedium?.copyWith( // Güncellendi
                  color: colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
              onTap: () {
                // Bildirim ayarlarına gitme işlemi
              },
            ),
            Divider(color: colorScheme.secondary),
            Text(
              'Diğer',
              style: theme.textTheme.titleMedium?.copyWith( // Güncellendi
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            ListTile(
              leading: Icon(Icons.help, color: colorScheme.onSurface),
              title: Text(
                'Yardım ve Destek',
                style: theme.textTheme.bodyLarge?.copyWith( // Güncellendi
                  color: colorScheme.onSurface,
                ),
              ),
              onTap: () {
                // Yardım ve destek sayfasına gitme işlemi
              },
            ),
            ListTile(
              leading: Icon(Icons.info, color: colorScheme.onSurface),
              title: Text(
                'Hakkında',
                style: theme.textTheme.bodyLarge?.copyWith( // Güncellendi
                  color: colorScheme.onSurface,
                ),
              ),
              onTap: () {
                // Hakkında sayfasına gitme işlemi
              },
            ),
          ],
        ),
      ),
    );
  }
}
