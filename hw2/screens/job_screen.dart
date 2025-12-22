import 'package:flutter/material.dart';
import '../models/user_profile.dart';
import 'card_screen.dart';

class JobScreen extends StatelessWidget {
  final String name;

  const JobScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    TextEditingController jobController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Card App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("สวัสดีคุณ: $name"),
            const Text("กรุณากรอกอาชีพ:"),
            
            TextField(controller: jobController),
            
            const SizedBox(height: 20),
            
            ElevatedButton(
              onPressed: () {
                UserProfile myProfile = UserProfile(name: name, job: jobController.text);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CardScreen(data: myProfile),
                  ),
                );
              },
              child: const Text("สร้างนามบัตร"),
            )
          ],
        ),
      ),
    );
  }
}