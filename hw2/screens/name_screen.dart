import 'package:flutter/material.dart';
import 'job_screen.dart';

class NameScreen extends StatelessWidget {
  const NameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Card App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("กรุณากรอกชื่อ:"),
            
            TextField(controller: nameController),
            
            const SizedBox(height: 20),
            
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JobScreen(name: nameController.text),
                  ),
                );
              },
              child: const Text("ถัดไป"),
            )
          ],
        ),
      ),
    );
  }
}