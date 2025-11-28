import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ReportProvider extends ChangeNotifier {
  String _selectedReportSeverity = 'minor';
  String get selectedReportSeverity => _selectedReportSeverity;
  set selectedReportSeverity(String value) {
    _selectedReportSeverity = value;
    notifyListeners();
  }

  final List<String> reportSeverities = [
    'critical',
    'suggestion',
    'major',
    'minor',
  ];

  String deviceInfo = 'Collecting device info...';
  bool hasCrashLog = false;
  bool hasSessionReplay = true;
  int replayDuration = 127; // seconds

  Future<void> collectDeviceInfo() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    final packageInfo = await PackageInfo.fromPlatform();

    String info = '';
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfoPlugin.androidInfo;
      info =
          '${androidInfo.brand} ${androidInfo.model} • Android ${androidInfo.version.release} • TestBounty v${packageInfo.version}';
    } else {
      final iosInfo = await deviceInfoPlugin.iosInfo;
      info =
          '${iosInfo.utsname.machine} • iOS ${iosInfo.systemVersion} • TestBounty v${packageInfo.version}';
    }

    deviceInfo = info;
    hasCrashLog = true; // Simulate crash log detected
    notifyListeners();
  }
}
