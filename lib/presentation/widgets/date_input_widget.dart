import 'package:flutter/material.dart';

class DateInputField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;

  const DateInputField({
    super.key,
    required this.labelText,
    required this.controller,
  });

  @override
  // ignore: library_private_types_in_public_api
  _DateInputFieldState createState() => _DateInputFieldState();
}

class _DateInputFieldState extends State<DateInputField> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.labelText,
              style: const TextStyle(
                  color: Color(0xFF01142B),
                  fontSize: 14,
                  fontWeight: FontWeight.w600)),
          const SizedBox(
            height: 5,
          ),
          Container(
            decoration: const BoxDecoration(
                color: Color(0xFFEDEDED),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: TextFormField(
              controller: widget.controller,
              readOnly: true,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(top: 14, left: 10),
                  hintText: 'Fecha',
                  hintStyle: TextStyle(
                      color: Color(0xFFB8B8B8),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                  suffixIcon: Icon(Icons.calendar_today),
                  border: InputBorder.none),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                  locale: const Locale('es', 'ES'), // Calendario en español
                );
                if (pickedDate != null) {
                  setState(() {
                    selectedDate = pickedDate;
                    widget.controller.text =
                        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
