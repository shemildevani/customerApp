import 'package:customer_app/config/utils/app_spacing.dart';
import 'package:customer_app/shared/widgets/app_text.dart';
import 'package:flutter/material.dart';

class BusinessOpenClosedStatus extends StatelessWidget {
  final bool isOpen;
  final double fontSize;

  const BusinessOpenClosedStatus({
    super.key,
    required this.isOpen,
    this.fontSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color:
            isOpen
                // ignore: deprecated_member_use
                ? Colors.green.withOpacity(0.15)
                // ignore: deprecated_member_use
                : Colors.red.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.circle,
            size: 10,
            color: isOpen ? Colors.green.shade700 : Colors.red.shade700,
          ),
          AppSpacing.w4,
          AppText(
            text: isOpen ? "Open" : "Closed",
            fontSize: fontSize,
            color: isOpen ? Colors.green.shade800 : Colors.red.shade800,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}



// Container(
//                             width: 70,
//                             padding: EdgeInsets.symmetric(
//                               horizontal: 8,
//                               vertical: 4,
//                             ),
//                             decoration: BoxDecoration(
//                               // ignore: deprecated_member_use
//                               color: Colors.green.withOpacity(0.15),
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: Row(
//                               children: [
//                                 Icon(
//                                   Icons.circle,
//                                   size: 10,
//                                   color: Colors.green.shade700,
//                                 ),
//                                 AppSpacing.w4,
//                                 AppText(
//                                   text: "open",

//                                   color: Colors.green.shade800,
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 12,
//                                 ),
//                               ],
//                             ),
//                           ),