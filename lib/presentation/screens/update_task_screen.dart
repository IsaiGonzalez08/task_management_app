import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/presentation/providers/task_provider.dart';
import 'package:task_management_app/presentation/widgets/button_widget.dart';
import 'package:task_management_app/presentation/widgets/date_input_widget.dart';
import 'package:task_management_app/presentation/widgets/drop_down_menu_widget.dart';
import 'package:task_management_app/presentation/widgets/tapbar_widget.dart';
import 'package:task_management_app/presentation/widgets/textfield_widget.dart';

class MyUpdateTaskScreen extends StatefulWidget {
  final int taskId;
  const MyUpdateTaskScreen({super.key, required this.taskId});

  @override
  State<MyUpdateTaskScreen> createState() => _MyUpdateTaskScreenState();
}

class _MyUpdateTaskScreenState extends State<MyUpdateTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  String? startValue = '0';
  final TextEditingController dateController = TextEditingController();
  final TextEditingController commentsController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController tagsController = TextEditingController();
  late int taskId;

  @override
  void initState() {
    taskId = widget.taskId;
    super.initState();
  }

  void navigateHomeScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MyTapBar()));
  }

  void updateTask() async {
    final String title = titleController.text;
    final String isComplete = startValue!;
    final String date = dateController.text;
    final String comments = commentsController.text;
    final String description = descriptionController.text;
    final String tags = tagsController.text;
    DateTime parsedDate = DateFormat('dd/MM/yyyy').parse(date);
    String formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);
    if (_formKey.currentState!.validate()) {
      await Provider.of<TaskProvider>(context, listen: false).updateTask(
        taskId,
        title,
        int.parse(isComplete),
        formattedDate,
        comments,
        description,
        tags,
      );
      navigateHomeScreen();
    } else {
      print('El formulario no es válido');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Actualizar tarea',
          style: TextStyle(
              color: Color(0xFF01142B),
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  MyTextFieldWidget(
                    width: MediaQuery.of(context).size.width * 0.9,
                    maxLines: 1,
                    controllerTextField: titleController,
                    text: "Titulo",
                    textLabel: "Titulo de la actividad*",
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomDropdownMenu(
                        labelText: "Completado*",
                        value: startValue!,
                        items: const ['0', '1'],
                        onChanged: (String? value) {
                          setState(() {
                            startValue = value!;
                          });
                        },
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: DateInputField(
                          labelText: "Seleccionar fecha",
                          controller: dateController,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  MyTextFieldWidget(
                    width: MediaQuery.of(context).size.width * 0.9,
                    maxLines: 3,
                    controllerTextField: commentsController,
                    text: "Comentarios",
                    textLabel: "Comentarios",
                  ),
                  const SizedBox(height: 10),
                  MyTextFieldWidget(
                    width: MediaQuery.of(context).size.width * 0.9,
                    maxLines: 3,
                    controllerTextField: descriptionController,
                    text: "Descripción",
                    textLabel: "Descripción",
                  ),
                  const SizedBox(height: 10),
                  MyTextFieldWidget(
                    width: MediaQuery.of(context).size.width * 0.9,
                    maxLines: 3,
                    controllerTextField: tagsController,
                    text: "Tags",
                    textLabel: "Tags",
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    onPressed: () {
                      updateTask();
                    },
                    textButton: 'Actualizar Tarea',
                    width: double.infinity,
                    height: 40,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF01142B),
                    colorText: const Color(0xFFFFFFFF),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
