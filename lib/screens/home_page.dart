import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/modles/product_model.dart';
import 'package:store_app/services/get_allproducts.dart';
import 'package:store_app/widgets/customcard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
 static String id="HomePAge";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){},icon: const Icon(FontAwesomeIcons.cartPlus,
        color: Colors.black,
        ))],
        elevation: 0,
        centerTitle: true,
        title:const Text("New Trend",
        style: TextStyle(color: Colors.black),
        ),
      ),

     body:Padding(
       padding: const EdgeInsets.only(left: 16,right: 16,top:80),
       child: FutureBuilder<List<ProductModel>> (
        future:AllProductService().getallproducts() , 
        builder: (context,Snapshot){
        if (Snapshot.hasData) {
          List<ProductModel> products=Snapshot.data!;
  return GridView.builder(
    itemCount: products.length,
  clipBehavior: Clip.none,
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //عدد الاعمدة
  crossAxisCount: 2,
  //بيتحكم في حجم الشيلد
         childAspectRatio: 1.8,
         //البعد عنلي محور x
         crossAxisSpacing: 25,
         mainAxisSpacing: 100,
         
         )
         , itemBuilder: (context,index){
  return  CustomCard(product: products[index],);
         });
}
else{
  return const Center(child:  CircularProgressIndicator());
}
       }),
     ),
    );
  }
}

