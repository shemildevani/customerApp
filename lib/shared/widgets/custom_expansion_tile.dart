// import '../../core/config/config.dart';

// class CustomExpansionTile extends StatefulWidget {
//   final String title;
//   final Widget? leading;
//   final Widget? trailing;
//   final List<Widget> children;
//   final bool initiallyExpanded;
//   final TextStyle? titleStyle;
//   final EdgeInsetsGeometry? contentPadding;

//   const CustomExpansionTile({
//     required this.title,
//     required this.children,
//     super.key,
//     this.leading,
//     this.trailing,
//     this.initiallyExpanded = false,
//     this.titleStyle,
//     this.contentPadding,
//   });

//   @override
//   State<CustomExpansionTile> createState() => _CustomExpansionTileState();
// }

// class _CustomExpansionTileState extends State<CustomExpansionTile>
//     with SingleTickerProviderStateMixin {
//   late bool _isExpanded;

//   @override
//   void initState() {
//     _isExpanded = widget.initiallyExpanded;
//     super.initState();
//   }

//   void _toggleExpand() {
//     setState(() => _isExpanded = !_isExpanded);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         InkWell(
//           onTap: _toggleExpand,
//           borderRadius: BorderRadius.circular(8),
//           child: Padding(
//             padding:
//                 widget.contentPadding ??
//                 const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             child: Row(
//               children: [
//                 if (widget.leading != null) ...[widget.leading!, AppSpacing.w8],
//                 Expanded(child: Text(widget.title)),
//                 AnimatedRotation(
//                   turns: _isExpanded ? 0.5 : 0,
//                   duration: const Duration(milliseconds: 200),
//                   child:
//                       widget.trailing ??
//                       Icon(
//                         Icons.keyboard_arrow_down,
//                         color: theme.iconTheme.color,
//                       ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         AnimatedCrossFade(
//           firstChild: AppSpacing.empty,
//           secondChild: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               crossAxisAlignment: CrossAxisAlignment.start,
//                 children: widget.children),
//           ),
//           crossFadeState:
//               _isExpanded
//                   ? CrossFadeState.showSecond
//                   : CrossFadeState.showFirst,
//           duration: const Duration(milliseconds: 200),
//         ),
//       ],
//     );
//   }
// }
