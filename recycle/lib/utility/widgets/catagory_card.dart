import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recycle/const/borders/project_borders.dart';
import 'package:recycle/const/padding/project_paddings.dart';

class CatagoryCard extends StatelessWidget with ProjectPaddings {
  CatagoryCard({
    Key? key,
    required this.imagePath,
    this.onPress,
    required this.title,
  }) : super(key: key);
  final String imagePath;
  final Function()? onPress;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingAll8,
      child: InkWell(
        onTap: onPress,
        child: Card(
          shape: const RoundedRectangleBorder(borderRadius: ProjectBorders.radiusCircular12),
          elevation: 5,
          shadowColor: Colors.green.shade200,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: ProjectBorders.radiusCircular12,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(imagePath),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: GoogleFonts.amaranth(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
