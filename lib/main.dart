import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the current time
    DateTime now = DateTime.now();
    double currentTimePercentage = (now.hour * 60 + now.minute) / (24 * 60);
    double dayLeftPercentage = 1 - currentTimePercentage;

    return Scaffold(
      appBar: AppBar(
        title: Text('Tymgress'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Day Progress',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Use a custom DonutChart widget to display the time percentage
            DonutChart(currentTimePercentage),
            SizedBox(height: 20),
            Text(
              'Day Left: ${(dayLeftPercentage * 100).toStringAsFixed(2)}%',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DonutChart extends StatelessWidget {
  final double percentage;

  DonutChart(this.percentage);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              borderData: FlBorderData(show: false),
              sectionsSpace: 0,
              centerSpaceRadius: 70,
              sections: [
                PieChartSectionData(
                  color: Colors.blue,
                  value: percentage * 100,
                  radius: 30,
                  showTitle: false,
                ),
                PieChartSectionData(
                  color: Colors.grey,
                  value: (1 - percentage) * 100,
                  radius: 30,
                  showTitle: false,
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Center(
              child: Text(
                '${(percentage * 100).toStringAsFixed(2)}%',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
