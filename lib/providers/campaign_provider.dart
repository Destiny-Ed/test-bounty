import 'package:flutter/material.dart';
import 'package:test_bounty/core/enums.dart';
import 'package:test_bounty/core/theme.dart';
import 'package:test_bounty/screens/developers/campaign/create_campaign/step1_basic_info.dart';
import 'package:test_bounty/screens/developers/campaign/create_campaign/step2_build_upload.dart';
import 'package:test_bounty/screens/developers/campaign/create_campaign/step3_targeting.dart';
import 'package:test_bounty/screens/developers/campaign/create_campaign/step4_testers_schedule.dart';
import 'package:test_bounty/screens/developers/campaign/create_campaign/step5_rewards_budget.dart';
import 'package:test_bounty/screens/developers/campaign/create_campaign/step6_questionnaire.dart';
import 'package:test_bounty/screens/developers/campaign/create_campaign/step7_review_launch.dart';

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

  List<String> campaignCountries = [
    "worldwide",
    "Nigeria",
    "United states",
    "united kingdom",
    "isreal",
    "ghana",
    "china",
    "morroco",
    "south africa",
    "germany",
    "russia",
  ];

  List<int> campaignAges = [12, 13, 16, 18, 30, 50];

  List<int> _selectedCampaignAges = [];
  List<int> get selectedCampaignAges => _selectedCampaignAges;
  set selectedCampaignAges(List<int> value) {
    _selectedCampaignAges = value;
    notifyListeners();
  }

  List<String> _selectedCampaignCountries = [];
  List<String> get selectedCampaignCountries => _selectedCampaignCountries;
  set selectedCampaignCountries(List<String> countries) {
    _selectedCampaignCountries = countries;
    notifyListeners();
  }

  String _selectedCampaignDeviceVersion = "";
  String get selectedCampaignDeviceVersion => _selectedCampaignDeviceVersion;
  set selectedCampaignDeviceVersion(String value) {
    _selectedCampaignDeviceVersion = value;
    notifyListeners();
  }

  bool _phoneOnly = false;
  bool get phoneOnly => _phoneOnly;
  set phoneOnly(bool value) {
    _phoneOnly = value;
    notifyListeners();
  }

  final PageController campaignStepController = PageController();
  int _currentCampaignStep = 0;
  int get currentCampaignStep => _currentCampaignStep;
  set currentCampaignStep(int index) {
    _currentCampaignStep = index;
    notifyListeners();
  }

  final List<Widget> steps = const [
    Step1BasicInfo(),
    Step2BuildUpload(),
    Step3Targeting(),
    Step4TestersSchedule(),
    Step5RewardsBudget(),
    Step6Questionnaire(),
    Step7ReviewLaunch(),
  ];

  void next() {
    if (_currentCampaignStep < steps.length - 1) {
      _currentCampaignStep++;
      notifyListeners();
      campaignStepController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
      );
    }
  }

  void back() {
    if (_currentCampaignStep > 0) {
      _currentCampaignStep--;
      notifyListeners();
      campaignStepController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
      );
    }
  }
}
