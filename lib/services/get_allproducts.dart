

import 'package:store_app/helper/api.dart';
import 'package:store_app/modles/product_model.dart';

class AllProductService {
 Future<List<ProductModel>> getallproducts()async{
         List<dynamic> data =await Api().get(url: 'https://fakestoreapi.com/products');


  //اي داتا هترجع هترجع list[] dynamic or map{} of string ,dynamic
  
  List<ProductModel> productList=[];
  for(int i=0;i<data.length;i++){
        productList.add(ProductModel.fromJson(data[i]));
  }
  return productList;


  }
}