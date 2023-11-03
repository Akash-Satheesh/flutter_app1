import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter;
  await Hive.openBox('todo_box');
  runApp(MaterialApp(
    home: HiveTodo(),
  ));
}

class HiveTodo extends StatefulWidget {
  const HiveTodo({super.key});

  @override
  State<HiveTodo> createState() => _HiveTodoState();
}

class _HiveTodoState extends State<HiveTodo> {
  List<Map<String, dynamic>> task = [];
  final my_box = Hive.box('todo_box');
  void initState() {
    readTask_refreshUi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Task'),
      ),
      body: task.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              itemCount: task.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.primaries[index % Colors.primaries.length],
                  child: Column(
                    children: [
                      Text(
                        task[index]['taskname'],
                        style: GoogleFonts.habibi(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        task[index]['taskdesc'],
                        style: GoogleFonts.habibi(fontSize: 20),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${DateTime.now().hour}:'),
                            Text('${DateTime.now().minute}:'),
                            Text('${DateTime.now().second}'),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              onPressed: () => showAlertbox(task[index]['id']),
                              icon: Icon(Icons.edit)),
                          IconButton(
                              onPressed: () => deleteTask(task[index]['id']),
                              icon: Icon(Icons.delete))
                        ],
                      ))
                    ],
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAlertbox(null),
        child: Icon(Icons.task),
      ),
    );
  }

  final title_cntrl = TextEditingController();
  final descr_cntrl = TextEditingController();
  void showAlertbox(int? key) {
    if (key != null) {
      final existng_task = task.firstWhere((element) => element['id'] == key);
      title_cntrl.text = existng_task['taskname'];
      descr_cntrl.text = existng_task['taskdesc'];
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.tealAccent,
            content: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "Title"),
                    controller: title_cntrl,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "Content"),
                    controller: descr_cntrl,
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (title_cntrl.text != "" && descr_cntrl.text != "") {
                      createTask({
                        'tname': title_cntrl.text.trim(),
                        'tcontent': descr_cntrl.text.trim(),
                      });
                    }
                    title_cntrl.text = "";
                    descr_cntrl.text = "";
                    Navigator.pop(context);
                  },
                  child: Text('Create Task')),
              TextButton(
                  onPressed: () {
                    updateTask(key, {
                      'tname': title_cntrl.text.trim(),
                      'tcontent': descr_cntrl.text.trim()
                    });
                    title_cntrl.text = "";
                    descr_cntrl.text = "";
                    Navigator.pop(context);
                  },
                  child: Text('Update Task')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
            ],
          );
        });
  }

  Future<void> createTask(Map<String, dynamic> mytask) async {
    await my_box.add(mytask);
    readTask_refreshUi();
  }

  void readTask_refreshUi() {
    final task_from_hive = my_box.keys.map((key) {
      final value = my_box.get(key);
      return {
        'id': key,
        'taskname': value['tname'],
        'taskdesc': value['tcontent']
      };
    }).toList();
    setState(() {
      task = task_from_hive.reversed.toList();
    });
  }

  Future<void> updateTask(int? key, Map<String, dynamic> updatedTask) async {
    await my_box.put(key, updatedTask);
    readTask_refreshUi();
  }

  Future<void> deleteTask(int key) async {
    await my_box.delete(key);
    readTask_refreshUi();
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Successfully Deleted')));
  }
}
