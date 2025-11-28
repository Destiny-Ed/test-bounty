import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import 'package:test_bounty/core/extensions.dart';
import 'package:test_bounty/core/theme.dart';
import 'package:test_bounty/providers/report_provider.dart';
import 'package:test_bounty/widgets/form_field.dart';
import 'package:test_bounty/widgets/header_widget.dart';
import 'package:test_bounty/widgets/social_button.dart';

void showSubmitTesterReportModel(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => Container(
      height: context.screenSize().height - 100,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: const SubmitBugReportModal(),
    ),
  );
}

class SubmitBugReportModal extends StatefulWidget {
  const SubmitBugReportModal({super.key});

  @override
  State<SubmitBugReportModal> createState() => _SubmitBugReportModalState();
}

class _SubmitBugReportModalState extends State<SubmitBugReportModal> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Consumer<ReportProvider>(
        builder: (context, reportVm, child) {
          return SingleChildScrollView(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Drag handle + Title
                  10.height(),
                  Center(
                    child: Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Theme.of(context).textTheme.titleLarge!.color,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  20.height(),
                  Row(
                    spacing: 10,
                    children: [
                      Icon(
                        Icons.bug_report,
                        size: 32,
                        color: Theme.of(context).primaryColor,
                      ),
                      buildHeaderTitle(
                        context,
                        text: "Report a Bug / Feedback",
                      ),
                    ],
                  ),
                  10.height(),

                  Container(
                    padding: const EdgeInsets.all(10),
                    height: 35,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Marquee(
                      text:
                          'We auto-attach everything developers need, e.g device informations...   ',
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(color: AppColors.white),
                      scrollAxis: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      pauseAfterRound: Duration(seconds: 1),
                      accelerationDuration: Duration(seconds: 1),
                      accelerationCurve: Curves.linear,
                      decelerationDuration: Duration(milliseconds: 500),
                      decelerationCurve: Curves.easeOut,
                    ),
                  ),

                  20.height(),

                  // Severity Selector (beautiful chips)
                  buildHeaderTitle(context, text: "Severity"),
                  10.height(),
                  Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: reportVm.reportSeverities.map((s) {
                      final isSelected = reportVm.selectedReportSeverity == s;
                      final color = {
                        'critical': Colors.red,
                        'major': Colors.orange,
                        'minor': Colors.blue,
                        'suggestion': Colors.green,
                      }[s]!;

                      return ChoiceChip(
                        label: Text(
                          s.cap,
                          style: TextStyle(
                            color: isSelected ? Colors.white : color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        selected: isSelected,
                        selectedColor: color,
                        backgroundColor: color.withOpacity(0.1),
                        side: BorderSide(color: color, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        onSelected: (_) => reportVm.selectedReportSeverity = s,
                      );
                    }).toList(),
                  ),

                  20.height(),

                  CustomTextField(hint: "Title (required)", password: false),

                  20.height(),

                  // Description Field
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(),
                    ),
                    child: TextFormField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'Steps to reproduce & what happened?',
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  10.height(),
                  buildHeaderTitle(context, text: "attach media"),
                  10.height(),
                  // Media Attachments (Screenshots + Recording)
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Theme.of(context).textTheme.titleLarge!.color!,
                      ),
                    ),
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            spacing: 20,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _mediaButton(
                                Icons.screenshot,
                                'Add Screenshot',
                                AppColors.primaryBlue,
                              ),
                              _mediaButton(
                                Icons.videocam,
                                'Attach Recording',
                                AppColors.green,
                              ),
                              _mediaButton(
                                Icons.add_circle_outline,
                                'More Files',
                                AppColors.orange,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 8,
                          children: [
                            Chip(
                              avatar: const Icon(Icons.image, size: 18),
                              label: const Text('screenshot_1.png'),
                              onDeleted: () {},
                            ),
                            Chip(
                              avatar: const Icon(Icons.video_file, size: 18),
                              label: const Text('recording.mp4'),
                              onDeleted: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  20.height(),

                  // Submit Button with Reward Hint
                  CustomButton(
                    text: "submit report",
                    onTap: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          content: Row(
                            children: const [
                              Icon(Icons.check_circle, color: Colors.white),
                              SizedBox(width: 12),
                              Text(
                                'Report submitted! You earned +\$2 bonus for detailed report',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  30.height(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _mediaButton(IconData icon, String label, Color color) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, size: 32, color: color),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
