import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '/sabitler.dart';

class AnimasyonGrafik extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AnimasyonGrafikState();
}

class AnimasyonGrafikState extends State<AnimasyonGrafik> {
  final Color leftBarColor = const Color(0xff53fdd7);
  final Color rightBarColor = const Color(0xffff5182);
  final double width = 7;
  int touchedGroupIndex;

  final List<List<double>> weeklyData = [
    [5, 12],
    [16, 12],
    [18, 5],
    [20, 16],
    [17, 6],
    [19, 1.5],
    [10, 1.5]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: animasyonGrafikRenk,
        title: Text('Grafik ve Animasyon'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height - 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          color: const Color(0xff2c4260),
        ),
        margin: EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              'Transactions',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: BarChart(
                  _mainBarData(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BarChartData _mainBarData() {
    return BarChartData(
      maxY: 20,
      titlesData: _buildAxes(),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: _buildAllBars(),
    );
  }

  FlTitlesData _buildAxes() {
    return FlTitlesData(
      show: true,
      bottomTitles: SideTitles(
        showTitles: true,
        margin: 20,
        getTitles: (double value) {
          switch (value.toInt()) {
            case 0:
              return 'pzt';
            case 1:
              return 'sl';
            case 2:
              return 'çrş';
            case 3:
              return 'prş';
            case 4:
              return 'cm';
            case 5:
              return 'cts';
            case 6:
              return 'pzr';
            default:
              return '';
          }
        },
      ),
      leftTitles: SideTitles(
        showTitles: true,
        margin: 32,
        reservedSize: 14,
        getTitles: (value) {
          if (value == 0) {
            return '1K';
          } else if (value == 10) {
            return '5K';
          } else if (value == 19) {
            return '10K';
          } else {
            return '';
          }
        },
      ),
    );
  }

  List<BarChartGroupData> _buildAllBars() {
    return List.generate(
      weeklyData.length,
      (index) => _buildBar(index, weeklyData[index][0], weeklyData[index][1]),
    );
  }

  BarChartGroupData _buildBar(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 5,
      x: x,
      barRods: [
        BarChartRodData(
          y: y1,
          colors: [leftBarColor],
          width: width,
        ),
        BarChartRodData(
          y: y2,
          colors: [rightBarColor],
          width: width,
        ),
      ],
    );
  }
}
