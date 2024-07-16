import 'package:flutter/material.dart';
import 'package:task_management_app/presentation/widgets/button_widget.dart';

class TaskAlertWidget extends StatefulWidget {
  final String taskTitle, taskDate;
  final int taskId;
  const TaskAlertWidget(
      {super.key,
      required this.taskTitle,
      required this.taskDate,
      required this.taskId});

  @override
  State<TaskAlertWidget> createState() => _TaskAlertWidgetState();
}

class _TaskAlertWidgetState extends State<TaskAlertWidget> {
  late String taskTitle;
  late String taskDate;
  late int taskId;

  @override
  void initState() {
    taskTitle = widget.taskTitle;
    taskDate = widget.taskDate;
    taskId = widget.taskId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(10.0)),
      backgroundColor: const Color(0xFFFFFFFF),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Text(
              taskTitle,
              style: const TextStyle(
                  color: Color(0xFF131313),
                  fontSize: 26,
                  fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Fecha para hacer',
                    style: TextStyle(
                        color: Color(0xFF01142B),
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    taskDate,
                    style: const TextStyle(
                        color: Color(0xFF8D8D8D),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    color: const Color(0xFFFFFFFF),
                    style: const ButtonStyle(
                        shape: WidgetStatePropertyAll(ContinuousRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                        backgroundColor:
                            WidgetStatePropertyAll(Color(0xFF58B0CB))),
                    icon: const Icon(Icons.edit),
                    iconSize: 20,
                  ),
                  IconButton(
                    onPressed: () {},
                    color: const Color(0xFFFFFFFF),
                    style: const ButtonStyle(
                        shape: WidgetStatePropertyAll(ContinuousRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                        backgroundColor:
                            WidgetStatePropertyAll(Color(0xFFAB0000))),
                    icon: const Icon(Icons.delete),
                    iconSize: 20,
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            color: Color(0xFFE0E0E0),
            height: 4,
          ),
          const SizedBox(
            height: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Comentarios',
                style: TextStyle(
                    color: Color(0xFF01142B),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Container(
                width: double.infinity,
                height: 100,
                decoration: const BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Hola',
                    style: TextStyle(
                        color: Color(0xFF01142B), fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Descripción',
                style: TextStyle(
                    color: Color(0xFF01142B),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Container(
                width: double.infinity,
                height: 100,
                decoration: const BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Hola',
                    style: TextStyle(
                        color: Color(0xFF01142B), fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tags',
                style: TextStyle(
                    color: Color(0xFF01142B),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Container(
                width: double.infinity,
                height: 100,
                decoration: const BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Hola',
                    style: TextStyle(
                        color: Color(0xFF01142B), fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'F. de creación:',
                    style: TextStyle(
                        color: Color(0xFF01142B),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('data',
                      style: TextStyle(
                          color: Color(0xFF8D8D8D),
                          fontSize: 14,
                          fontWeight: FontWeight.w500))
                ],
              ),
              Column(
                children: [
                  Text('F. de actualización:',
                      style: TextStyle(
                          color: Color(0xFF01142B),
                          fontSize: 14,
                          fontWeight: FontWeight.w600)),
                  Text(
                    'data',
                    style: TextStyle(
                        color: Color(0xFF8D8D8D),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Column(
            children: [
              Text('Completado:',
                  style: TextStyle(
                      color: Color(0xFF01142B),
                      fontSize: 14,
                      fontWeight: FontWeight.w600)),
              Text(
                'data',
                style: TextStyle(
                    color: Color(0xFF8D8D8D),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.2),
            child: CustomButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                textButton: 'Salir',
                width: MediaQuery.of(context).size.width * 0.25,
                height: 35,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF8D8D8D),
                colorText: const Color(0xFFFFFFFF)),
          )
        ],
      ),
    );
  }
}
