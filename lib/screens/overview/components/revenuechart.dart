import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:letzswap_dashboard/constants.dart';

class RevenueChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RevenueChartState();
}

class RevenueChartState extends State<RevenueChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      child: AspectRatio(
        aspectRatio: 2,
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
          color: bgColor,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceEvenly,
              maxY: 10,
              barTouchData: BarTouchData(
                enabled: true,
                touchTooltipData: BarTouchTooltipData(
                  tooltipBgColor: Colors.transparent,
                  tooltipPadding: const EdgeInsets.all(0),
                  tooltipMargin: 6,
                  getTooltipItem: (
                    BarChartGroupData group,
                    int groupIndex,
                    BarChartRodData rod,
                    int rodIndex,
                  ) {
                    return BarTooltipItem(
                      rod.y.round().toString(),
                      TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: SideTitles(
                  showTitles: true,
                  getTextStyles: (value) => const TextStyle(
                      color: Color(0xff7589a2),
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                  margin: 20,
                  getTitles: (double value) {
                    switch (value.toInt()) {
                      case 0:
                        return 'JAN';
                      case 1:
                        return 'FEB';
                      case 2:
                        return 'MAR';
                      case 3:
                        return 'APR';
                      case 4:
                        return 'MAY';
                      case 5:
                        return 'JUN';
                      case 6:
                        return 'JUL';
                      default:
                        return '';
                    }
                  },
                ),
                leftTitles: SideTitles(showTitles: true),
              ),
              borderData: FlBorderData(
                show: false,
              ),
              barGroups: [
                BarChartGroupData(
                  x: 0,
                  barRods: [
                    BarChartRodData(width: 30, y: 8, colors: [
                      colorChartRevA,
                      colorChartRevA.withOpacity(0.3)
                    ])
                  ],
                  showingTooltipIndicators: [0],
                ),
                BarChartGroupData(
                  x: 1,
                  barRods: [
                    BarChartRodData(width: 30, y: 2, colors: [
                      colorChartRevB,
                      colorChartRevB.withOpacity(0.3)
                    ])
                  ],
                  showingTooltipIndicators: [0],
                ),
                BarChartGroupData(
                  x: 2,
                  barRods: [
                    BarChartRodData(width: 30, y: 3, colors: [
                      colorChartRevC,
                      colorChartRevC.withOpacity(0.3)
                    ])
                  ],
                  showingTooltipIndicators: [0],
                ),
                BarChartGroupData(
                  x: 3,
                  barRods: [
                    BarChartRodData(width: 30, y: 6, colors: [
                      colorChartRevD,
                      colorChartRevD.withOpacity(0.3)
                    ])
                  ],
                  showingTooltipIndicators: [0],
                ),
                BarChartGroupData(
                  x: 4,
                  barRods: [
                    BarChartRodData(width: 30, y: 8, colors: [
                      colorChartRevB,
                      colorChartRevB.withOpacity(0.3)
                    ])
                  ],
                  showingTooltipIndicators: [0],
                ),
                BarChartGroupData(
                  x: 5,
                  barRods: [
                    BarChartRodData(width: 30, y: 6, colors: [
                      colorChartRevA,
                      colorChartRevA.withOpacity(0.3)
                    ])
                  ],
                  showingTooltipIndicators: [0],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
