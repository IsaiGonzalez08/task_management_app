import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/presentation/providers/task_provider.dart';
import 'package:task_management_app/presentation/widgets/button_widget.dart';
import 'package:task_management_app/presentation/widgets/date_input_widget.dart';
import 'package:task_management_app/presentation/widgets/drop_down_menu_widget.dart';
import 'package:task_management_app/presentation/widgets/tapbar_widget.dart';
import 'package:task_management_app/presentation/widgets/textfield_widget.dart';

class MyAddTaskScreen extends StatefulWidget {
  const MyAddTaskScreen({super.key});

  @override
  State<MyAddTaskScreen> createState() => _MyAddTaskScreenState();
}

class _MyAddTaskScreenState extends State<MyAddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  String? startValue = '0';
  final TextEditingController dateController = TextEditingController();
  final TextEditingController commentsController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController tagsController = TextEditingController();

  Future<void> _createTask() async {
    if (_formKey.currentState!.validate()) {
      final String title = titleController.text;
      final String isComplete = startValue!;
      final String date = dateController.text;
      final String comments = commentsController.text;
      final String description = descriptionController.text;
      final String tags = tagsController.text;
      DateTime parsedDate = DateFormat('dd/MM/yyyy').parse(date);
      String formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);
      await Provider.of<TaskProvider>(context, listen: false).createTask(
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

  void navigateHomeScreen() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const MyTapBar()));
  }

  String? _validateNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo es obligatorio';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const Text(
                  'Agregar una tarea',
                  style: TextStyle(
                    color: Color(0xFF131313),
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
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
                MyTextFieldWidget(
                  width: MediaQuery.of(context).size.width * 0.9,
                  maxLines: 1,
                  controllerTextField: titleController,
                  text: "Titulo",
                  textLabel: "Titulo de la actividad*",
                  validator: _validateNotEmpty,
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
                        validator: _validateNotEmpty,
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
                  validator: _validateNotEmpty,
                ),
                const SizedBox(height: 10),
                MyTextFieldWidget(
                  width: MediaQuery.of(context).size.width * 0.9,
                  maxLines: 3,
                  controllerTextField: descriptionController,
                  text: "Descripción",
                  textLabel: "Descripción",
                  validator: _validateNotEmpty,
                ),
                const SizedBox(height: 10),
                MyTextFieldWidget(
                  width: MediaQuery.of(context).size.width * 0.9,
                  maxLines: 3,
                  controllerTextField: tagsController,
                  text: "Tags",
                  textLabel: "Tags",
                  validator: _validateNotEmpty,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  onPressed: _createTask,
                  textButton: 'Crear Tarea',
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
    );
  }
}
