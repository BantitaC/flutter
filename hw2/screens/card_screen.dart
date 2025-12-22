import 'package:flutter/material.dart';
import '../models/user_profile.dart';

class CardScreen extends StatelessWidget {
  final UserProfile data;

  const CardScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("หน้า 3")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 200,
              color: Colors.green, 
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("ชื่อ: ${data.name}", style: const TextStyle(fontSize: 20)),
                  Text("อาชีพ: ${data.job}", style: const TextStyle(fontSize: 20)),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text("เริ่มใหม่"),
            ),
          ],
        ),
      ),
    );
  }
}