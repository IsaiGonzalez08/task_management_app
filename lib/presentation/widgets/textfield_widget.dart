import 'package:flutter/material.dart';

class MyTextFieldWidget extends StatelessWidget {
  const MyTextFieldWidget({
    super.key,
    this.text,
    this.textInput,
    required this.width,
    required this.controllerTextField,
    required this.maxLines,
    this.textLabel,
    this.validator,
    this.onChanged,
    this.onSaved,
  });
  final String? text;
  final int maxLines;
  final String? textLabel;
  final TextInputAction? textInput;
  final double width;
  final String? Function(String?)? validator;
  final TextEditingController controllerTextField;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textLabel!,
          style: const TextStyle(
              color: Color(0xFF01142B),
              fontSize: 14,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: width,
          child: TextFormField(
            maxLines: maxLines,
            onChanged: onChanged,
            textInputAction: textInput,
            autocorrect: false,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide.none,
              ),
              hintText: text,
              hintStyle: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFFB8B8B8),
                  fontWeight: FontWeight.w500),
              filled: true,
              fillColor: const Color(0xFFEDEDED),
            ),
            validator: validator,
            onSaved: onSaved,
            controller: controllerTextField,
          ),
        ),
      ],
    );
  }
}
