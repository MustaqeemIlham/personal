import 'package:url_launcher/url_launcher.dart';

class UrlUtils {
  static Future<void> launchExternal(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  static Future<void> launchEmail(String email) async {
    final uri = Uri.parse(email);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
