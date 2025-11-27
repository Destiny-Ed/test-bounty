import 'package:flutter/material.dart';
import 'package:test_bounty/core/enums.dart';
import 'package:test_bounty/core/theme.dart';

class CampaignProvider extends ChangeNotifier {
  Color bugReportColors(bugReports bug) {
    Color color = AppColors.red;
    switch (bug) {
      case bugReports.critical:
        color = AppColors.red;
      case bugReports.high:
        color = AppColors.primaryBlue;
      case bugReports.medium:
        color = AppColors.lightBlue;
      case bugReports.low:
        color = AppColors.primaryGreen;
    }
    return color;
  }

  bool _isCampaignPause = false;
  bool get isCampaignPause => _isCampaignPause;
  void setCampaignPauseStatus() {
    _isCampaignPause = !_isCampaignPause;
    notifyListeners();
  }

  List<String> campaignDetailTabs = ["testers", "description", "reports"];

  String _selectedCampaignTab = "testers";
  String get selectedCampaignTab => _selectedCampaignTab;

  set selectedCampaignTab(String value) {
    _selectedCampaignTab = value;
    notifyListeners();
  }
}
