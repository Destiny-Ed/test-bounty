import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_bounty/core/enums.dart';
import 'package:test_bounty/core/extensions.dart';
import 'package:test_bounty/providers/reports_provider.dart';

class AnalysisView extends StatefulWidget {
  const AnalysisView({super.key});

  @override
  State<AnalysisView> createState() => _AnalysisViewState();
}

class _AnalysisViewState extends State<AnalysisView> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Consumer<ReportsProvider>(
      builder: (context, reportVm, _) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(),
            color: Theme.of(context).cardColor,
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'bug severity'.cap,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),

                  Text(
                    'last 30 days'.cap,
                    style: Theme.of(context).textTheme.titleMedium!
                      ..color?.darken(),
                  ),
                ],
              ),

              10.height(),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1.35,
                      child: PieChart(
                        PieChartData(
                          pieTouchData: PieTouchData(
                            touchCallback:
                                (FlTouchEvent event, pieTouchResponse) {
                                  setState(() {
                                    if (!event.isInterestedForInteractions ||
                                        pieTouchResponse == null ||
                                        pieTouchResponse.touchedSection ==
                                            null) {
                                      touchedIndex = -1;
                                      return;
                                    }
                                    touchedIndex = pieTouchResponse
                                        .touchedSection!
                                        .touchedSectionIndex;
                                  });
                                },
                          ),
                          borderData: FlBorderData(show: false),
                          sectionsSpace: 0,
                          centerSpaceRadius: 40,
                          sections: showingSections(reportVm),
                        ),
                      ),
                    ),
                  ),

                  Column(
                    spacing: 4,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(bugReports.values.length, (index) {
                      final bug = bugReports.values[index];
                      return Indicator(
                        color: reportVm.bugReportColors(bug),
                        text: bug.name.cap,
                        isSquare: false,
                      );
                    }),
                  ),
                  30.width(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  List<PieChartSectionData>? showingSections(ReportsProvider reportVm) {
    return List.generate(bugReports.values.length, (index) {
      final isTouched = index == touchedIndex;
      final fontSize = isTouched ? 14.0 : 12.0;
      final radius = isTouched ? 35.0 : 25.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      final bug = bugReports.values[index];

      // final spendingByCategory = subVm.spendingByCategory();

      return PieChartSectionData(
        color: reportVm.bugReportColors(bug),
        value: index * 5,
        title: "${(index * 5) / 100}%",
        radius: radius,
        titleStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.bold,
          shadows: shadows,
          fontSize: fontSize,
        ),
      );
    });
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final Color? textColor;
  final String text;
  final bool isSquare;
  final double size;
  const Indicator({
    super.key,
    required this.color,
    this.textColor,
    required this.text,
    required this.isSquare,
    this.size = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        Text(text, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}
