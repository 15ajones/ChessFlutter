import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late final double titleWidth = MediaQuery.of(context).size.width / 8.0;

  final Color green = const Color.fromRGBO(119, 149, 86, 100);
  final Color lightGreen = const Color.fromRGBO(255, 236, 208, 100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Chess")),
        body: Column(children: [
          ...List.generate(
              8,
              (y) => Row(children: [
                    ...List.generate(
                        8,
                        (x) => Container(
                              decoration:
                                  BoxDecoration(color: assignBoxColor(x, y)),
                              width: titleWidth,
                              height: titleWidth,
                            ))
                  ]))
        ]));
  }

  Color assignBoxColor(int x, int y) {
    int value = x;
    if (y % 2 == 0) {
      value++;
    }
    return value % 2 == 0 ? green : lightGreen;
  }
}
