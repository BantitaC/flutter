import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      home: const TikTokProfilePage(),
    );
  }
}

class TikTokProfilePage extends StatelessWidget {
  const TikTokProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios, color: Colors.black),
        centerTitle: true,
        actions: const [
           Icon(Icons.notifications_none_outlined, color: Colors.black),
           SizedBox(width: 15),
           Icon(Icons.share_outlined, color: Colors.black),
           SizedBox(width: 15)
        ],
      ),

      body: Column(
        children: [
          profileHeader(),

          const SizedBox(height: 10),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Icon(Icons.grid_on, color: Colors.black),
                  SizedBox(height: 5),
                  SizedBox(width: 40, height: 2, child: ColoredBox(color: Colors.black))
                ],
              ),
              Icon(Icons.lock_outline, color: Colors.grey),
              Icon(Icons.bookmark_border, color: Colors.grey),
              Icon(Icons.favorite_border, color: Colors.grey),
            ],
          ),
          
          const SizedBox(height: 2),

          Row(
            children: [
              Expanded(child: Container(height: 150, color: Colors.grey[300])),
              const SizedBox(width: 2),
              Expanded(child: Container(height: 150, color: Colors.grey[300])),
              const SizedBox(width: 2),
              Expanded(child: Container(height: 150, color: Colors.grey[300])),
            ],
          ),
        ],
      ),
    );
  }

  Widget profileHeader() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              width: 100, height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 10),
        const Text("titkokname", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 8),
        
        // สถิติ
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(children: [Text("0", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), Text("กำลังติดตาม", style: TextStyle(color: Colors.grey, fontSize: 12))]),
            SizedBox(width: 20),
            Column(children: [Text("0", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), Text("ผู้ติดตาม", style: TextStyle(color: Colors.grey, fontSize: 12))]),
            SizedBox(width: 20),
            Column(children: [Text("0", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), Text("ถูกใจ", style: TextStyle(color: Colors.grey, fontSize: 12))]),
          ],
        ),
        
        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120, height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(4)),
              child: const Text("ติดตาม", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),

            const SizedBox(width: 8),

            Container(
              width: 100, height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(4)),
              child: const Text("ข้อความ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        // ------------------------------------------

        const SizedBox(height: 10),
      ],
    );
  }
}