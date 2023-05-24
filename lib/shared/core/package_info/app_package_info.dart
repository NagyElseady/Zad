import 'package:package_info_plus/package_info_plus.dart';

class AppPackageInfo {
  static Future<PackageInfo> info() async {
    return await PackageInfo.fromPlatform();
  }

  static Future<String> version() async {
    final package = await info();
    final version = package.version;
    final buildNumber = package.buildNumber;
    return "$version($buildNumber)";
  }
}
