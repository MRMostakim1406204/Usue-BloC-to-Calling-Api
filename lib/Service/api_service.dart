import 'package:bloc_api_calling/Model/user_model.dart';
import 'package:dio/dio.dart';

class ApiService{
  Future<List<UsurModel>>getData()async{
   
   List<UsurModel> UsurdataList =[];
   final Dio _dio =Dio();

   try{

    Response response =await _dio.get("https://jsonplaceholder.typicode.com/users");
    if(response.statusCode ==200){
      List<dynamic>data = response.data;
      data.forEach((element) {
        UsurModel usurModel = UsurModel.fromJson(element);
        UsurdataList.add(usurModel);
      });
      return UsurdataList;
    }
    else{
      return [];
    }

   }catch(e){
    throw e;
   }
  }
}