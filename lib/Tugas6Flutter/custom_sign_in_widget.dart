import 'package:flutter/material.dart';
import 'package:ppkd_zahra/Tugas6Flutter/app_color.dart';
import 'package:ppkd_zahra/Tugas6Flutter/custom_image.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({
    super.key,
    required this.customFont, required this.image, required this.text, required this.press
  });

  final String customFont;
  final String image;
  final String text;
  final String press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print(press);
      },
      child: Container(
        padding: const EdgeInsets.only(left: 27.5, right: 27.5, top: 6, bottom: 6),
        decoration: BoxDecoration(border: Border.all(color: AppColor.greywhh),
                                  borderRadius: BorderRadius.circular(10.7)), 
        child: Row(
          spacing: 10,
          children: [
            CustomImage(imagePath: image),
            Text(text, 
            style: TextStyle(fontFamily: customFont, 
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}