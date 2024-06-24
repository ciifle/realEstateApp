import 'package:flutter/material.dart';
class DetailPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image at the top
          Container(
            height: 320,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/h1.jpg'), // Placeholder image path
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.transparent.withOpacity(.66),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(Icons.arrow_back,size: 30,color: Colors.white,),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.transparent.withOpacity(.66),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(Icons.favorite,size: 30,color: Colors.white,),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Container with rounded corners at the bottom
          Positioned(
            top: 280, // Adjust the top position to overlap with the image
            left: 0,
            right: 0,
            child: Container(
              // height: MediaQuery.of(context).size.height - 150, // Adjust the height to fill the remaining space
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                   child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("house name",style: TextStyle(
                         fontSize: 22,
                         fontWeight: FontWeight.bold,
                       ),),
                       Row(
                         children: [
                           Image.asset("assets/favourites.png",width: 12,height: 12,),
                           SizedBox(width: 5,),
                           Text("3.5",style: TextStyle(fontWeight: FontWeight.bold),),
                         ],
                       ),
                     ],
                   ),
                 ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("house name",style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),),
                      Row(
                        children: [
                          Image.asset("assets/favourites.png",width: 12,height: 12,),
                          SizedBox(width: 5,),
                          Text("3.5",style: TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
