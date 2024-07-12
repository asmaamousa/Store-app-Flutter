import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/modles/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_textfield.dart';

class UpdateProductPage extends StatefulWidget {
    const  UpdateProductPage({super.key});
 static String id="update product";

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
 String? productname,desc,image;

 String? price;
 bool isloading=false;

  @override
  Widget build(BuildContext context) {
    var product=ModalRoute.of(context)!.settings.arguments as ProductModel;
    return  ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
      appBar: AppBar(
         centerTitle: true,
       elevation: 0,
        title: const Text("Udate Product",),
        
        //style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
      
       
      ),
      body:  
      Padding(
        padding: const EdgeInsets.all(16),
        child: 
        SingleChildScrollView(
      child: Column(
      children: [ const SizedBox(height: 100,),
       
       
       CustomTextFeild(
        hintText: 'Producut Name',
       onChanged: (data){
        productname=data;
       },
       ),
      
       const SizedBox(height: 10,),
        CustomTextFeild( onChanged: (data){
        desc=data;},
        hintText: 'Describtion'),
      
        const SizedBox(height: 10,),
      
         CustomTextFeild(onChanged: (data){
        price=data;}
          ,hintText: 'Price',
         // inputType: TextInputType.number,
          ),
      
         const SizedBox(height: 10,),
      
          CustomTextFeild(onChanged: (data){
        image=data;},
            hintText: 'Image'),
      
           const SizedBox(height: 50,),
      
           CustomButton(
            text: 'Update',
            
            onTap:() async{
              isloading=true;
            setState(() { });
            try {
              await ubdateProduct(product);
               print("success");
              
            } catch (e) {
              print(e.toString());
              
               
            }
               isloading=false;
                setState(() {
                  
                });
              
             },
          
            )
        
      ],),
        )
       
      )
      
      
      ),
    );
  }

  Future<void> ubdateProduct(ProductModel product) async {
   await  UpdateProductService().updateProduct(
    id: product.id,
      title: productname==null?product.title:productname!,
      price:price==null? product.price.toString(): price!, 
      desc: desc==null?product.description:desc!,
       image: image==null?product.image: image!,
      category:product.category );
     isloading=false;
  }
}