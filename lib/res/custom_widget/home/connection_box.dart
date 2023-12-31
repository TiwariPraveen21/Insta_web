import 'package:flutter/material.dart';
import 'package:info_web_app/res/custom_widget/home/home_style.dart';

class ConnectionsListBox extends StatelessWidget{
  final String name;
  final String imageurl;
  void Function()? onTapCallback;
  ConnectionsListBox({super.key, 
  required this.name, 
  required this.imageurl, 
  required this.onTapCallback
  });

  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.only(top: 10),
     child: Container(
       decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(10),
           border: Border.all(width: 1,color: Colors.grey.shade300)
       ),
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 10),
         child: Column(
           children: [
             const SizedBox(height: 5,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Expanded(
                   child: Row(
                     children: [
                       Container(
                         height: 33,
                         child: const CircleAvatar(
                           backgroundColor: Colors.blueAccent,
                         ),
                       ),
                       const SizedBox(width: 5,),
                       Expanded(child: Text(name,style: AppStyle.connectionTextName,))
                     ],
                   ),
                 ),
                InkWell(
                  onTap:() {
                    
                  },
                  child: InkWell(
                    onTap: onTapCallback,
                    child: Text("Remove",style: AppStyle.connectionTextRemove,)))
               ],
             ),
             const SizedBox(height: 5,)
           ],
         ),
       ),
     ),
   );
  }
}

