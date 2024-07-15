import 'package:flutter/material.dart';
import 'package:task_management_app/presentation/widgets/button_widget.dart';
import 'package:task_management_app/presentation/widgets/date_input_widget.dart';
import 'package:task_management_app/presentation/widgets/drop_down_menu_widget.dart';
import 'package:task_management_app/presentation/widgets/textfield_widget.dart';

class MyAddTaskScreen extends StatefulWidget {
  const MyAddTaskScreen({super.key});

  @override
  State<MyAddTaskScreen> createState() => _MyAddTaskScreenState();
}

class _MyAddTaskScreenState extends State<MyAddTaskScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController isCompleteController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController commentsController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController tagsController = TextEditingController();
  String? startValue;

  List<String> isComplete = <String>[
    '0',
    '1',
  ];

  @override
  void initState() {
    startValue = isComplete.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Agregar una tarea',
                  style: TextStyle(
                    color: Color(0xFF131313),
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Color(0xFFD7D7D7),
                  height: 1,
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTextFieldWidget(
                      maxLines: 1,
                      width: MediaQuery.of(context).size.width * 0.9,
                      controllerTextField: titleController,
                      text: "Titulo",
                      textLabel: "Titulo de la actividad*",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomDropdownMenu(
                          labelText: "Esta completado",
                          value: startValue!,
                          items: isComplete,
                          onChanged: (String? value) {
                            setState(() {
                              startValue = value!;
                            });
                          },
                        ),
                        DateInputField(
                          labelText: "Seleccionar fecha",
                          controller: dateController,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyTextFieldWidget(
                      maxLines: 3,
                      width: MediaQuery.of(context).size.width * 0.9,
                      controllerTextField: commentsController,
                      text: "Comentarios",
                      textLabel: "Comentarios",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyTextFieldWidget(
                      maxLines: 3,
                      width: MediaQuery.of(context).size.width * 0.9,
                      controllerTextField: commentsController,
                      text: "Descripción",
                      textLabel: "Descripción",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyTextFieldWidget(
                      maxLines: 3,
                      width: MediaQuery.of(context).size.width * 0.9,
                      controllerTextField: commentsController,
                      text: "Tags",
                      textLabel: "Tags",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                        textButton: 'Crear Tarea',
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 40,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF01142B),
                        colorText: const Color(0xFFFFFFFF))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
