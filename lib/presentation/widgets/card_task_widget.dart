import 'package:flutter/material.dart';

class MyCardTaskWidget extends StatelessWidget {
  const MyCardTaskWidget(
      {super.key,
      required this.title,
      required this.date,
      required this.isCompleted});
  final String title;
  final String date;
  final int isCompleted;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xFF8D8D8D)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/img/Task.png',
                width: 60,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: Color(0xFF131313),
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                        color: Color(0xFF8D8D8D),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Completados:',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF131313),
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                '$isCompleted',
                style: const TextStyle(
                    color: Color(0xFF8D8D8D),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              )
            ],
          )
        ],
      ),
    );
  }
}
