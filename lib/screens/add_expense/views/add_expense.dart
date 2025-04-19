import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime selectDate = DateTime.now();

  List<String> myCategoriesIcons = [
    'entertainment',
    'food',
    'home',
    'pet',
    'shopping',
    'tech',
    'travel',
  ];

  String iconSelected = '';
  Color selectedColor = Colors.blue; // Color por defecto

  @override
  void initState() {
    dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    super.initState();

    super.initState();
    expenseController.addListener(() {
      setState(() {}); // Esto forzará el redibujo del overlay
    });
  }

  @override
  void dispose() {
    expenseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
            // backgroundColor: Color,
            ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.start, // Alineación en la parte superior
            crossAxisAlignment:
                CrossAxisAlignment.center, // Centrado horizontal
            children: [
              const Text(
                'Ingresa tu gasto',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Stack(
                    children: [
                      // Campo de texto transparente con padding suficiente
                      TextFormField(
                        controller: expenseController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w600,
                          color: Colors
                              .transparent, // Oculta texto real para superponer
                        ),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      // Superposición visual
                      Positioned.fill(
                        child: IgnorePointer(
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '\$',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                expenseController.text.isEmpty
                                    ? ShaderMask(
                                        shaderCallback: (bounds) =>
                                            const LinearGradient(
                                          colors: [
                                            Color(0xFF6CE9A5),
                                            Color(0xFF32B3E2),
                                            Color(0xFF9D7BFF),
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ).createShader(bounds),
                                        child: const Text(
                                          '0',
                                          style: TextStyle(
                                            fontSize: 50,
                                            fontWeight: FontWeight.w600,
                                            color: Colors
                                                .white, // necesario para ShaderMask
                                          ),
                                        ),
                                      )
                                    : Text(
                                        expenseController.text,
                                        style: const TextStyle(
                                          fontSize: 50,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32),
              TextFormField(
                controller: categoryController,
                textAlign: TextAlign.start, // Alineación horizontal del texto
                textAlignVertical:
                    TextAlignVertical.center, // Alineación vertical del texto
                readOnly: true,
                onTap: () {},
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    CupertinoIcons.list_bullet,
                    color: Colors.grey,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      CupertinoIcons.add,
                      color: Colors.blueGrey,
                      size: 24,
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            bool isExpanded = false;
                            return StatefulBuilder(
                                builder: (context, setState) {
                              return AlertDialog(
                                  title: const Text('Crea una Categoría'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      TextFormField(
                                        textAlign: TextAlign.start,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        //readOnly: true,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          label: Text(
                                            'Nombre',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey),
                                          ),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide.none),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      TextFormField(
                                        onTap: () {
                                          setState(() {
                                            isExpanded = !isExpanded;
                                          });
                                        },
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: 'Icon',
                                          hintStyle: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                          suffixIcon: const Icon(
                                            CupertinoIcons.chevron_down,
                                            size: 12,
                                            color: Colors.grey,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                      isExpanded
                                          ? Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 200,
                                              decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                          bottom:
                                                              Radius.circular(
                                                                  12))),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: GridView.builder(
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3,
                                                    crossAxisSpacing:
                                                        8.0, // Menos espacio entre columnas
                                                    mainAxisSpacing:
                                                        8.0, // Menos espacio entre filas
                                                  ),
                                                  itemCount:
                                                      myCategoriesIcons.length,
                                                  itemBuilder:
                                                      (context, int i) {
                                                    return Align(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            iconSelected =
                                                                myCategoriesIcons[
                                                                    i];
                                                          });
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                              width: 2,
                                                              color: iconSelected ==
                                                                      myCategoriesIcons[
                                                                          i]
                                                                  ? Color(
                                                                      0xFF6CE9A5)
                                                                  : Colors.grey,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            image:
                                                                DecorationImage(
                                                              image: AssetImage(
                                                                  'assets/${myCategoriesIcons[i]}.png'),
                                                            ),
                                                          ),
                                                          width: 100,
                                                          height: 100,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            )
                                          : Container(),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      TextFormField(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title: const Text(
                                                  'Selecciona un color'),
                                              content: SingleChildScrollView(
                                                child: ColorPicker(
                                                  pickerColor: selectedColor,
                                                  onColorChanged:
                                                      (Color color) {
                                                    setState(() {
                                                      selectedColor = color;
                                                    });
                                                  },
                                                  pickerAreaHeightPercent: 0.8,
                                                  enableAlpha: false,
                                                  displayThumbColor: true,
                                                ),
                                              ),
                                              actions: [
                                                TextButton(
                                                  child: const Text('Aceptar'),
                                                  onPressed: () {
                                                    setState(() {
                                                      // Aquí puedes guardar el color seleccionado
                                                      Navigator.of(context)
                                                          .pop();
                                                    });
                                                  },
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor:
                                              selectedColor, // Fondo del color seleccionado
                                          label: Text(
                                            'Elige un Color',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: useWhiteForeground(
                                                      selectedColor)
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        height: kToolbarHeight,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                                Theme.of(context)
                                                    .colorScheme
                                                    .tertiary,
                                              ],
                                              transform: const GradientRotation(
                                                  pi / 40),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 24, vertical: 12),
                                          alignment: Alignment.center,
                                          child: const Text('Guardar Categoría',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                      ),
                                    ],
                                  ));
                            });
                          });
                    },
                  ),
                  label: Text(
                    'Categoría',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                maxLines: 1,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    CupertinoIcons.pencil,
                    color: Colors.grey,
                  ),
                  label: Text(
                    'Notas',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: dateController,
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                readOnly: true,
                onTap: () async {
                  DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: selectDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)));
                  if (newDate != null) {
                    setState(() {
                      dateController.text =
                          DateFormat('dd/MM/yyyy').format(newDate);
                      selectDate = newDate;
                    });
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    CupertinoIcons.clock,
                    color: Colors.grey,
                  ),
                  label: Text(
                    'Fecha',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              SizedBox(
                width: double.infinity,
                height: kToolbarHeight,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.secondary,
                        Theme.of(context).colorScheme.tertiary,
                      ],
                      transform: const GradientRotation(pi / 40),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  alignment: Alignment.center,
                  child: const Text('Guardar',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
