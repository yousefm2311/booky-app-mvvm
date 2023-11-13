
import 'package:bookly_full_app_mvvm/core/utils/functions/custom_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(context, String? url) async {
  if (url != null) {
    Uri uil = Uri.parse(url);
    if (await canLaunchUrl(uil)) {
      await launchUrl(uil);
    } else {
      customSnackBar(context, text: 'cannot launch url');
    }
  }
}



