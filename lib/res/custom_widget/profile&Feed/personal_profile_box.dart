import 'package:flutter/material.dart';

class ButtonPersonal1 extends StatelessWidget {
 final VoidCallback onPressed;
 final String name;
 final String imagePath;

 const ButtonPersonal1({
   Key? key,
   required this.onPressed,
   required this.name,
   required this.imagePath,
 }) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return InkWell(
     onTap: onPressed,
     child: Container(
      //  width: MediaQuery.of(context).size.width*0.14,
      constraints: const BoxConstraints(
        maxWidth: 250,
        minWidth: 100,
      ),
       decoration: BoxDecoration(
         color: const Color(0xFF0763C6),
         borderRadius: BorderRadius.circular(12),
       ),
       child: Row(
         children: [
           ClipOval(
             child: SizedBox(
               child: Image.asset(
                 imagePath,
                 fit: BoxFit.fill,
               ),
             ),
           ),
           const SizedBox(width: 5),
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(
                 'Person',
                 style: TextStyle(
                   fontSize: 18,
                   fontWeight: FontWeight.w800,
                   color: Colors.white.withOpacity(0.4),
                 ),
               ),
               Text(
                 (name.length > 12)?"${name.substring(0,9)}...":name,
                 style: const TextStyle(
                   fontSize: 18,
                   fontWeight: FontWeight.w800,
                   color: Colors.white,
                 ),
               ),
             ],
           ),
           const SizedBox(width: 20),
         ],
       ),
     ),
   );
 }
}


