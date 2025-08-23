// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:customer_app/config/app_color/app_color.dart';
// import 'package:customer_app/shared/widgets/app_text.dart';

// class AddDropDownButton<T> extends StatelessWidget {
//   const AddDropDownButton({
//     super.key,
//     required this.items,
//     this.onChanged,
//     required this.hintText,
//     this.value,
//     required this.validator,
//   });

//   final List<T> items;
//   final void Function(String?)? onChanged;
//   final String hintText;
//   final String? value;
//   final String? Function(String?)? validator;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField2<String>(
//       isExpanded: true,
//       decoration: InputDecoration(
//         contentPadding: const EdgeInsets.symmetric(vertical: 16),
//         border: OutlineInputBorder(
//           borderSide: BorderSide(color: AppColors.grey),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: AppColors.primary, width: 2),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: AppColors.grey),
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),

//       hint: AppText(text: hintText, fontSize: 14),
//       items:
//           items
//               .map(
//                 (item) => DropdownMenuItem<String>(
//                   value: item.toString(),
//                   child: Text(
//                     item.toString(),
//                     style: GoogleFonts.sora(fontSize: 14),
//                   ),
//                 ),
//               )
//               .toList(),
//       validator: validator,
//       onChanged: onChanged,
//       value: value,
//       buttonStyleData: const ButtonStyleData(
//         padding: EdgeInsets.only(right: 8),
//       ),
//       iconStyleData: IconStyleData(
//         icon: Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.black),
//         iconSize: 24,
//       ),
//       dropdownStyleData: DropdownStyleData(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           color: AppColors.white,
//         ),
//       ),
//       menuItemStyleData: const MenuItemStyleData(
//         padding: EdgeInsets.symmetric(horizontal: 10),
//       ),
//     );
//   }
// }
