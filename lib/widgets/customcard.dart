import 'package:flutter/material.dart';
import 'package:store_app/modles/product_model.dart';
import 'package:store_app/screens/update_product_page.dart';

class CustomCard extends StatelessWidget {
   CustomCard({

    super.key,
    required this.product
  });
   ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, UpdateProductPage.id,arguments: product);
      },
      child: Stack(
       clipBehavior:Clip.none,
        children: [
          Container(
           
          // width:200 ,
           //height:130 ,
           decoration:  BoxDecoration(
             color: Colors.white,
             boxShadow: [BoxShadow(
               blurRadius: 40,
               color: Colors.grey.withOpacity(.1),
               spreadRadius: 0,
               offset: const Offset(1,1)
             )]
           ),
            child:  Card(
             elevation: 3,
             color: Colors.white,
             child:Padding(
               padding:const  EdgeInsets.symmetric(horizontal:16,vertical: 16),
               child: Column(crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.end
                 ,children: [
               Text(product.title.substring(0,7),
               style:const TextStyle(fontSize: 17,
               color: Colors.grey
               ),
               ),
                   const SizedBox(height: 4,),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween
                 ,children: [
                 Text(r"$"'${product.price.toString()}',
                  style:const TextStyle(fontSize: 14),
                 ),
                const  Icon(Icons.favorite,
                 color: Colors.red,)
               ],)
                    ],),
             ),),
          ),
          Positioned(right: 30,
          bottom: 75,
          child: 
           Image.network(product.image,height: 100,
           width: 100,)
          )
        ],
      ),
    );
  }
}