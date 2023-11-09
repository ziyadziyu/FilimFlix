import 'package:flutter/material.dart';

class SqaurTile extends StatelessWidget {
  final String imagePath;
  const SqaurTile({super.key, required this.imagePath});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color:Colors.grey[200] ,
        border: Border.all(color: Colors.white)
      ),
      child: Image.asset(imagePath,height: 45,),
    ) ;
  }
}
