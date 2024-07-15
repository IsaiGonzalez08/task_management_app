import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/domain/models/Task/task.dart';
import 'package:task_management_app/presentation/providers/task_provider.dart';
import 'package:task_management_app/presentation/widgets/card_task_widget.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<TaskProvider>(context, listen: false).getAllBusStops();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.08,
              vertical: MediaQuery.of(context).size.width * 0.14,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bienvenido',
                  style: TextStyle(
                    color: Color(0xFF707070),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Mi Lista de tareas',
                  style: TextStyle(
                    color: Color(0xFF131313),
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Color(0xFFD7D7D7),
                  height: 1,
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<TaskProvider>(builder: (_, controller, __) {
              if (controller.loading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                List<TaskModel> tasks = controller.tasks;
                return ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (_, index) {
                    final task = tasks[index];
                    return MyCardTaskWidget(
                      title: task.title,
                      date: task.date,
                      isCompleted: task.isCompleted,
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
