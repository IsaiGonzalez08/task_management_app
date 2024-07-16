import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/presentation/providers/task_provider.dart';
import 'package:task_management_app/presentation/widgets/button_widget.dart';
import 'package:task_management_app/presentation/widgets/tapbar_widget.dart';

class MyAlertConfirmDelete extends StatefulWidget {
  final int taskId;
  const MyAlertConfirmDelete({super.key, required this.taskId});

  @override
  State<MyAlertConfirmDelete> createState() => _MyAlertConfirmDeleteState();
}

class _MyAlertConfirmDeleteState extends State<MyAlertConfirmDelete> {
  late int taskId;

  @override
  void initState() {
    taskId = widget.taskId;
    super.initState();
  }

  void navigateHomeScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MyTapBar()),
    );
  }

  Future<void> _deleteTask() async {
    await Provider.of<TaskProvider>(context, listen: false).deleteTask(taskId);
    navigateHomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(10.0)),
      backgroundColor: const Color(0xFFFFFFFF),
      title: const Center(
        child: Text(
          textAlign: TextAlign.center,
          "¿Estas seguro que quieres eliminar\ntú tarea?",
          style: TextStyle(
              color: Color(0xFF01142B),
              fontSize: 16,
              fontWeight: FontWeight.w700),
        ),
      ),
      content: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign: TextAlign.center,
            "Al eliminar tú tarea, la información \nde la tarea se perderá",
            style: TextStyle(
                color: Color(0xFFACACAC),
                fontSize: 11,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomButton(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              width: MediaQuery.of(context).size.width * 0.29,
              height: 35,
              textButton: 'Cancelar',
              color: const Color(0xFFB6B6B6),
              colorText: const Color(0xFFFFFFFF),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              width: 10,
            ),
            CustomButton(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              width: MediaQuery.of(context).size.width * 0.29,
              height: 35,
              textButton: 'Eliminar',
              color: const Color(0xFFAB0000),
              colorText: const Color(0xFFFFFFFF),
              onPressed: () async {
                _deleteTask();
              },
            ),
          ],
        )
      ],
    );
  }
}
