import 'package:flutter/material.dart';

class CustomTextFit extends StatelessWidget {
  CustomTextFit({super.key,required this.enntText,this.mixline=1,required this.ccontroller});
  final String enntText;
  final int mixline;
  String ss ="dffd";
  TextEditingController ccontroller;
 
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
   
    return TextFormField(
       
      controller: ccontroller,
      maxLines: mixline,
       
        decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white,width: 2.0),
          borderRadius: BorderRadius.circular(12)),
      hintText: enntText,
    ));
  }
}
