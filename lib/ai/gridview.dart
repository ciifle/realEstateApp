import 'package:flutter/material.dart';
class Grid extends StatelessWidget {
  Grid({super.key});
  final List<String> dataList = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColorGrid(dataList: dataList,),
    );
  }
}

class ColorGrid extends StatelessWidget {
  final List<String> dataList;

  ColorGrid({required this.dataList});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(dataList.length, (index) {
        return Container(
          margin: EdgeInsets.all(8),
          color: getRandomColor(),
          child: Center(
            child: Text(
              dataList[index],
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      }),
    );
  }

  Color getRandomColor() {
    return Color(0xFF000000 + 0x00FFFFFF & DateTime.now().millisecondsSinceEpoch);
  }
}
