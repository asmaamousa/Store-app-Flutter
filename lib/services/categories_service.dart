
import 'package:store_app/helper/api.dart';
import 'package:store_app/modles/product_model.dart';

class CategoriesServies {
  Future<List<ProductModel>> getCatrgories({required String categoryName})async{
        List<dynamic> data =await Api().get(url: "https://fakestoreapi.com/products/category/$categoryName");

   
    //اي داتا هترجع هترجع list[] dynamic or map{} of string ,dynamic

    List<ProductModel> productList=[];
    for(int i=0;i<data.length;i++){
          productList.add(ProductModel.fromJson(data[i]));
    }
    return productList;}
 
  }
