// import 'package:fintrack/screens/home/Stats/chart.dart';
import 'package:fintrack/screens/home/Stats/chart.dart';
import 'package:fintrack/screens/home/views/homescreen.dart';
import 'package:flutter/material.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  bool showBottomNav =
      true; // Estado para mostrar/ocultar el BottomNavigationBar
  String selected = 'Expenses'; // Estado para el toggle

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
              width: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Botón de atrás + título
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        color: Colors.grey.shade600,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Transacciones',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),

                // Botón de filtro
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: IconButton(
                    onPressed: () async {
                      final DateTimeRange? picked = await showDateRangePicker(
                        context: context,
                        firstDate: DateTime(2020),
                        lastDate: DateTime.now(),
                        initialDateRange: DateTimeRange(
                          start: DateTime.now().subtract(Duration(days: 7)),
                          end: DateTime.now(),
                        ),
                      );
                      if (picked != null) {
                        // ignore: avoid_print
                        print(
                            'Selected range: ${picked.start} - ${picked.end}');
                      }
                    },
                    icon: const Icon(Icons.filter_list_outlined),
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              height: 50,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Stack(
                children: [
                  AnimatedAlign(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    alignment: selected == 'Income'
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5 -
                          20, // ajusta al tamaño
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Theme.of(context).colorScheme.primary,
                          Theme.of(context).colorScheme.secondary,
                          Theme.of(context).colorScheme.tertiary,
                        ]),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  Row(
                    children: ['Income', 'Expenses'].map((type) {
                      final isSelected = selected == type;
                      return Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => selected = type),
                          child: Container(
                            alignment: Alignment.center,
                            child: AnimatedDefaultTextStyle(
                              duration: Duration(milliseconds: 300),
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : Colors.grey.shade600,
                                fontWeight: FontWeight.w600,
                              ),
                              child: Text(type),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: MyChart(),
            )
          ],
        ),
      ),
    );
  }
}
