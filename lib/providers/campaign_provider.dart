import 'package:flutter/material.dart';
import 'package:test_bounty/core/enums.dart';
import 'package:test_bounty/core/theme.dart';
import 'package:test_bounty/screens/developers/campaign/create_campaign/step1_basic_info.dart';
import 'package:test_bounty/screens/developers/campaign/create_campaign/step2_build_upload.dart';
import 'package:test_bounty/screens/developers/campaign/create_campaign/step3_targeting.dart';
import 'package:test_bounty/screens/developers/campaign/create_campaign/step4_testers_schedule.dart';
import 'package:test_bounty/screens/developers/campaign/create_campaign/step5_rewards_budget.dart';
import 'package:test_bounty/screens/developers/campaign/create_campaign/step6_test_plan.dart';
import 'package:test_bounty/screens/developers/campaign/create_campaign/step7_questionnaire.dart';
import 'package:test_bounty/screens/developers/campaign/create_campaign/step8_review_launch.dart';

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

  List<String> campaignTestDuration = [
    "3 days",
    "7 days",
    "14 days",
    "21 days",
    "30 days",
    "90 days",
  ];

  List<int> campaignAges = [12, 13, 16, 18, 30, 50];

  List<int> _selectedCampaignAges = [];
  List<int> get selectedCampaignAges => _selectedCampaignAges;
  set selectedCampaignAges(List<int> value) {
    _selectedCampaignAges = value;
    notifyListeners();
  }

  int _numberOfCampaignTesters = 10;
  int get numberOfCampaignTesters => _numberOfCampaignTesters;
  set numberOfCampaignTesters(int value) {
    _numberOfCampaignTesters = value;
    notifyListeners();
  }

  int _campaignRewardPerTester = 1;
  int get campaignRewardPerTester => _campaignRewardPerTester;
  void updateCampaignRewardPerTester(bool increment) {
    if (increment) {
      _campaignRewardPerTester++;
    } else {
      if (_campaignRewardPerTester > 1) {
        _campaignRewardPerTester--;
      }
    }
    notifyListeners();
  }

  String _selectedCampaignTestDuration = "3 days";
  String get selectedCampaignTestDuration => _selectedCampaignTestDuration;
  set selectedCampaignTestDuration(String value) {
    _selectedCampaignTestDuration = value;
    notifyListeners();
  }

  List<String> _selectedCampaignCountries = [];
  List<String> get selectedCampaignCountries => _selectedCampaignCountries;
  set selectedCampaignCountries(List<String> countries) {
    _selectedCampaignCountries = countries;
    notifyListeners();
  }

  final _tenPercent = (10 / 100);
  int get _productRewardAndTesters =>
      (_campaignRewardPerTester * _numberOfCampaignTesters);
  double get totalCampaignPayment =>
      _productRewardAndTesters + (_productRewardAndTesters * _tenPercent);

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  final List<Widget> steps = const [
    Step1BasicInfo(),
    Step2BuildUpload(),
    Step3Targeting(),
    Step4TestersSchedule(),
    Step5RewardsBudget(),
    Step6TestPlan(),
    Step7Questionnaire(),
    Step8ReviewLaunch(),
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

  void goToPage(int page) {
    _currentCampaignStep = page;
    notifyListeners();
    campaignStepController.animateToPage(
      page,
      duration: const Duration(milliseconds: 400),
      curve: Curves.ease,
    );
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
