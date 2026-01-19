// นำเข้า Material UI ของ Flutter (ปุ่ม, TextField, AppBar ฯลฯ)
import 'package:flutter/material.dart';

// ฟังก์ชัน main เป็นจุดเริ่มต้นของแอป
void main() {
  // runApp ใช้เปิดแอป และรับ Widget ตัวแรกเข้าไป
  runApp(const MyApp());
}

// MyApp เป็น Widget หลักของแอป
// StatelessWidget = ไม่มีข้อมูลที่เปลี่ยนแปลง
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp เป็นโครงหลักของแอปแบบ Material Design
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // ซ่อนแถบ Debug มุมขวาบน
      home: TodoPage(), // หน้าแรกของแอป คือ TodoPage
    );
  }
}

// TodoPage เป็นหน้า To-do list
// ต้องใช้ StatefulWidget เพราะข้อมูลมีการเปลี่ยน (เพิ่ม/ลบ/แก้)
class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

// _TodoPageState คือคลาสที่เก็บ "สถานะ" ของ TodoPage
class _TodoPageState extends State<TodoPage> {

  // List สำหรับเก็บรายการ To-do ทั้งหมด
  List<String> todos = [];

  // controller ใช้ดึงข้อความจาก TextField
  TextEditingController controller = TextEditingController();

  // ------------------------
  // ฟังก์ชันเพิ่ม To-do
  // ------------------------
  void addTodo() {
    // เช็กว่ามีข้อความก่อนเพิ่ม
    if (controller.text.isNotEmpty) {
      setState(() {
        // เพิ่มข้อความเข้าไปใน List
        todos.add(controller.text);

        // ล้างข้อความใน TextField
        controller.clear();
      });
    }
  }

  // ------------------------
  // ฟังก์ชันลบ To-do
  // ------------------------
  void deleteTodo(int index) {
    setState(() {
      // ลบรายการตามตำแหน่ง index
      todos.removeAt(index);
    });
  }

  // ------------------------
  // ฟังก์ชันแก้ไข To-do
  // ------------------------
  void editTodo(int index) {
    // สร้าง controller ใหม่สำหรับ Dialog
    // ใส่ข้อความเดิมลงไปก่อน
    TextEditingController editController = TextEditingController(
      text: todos[index],
    );

    // showDialog ใช้เปิดหน้าต่าง Popup
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('แก้ไข To-do'),

          // ช่องกรอกข้อความสำหรับแก้ไข
          content: TextField(
            controller: editController,
            autofocus: true, // เปิด Dialog แล้วโฟกัสทันที
          ),

          // ปุ่มด้านล่างของ Dialog
          actions: [
            // ปุ่มยกเลิก
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('ยกเลิก'),
            ),

            // ปุ่มบันทึก
            TextButton(
              onPressed: () {
                setState(() {
                  // เอาข้อความใหม่มาแทนของเดิม
                  todos[index] = editController.text;
                });

                // ปิด Dialog
                Navigator.pop(context);
              },
              child: const Text('บันทึก'),
            ),
          ],
        );
      },
    );
  }

  // ------------------------
  // ส่วนแสดงหน้าจอ
  // ------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // แถบด้านบนของแอป
      appBar: AppBar(
        title: const Text('To-do List'),
      ),

      // เนื้อหาหลักของหน้า
      body: Column(
        children: [

          // ------------------------
          // แถวเพิ่ม To-do
          // ------------------------
          Padding(
            padding: const EdgeInsets.all(8.0), // เว้นขอบรอบ ๆ
            child: Row(
              children: [
                // ช่องกรอกข้อความ
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'เพิ่มงานที่ต้องทำ',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                // ปุ่มเพิ่ม
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: addTodo,
                ),
              ],
            ),
          ),

          // ------------------------
          // แสดงรายการ To-do
          // ------------------------
          Expanded(
            child: ListView.builder(
              itemCount: todos.length, // จำนวนรายการ
              itemBuilder: (context, index) {
                return ListTile(
                  // ข้อความ To-do
                  title: Text(todos[index]),

                  // ปุ่มด้านขวา (แก้ไข + ลบ)
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // ปุ่มแก้ไข
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => editTodo(index),
                      ),

                      // ปุ่มลบ
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => deleteTodo(index),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
