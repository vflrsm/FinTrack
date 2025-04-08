// ignore_for_file: avoid_print

import 'dart:math';

import 'package:fintrack/screens/add_expense/views/add_expense.dart';
import 'package:fintrack/screens/home/Stats/stats.dart';
import 'package:fintrack/screens/home/views/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var widgetList = [
    MainScreen(),
    StatsScreen(),
  ];

  int index = 0;
  late Color selectedItem = Colors.greenAccent;
  Color unselectedItem = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          //clip recc
          child: BottomNavigationBar(
              onTap: (value) {
                setState(() {
                  index = value;
                });
                print(value);
              },
              backgroundColor: Colors.white,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              selectedItemColor: Colors.greenAccent,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.home,
                      color: index == 0 ? selectedItem : unselectedItem,
                    ),
                    label: 'home'),
                BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.graph_circle_fill,
                      color: index == 1 ? selectedItem : unselectedItem,
                    ),
                    label: 'graph')
              ]),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const AddExpense(),
              ),
            );
          },
          shape: const CircleBorder(),
          child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.secondary,
                    Theme.of(context).colorScheme.tertiary,
                  ], transform: GradientRotation(pi / 4))),
              child: Icon(CupertinoIcons.add)),
        ),
        body: index == 0 ? MainScreen() : StatsScreen());
  }
}
