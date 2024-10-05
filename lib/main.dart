import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learn_grid/functions/number_randomizer.dart';
import 'package:learn_grid/widgets/custom_grid.dart';
import 'package:learn_grid/widgets/custom_progress_indicator.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double xAxisDivisions = 1;
  double yAxisDivisions = 1;
  int numberTop = generateRandomNumberTop();
  int numberBottom = generateRandomNumberBottom();
  int clickedCount = 0;
  int currentStep = 1;
  bool isAnswerTrue = false;

  List<List<Color>> gridColors = [
    [Colors.grey]
  ];

  void changeClickedCount(int currentClickedCount) {
    setState(() {
      clickedCount = currentClickedCount;
    });
  }

  void initGridColors() {
    gridColors = List.generate(
      yAxisDivisions.toInt(),
      (i) => List.generate(
        xAxisDivisions.toInt(),
        (j) => Colors.grey,
      ),
    );
    clickedCount = 0;
  }

  void checkAnswer() {
    if (clickedCount == numberTop &&
        xAxisDivisions * yAxisDivisions == numberBottom) {
      setState(() {
        isAnswerTrue = true;
      });
    } else {
      setState(() {
        isAnswerTrue = false;
      });
    }

    if (isAnswerTrue) {
      Fluttertoast.showToast(
          msg: "True Answer",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white);
    } else {
      Fluttertoast.showToast(
          msg: "Wrong Answer",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white);
    }
  }

  void reset() {
    numberTop = generateRandomNumberTop();
    numberBottom = generateRandomNumberBottom();
    xAxisDivisions = 1;
    yAxisDivisions = 1;
    initGridColors();
    isAnswerTrue = false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(249, 75, 75, 75),
        body: SafeArea(
          child: Column(
            children: [
              CustomProgressIndicator(
                currentStep: currentStep,
                totalSteps: 5,
                activeColor: Colors.green,
                height: 8.0,
              ),
              Container(
                height: 60,
                decoration: const BoxDecoration(color: Colors.black54),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                reset();
                              });
                            },
                            child: const Icon(Icons.refresh,
                                size: 30, color: Colors.grey),
                          )
                        ],
                      ),
                      const Row(
                        children: [
                          Icon(Icons.star, size: 30, color: Colors.green),
                          Icon(Icons.star, size: 30, color: Colors.green),
                        ],
                      ),
                      const Icon(Icons.chevron_right,
                          size: 40, color: Colors.grey),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        numberTop.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                      ),
                      Container(
                        height: 2,
                        width: 100,
                        color: Colors.white,
                      ),
                      Text(
                        numberBottom.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Slider(
                    value: xAxisDivisions,
                    min: 1,
                    max: 10,
                    divisions: 9,
                    label: xAxisDivisions.toInt().toString(),
                    activeColor: const Color.fromARGB(255, 28, 133, 139),
                    inactiveColor: Colors.transparent,
                    thumbColor: const Color.fromARGB(255, 28, 133, 139),
                    onChanged: (value) {
                      setState(() {
                        xAxisDivisions = value;
                        initGridColors();
                      });
                    },
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 300,
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Slider(
                            value: yAxisDivisions,
                            min: 1,
                            max: 10,
                            divisions: 9,
                            label: yAxisDivisions.round().toString(),
                            activeColor:
                                const Color.fromARGB(255, 28, 133, 139),
                            inactiveColor: Colors.transparent,
                            thumbColor: const Color.fromARGB(255, 28, 133, 139),
                            onChanged: (double value) {
                              setState(() {
                                yAxisDivisions = value;
                                initGridColors();
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: CustomGrid(
                            xDivisions: xAxisDivisions.toInt(),
                            yDivisions: yAxisDivisions.toInt(),
                            squareClickedCount: clickedCount,
                            changeClickedHandler: changeClickedCount,
                            gridColors: gridColors,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 300, // Adjust this value as needed
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Slider(
                            value: yAxisDivisions,
                            min: 1,
                            max: 10,
                            divisions: 9,
                            label: yAxisDivisions.round().toString(),
                            activeColor:
                                const Color.fromARGB(255, 28, 133, 139),
                            inactiveColor: Colors.transparent,
                            thumbColor: const Color.fromARGB(255, 28, 133, 139),
                            onChanged: (double value) {
                              setState(() {
                                yAxisDivisions = value;
                                initGridColors();
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Slider(
                    value: xAxisDivisions,
                    min: 1,
                    max: 10,
                    divisions: 9,
                    label: xAxisDivisions.toInt().toString(),
                    activeColor: const Color.fromARGB(255, 28, 133, 139),
                    inactiveColor: Colors.transparent,
                    thumbColor: const Color.fromARGB(255, 28, 133, 139),
                    onChanged: (value) {
                      setState(() {
                        xAxisDivisions = value;
                        initGridColors();
                      });
                    },
                  ),
                ],
              ),
              const Spacer(),
              // TODO: adding toast and extract logic to separate function
              GestureDetector(
                onTap: () {
                  if (!isAnswerTrue) {
                    checkAnswer();
                  } else {
                    setState(() {
                      if (currentStep <= 5) {
                        currentStep++;
                        reset();
                      }
                    });
                  }
                },
                child: Container(
                  width: 180,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: isAnswerTrue
                      ? const Icon(
                          Icons.chevron_right,
                          size: 40,
                          color: Colors.green,
                        )
                      : const Icon(
                          Icons.done,
                          size: 40,
                          color: Colors.green,
                        ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
