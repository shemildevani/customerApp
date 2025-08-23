// import 'package:url_launcher/url_launcher.dart';
// import 'package:virtueinsight/core/config/config.dart';
// import 'package:virtueinsight/core/helpers/url_launcher_helper/web_launcher_loader.dart';

// Future<void> launchContactAction({
//   required String type,
//   required String value,
//   String? subject,
//   String? body,
//   bool openInNewTab = false,
// }) async {
//   Uri uri;

//   if (type == 'phone') {
//     uri = Uri(scheme: 'tel', path: value.replaceAll(' ', ''));
//   } else if (type == 'email') {
//     uri = Uri(
//       scheme: 'mailto',
//       path: value,
//       query: Uri.encodeFull('subject=${subject ?? ''}&body=${body ?? ''}'),
//     );
//   } else if (type == 'link') {
//     print('Link: $value');
//     uri = Uri.parse(value);

//     if (kIsWeb && openInNewTab) {
//       launchInNewTab(uri.toString());
//       return;
//     }
//   } else {
//     throw ArgumentError('Unsupported contact type: $type');
//   }
//   if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
//     throw Exception('Could not launch $uri');
//   }
// }
