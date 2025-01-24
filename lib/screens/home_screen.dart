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
      bottomNavigationBar: Container(
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
      ),
      drawer: const Drawer(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(),
              Text("İLETİŞİM", style: TextStyle(fontSize: 18)),
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
      ),
    );
  }
}
