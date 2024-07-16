import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/presentation/providers/task_provider.dart';
import 'package:task_management_app/presentation/screens/add_task_screen.dart';
import 'package:task_management_app/presentation/screens/home_screen.dart';

class MyTapBar extends StatefulWidget {
  const MyTapBar({super.key});

  @override
  State<MyTapBar> createState() => _MyTapBarState();
}

class _MyTapBarState extends State<MyTapBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> body = [
      const MyHomeScreen(),
      const MyAddTaskScreen()
    ];

    return Scaffold(
      body: Center(
        child: body[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          if (!Provider.of<TaskProvider>(context, listen: false).loading) {
            setState(() {
              _currentIndex = newIndex;
            });
          }
        },
        items: [
          BottomNavigationBarItem(
              label: 'Home',
              activeIcon: SvgPicture.asset('assets/img/active_home.svg'),
              icon: SvgPicture.asset('assets/img/home.svg')),
          BottomNavigationBarItem(
            label: 'Agregar',
            activeIcon: Image.asset('assets/img/active_add.png', width: 25),
            icon: Image.asset('assets/img/add.png', width: 25),
          ),
        ],
        selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Color(0xFF01142B)),
        unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Color(0xFF979797)),
      ),
    );
  }
}
