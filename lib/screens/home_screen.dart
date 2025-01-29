import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:happypulse/widgets/bottom_navigation_bar_widget.dart';

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
          '../assets/logoo.png',
          height: 40,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
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
                'Regl döngüsü kadın yaşamında doğal bir süreçtir. Regl dönemi takvimi bu sürecin genel seyrini takip etmek adına önemlidir. Adet hesaplama ise hem menstrüasyon sağlığı hem de hamilelik ihtimali açısından kadınların sıklıkla başvurduğu yöntemler arasında bulunur. Regl döngüsünün normal seyrinin dışına çıkması vücutta bazı sorunların varlığına işaret edebilir. Bu nedenle adet takvimi takibi kadınların özen göstermesi gereken durumlardan biridir. Regl günlerini hesaplayarak regl döngüsünün sağlıklı bir şekilde ilerleyip ilerlemediğini anlayabilir ve olası hamilelik durumlarında gebelik ihtimalini erkenden öğrenebilirsin. Bunun için adet hesaplama araçlarından yardım alabilir ve sana özel bir hesaplama takvimi oluşturarak regl olduğun tarihleri takvime not alabilirsin. Peki, regl nedir, kaç günde bir regl olunur ve regl tarihi nasıl hesaplanır? İşte regl konusunda merak ettiğin tüm detaylar…\n\nREGL DÖNGÜSÜ NEDİR, KAÇ GÜNDE BİR REGL OLUNUR?\nKadınlardaki üreme sistemi yumurtalıklardan salgılanan hormonlar tarafından yönetilir. Her sağlıklı kadın, ortalama 28 günde bir söz konusu hormonların etkisiyle regl döngüsü yaşar. Rahmin iç yüzeyini oluşturan endometrium tabakası her ay olası bir gebeliğe hazırlık için kalınlaşmaya başlar ve kan damarları ile kaplanır. Bir gebelik durumu oluşmaması halinde ise bu tabaka bir sonraki aya hazırlanabilmek açısından ilgili dönemin sonunda dökülmeye başlar. Endometrium tabakası kan damarları ile dolu olması nedeniyle yenilenme sürecinde bir miktar kanamaya neden olur. İşte, bu kanama durumu regl olarak adlandırılır. Normal şartlar altında kadınlar, rutin regl semptomları ile birlikte her ay 21 ila 35 gün arasında değişen uzunluklarda regl döngüsü yaşar. Bu rutinin dışında meydana gelen ara kanamalar veya aşırı kanama durumları ise adet düzensizliği olarak isimlendirilebilir.\n\nREGL HESAPLAMA NASIL YAPILIR?\nRegl günü hesaplama yöntemi kadınların sağlıklı menstrüasyon döngüsü açısından önem taşır. Çünkü pek çok kadın, vücutta meydana gelen değişimler sebebiyle yaşamında bu döneme göre planlamalar yapabilir. Adet hesaplama yöntemi ile regl kanamalarının ne zaman başlayacağını ve ne zaman biteceğini bilmek; yolculuklar, tatil planlamaları ve önemli işleri halletmek açısından kadınlara avantaj sağlar. Söz konusu hesaplama tekniği hamile kalmayı düşünen kadınlar için de son derece önemli bir unsurdur. Adet döngüsü hesaplama sayesinde regl sürecinin ne zaman başlayacağını ve sonlanacağını öğrenmenin yanında yumurtlama günleri de rahatlıkla hesaplanabilir. Böylece yumurtlama dönemine uygun tarihlerde cinsel ilişkiye girmek ve hamile kalma ihtimalini yükseltmek mümkün olur.',
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
                accountName: Text("Hoşgeldiniz"),
                accountEmail: Text("rabiyatanbas@gmail.com"),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.home),
                title: Text('Ana Sayfa'),
                onTap: () {
                  context.go('/home');
                },
              ),
              ListTile(
                leading: Icon(CupertinoIcons.calendar_today),
                title: Text('Takvim'),
                onTap: () {
                  context.go('/calendar');
                },
              ),
              ListTile(
                leading: Icon(CupertinoIcons.smiley),
                title: Text('Ruh Hali'),
                onTap: () {
                  context.go('/mood');
                },
              ),
              Spacer(),
              Divider(),
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
