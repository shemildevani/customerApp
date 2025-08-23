// import 'package:virtueinsight/core/config/theme/app_theme.dart';

// import '../../core/config/config.dart';

// class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final AppBar? appBar;
//   final String? title;
//   final String? subtitle;
//   final PreferredSizeWidget? bottom;
//   final List<Widget>? actions;

//   const BaseAppBar({
//     super.key,
//     this.title,
//     this.appBar,
//     this.subtitle,
//     this.bottom,
//     this.actions,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: AppColors.transparent,
//       actions:
//           actions ??
//           [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: IconButton(
//                 icon: Icon(
//                   context.watch<ThemeProvider>().isDarkMode
//                       ? Icons.dark_mode
//                       : Icons.light_mode,
//                   color:
//                       context.watch<ThemeProvider>().isDarkMode
//                           ? Colors.red
//                           : Colors.black,
//                 ),
//                 onPressed: () {
//                   context.read<ThemeProvider>().toggleTheme();
//                 },
//               ),
//             ),
//           ],

//       bottom: bottom,
//       title: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           AppSpacing.h10,
//           Text(
//             title ?? 'N/A',
//             style: Theme.of(context).appBarTheme.titleTextStyle,
//           ),
//           AppSpacing.h4,
//           Text(
//             subtitle ?? 'N/A',
//             style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
//               fontSize: 14,
//               fontWeight: FontWeight.w400,
//               color: AppColors.red,
//             ),
//           ),
//         ],
//       ),
//       centerTitle: false,
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(appBar?.preferredSize.height ?? 65);
// }
