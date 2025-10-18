import 'package:flutter/material.dart';
import 'package:ppkd_zahra/Tugas6Flutter/app_color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.title,  this.isPassword=false});
  final String title;
  final bool isPassword;
  static String customFont = 'WorkSans';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(fontFamily: customFont, fontSize: 18, fontWeight: FontWeight.w600)),
            Row(
              children: [
                if (isPassword)
                InkWell(
                  onTap: () {
                    print("Menekan Forgot Password!");
                  },
                  child: Text("Forgot password?", style: TextStyle(fontFamily: customFont, fontSize: 15, color: AppColor.blueFF, fontWeight: FontWeight.w600))),
              ],
            ),
          ],
        ),
        TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(2.0),
                  enabledBorder: borderConst(),
                  focusedBorder: borderConst(),
                  border: borderConst(),
                  suffixIcon: isPassword? Icon(Icons.visibility, color: AppColor.greywh) : null
                ),
        ),
      ],
    );
  }

  OutlineInputBorder borderConst() => OutlineInputBorder(borderRadius: BorderRadius.circular(10.7), borderSide: BorderSide(width: 0,strokeAlign: 0 ));
}