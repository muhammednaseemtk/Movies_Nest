// import 'package:flutter/material.dart';
// import 'package:movie_nest/core/app_colors.dart';

// class CustomProfileAvatar extends StatelessWidget {
//   final String? imagePath; // 🔹 nullable (API-safe)
//   final String name;
//   final bool isNetworkImage; // 🔹 logic flag

//   const CustomProfileAvatar({
//     super.key,
//     required this.imagePath,
//     required this.name,
//     this.isNetworkImage = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           padding: const EdgeInsets.all(3),
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: AppColors.txtClr2,
//           ),
//           child: CircleAvatar(
//             radius: 32,
//             backgroundImage: _getImageProvider(),
//           ),
//         ),
//         const SizedBox(height: 8),
//         Text(
//           name,
//           style: TextStyle(
//             color: AppColors.txtClr,
//             fontSize: 13,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ],
//     );
//   }

//   // 🔹 LOGIC ONLY: decide asset vs network
//   ImageProvider _getImageProvider() {
//     if (imagePath == null || imagePath!.isEmpty) {
//       return const AssetImage('asset/image/pp.jpg');
//     }

//     if (isNetworkImage) {
//       return NetworkImage(imagePath!);
//     }

//     return AssetImage(imagePath!);
//   }
// }
