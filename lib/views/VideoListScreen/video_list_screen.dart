import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class VideoListScreen extends StatelessWidget {
  String img;
  String title;
  String slug;

  VideoListScreen({super.key, required this.img, required this.title, required this.slug});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final fireStore = FirebaseFirestore.instance;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * .2,
                width: size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(img), fit: BoxFit.cover)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Container(
                  height: size.height * .2,
                  width: size.width,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.green),
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
           StreamBuilder(
             stream: fireStore.collection('categories').doc(slug).snapshots(),
             builder: (context, snapshot) {
               if(snapshot.connectionState == ConnectionState.waiting){
                 return Center(
                   child: CircularProgressIndicator(),
                 );
               }else{
                 return    Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: ListView.builder(
                     itemCount: snapshot.data!.data()!.length,
                     shrinkWrap: true,
                     primary: false,
                     itemBuilder: (context, index) {
                       final data = snapshot.data!.data()![index];
                       return Padding(
                         padding: const EdgeInsets.only(top: 12),
                         child: Column(
                           children: [
                             Container(
                               decoration: BoxDecoration(
                                   color: Colors.black.withOpacity(0.2),
                                   borderRadius: BorderRadius.circular(12)),
                               child: Padding(
                                 padding: const EdgeInsets.only(bottom: 10),
                                 child: Column(
                                   children: [
                                     Container(
                                       height: size.height * .2,
                                       width: size.width,
                                       // color: Colors.green,
                                       decoration: BoxDecoration(
                                           border: Border.all(
                                               width: 2, color: Colors.green),
                                           borderRadius: BorderRadius.circular(12),
                                           image: DecorationImage(
                                               image: NetworkImage(data['image']),
                                               fit: BoxFit.cover)),
                                     ),
                                     SizedBox(height: 5,),
                                     Text(
                                       data['title'],
                                       style: const TextStyle(
                                           fontSize: 15, fontWeight: FontWeight.bold),
                                     )
                                   ],
                                 ),
                               ),
                             ),
                           ],
                         ),
                       );
                     },
                   ),
                 );
               }
             },
           )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: black.withOpacity(.3),
        height: 60,
        width: size.width,
      ),
    );
  }
}
