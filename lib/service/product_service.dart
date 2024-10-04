import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:ideasoft_test_case/core/constant/app_constant.dart';
import 'package:ideasoft_test_case/model/product/get_product_model.dart';
import 'package:ideasoft_test_case/product/enum/network_path.dart';

class ProductService
{

  Future<List<ProductModel>> getList()async{
 
      List<ProductModel> liste = [];

    final String networkPath = NetworkPath.product.path;
    final uri =  Uri.parse("${AppConstant.baseUrl}$networkPath");
    final response = await http.get(uri,
    headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${AppConstant.token}'
    });

    switch(response.statusCode)
    {
      case HttpStatus.ok:
      try
      {
        final jsonModel = json.decode(response.body);
        for(var item in jsonModel)
        {
          ProductModel model = ProductModel.fromJson(item);

          liste.add(model);
        }
        return liste;
        
      }
      catch(e)
      {
        throw Exception(e);
      }
        
      default:
        return Future.error(response.statusCode);
    }
  }

  Future<String> putItem(ProductModel item)async
  {
    final String networkPath = NetworkPath.product.path;
    final uri =  Uri.parse("${AppConstant.baseUrl}$networkPath/${item.id}");
    Map jsonItem = item.toJson();
    var body = json.encode(jsonItem);
   try{
     final response = await http.put(uri,
    headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${AppConstant.token}'
    },
    body: body
    );
    switch(response.statusCode)
    {
      case 200:
      try
      {
        return "OK";
        
      }
      catch(e)
      {
        throw Exception(e);
      }
        
      default:
        return Future.error(response.statusCode);
    }
   }
   catch(e)
   {
    throw Exception(e);
   }

    
  }

  Future<String> deleteItem(int id)async
  {
    final String networkPath = NetworkPath.product.path;
    final uri =  Uri.parse("${AppConstant.baseUrl}$networkPath/$id");
    
    final response = await http.delete(uri,
    headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${AppConstant.token}'
    },
    
    );

    switch(response.statusCode)
    {
      case 204:
      try
      {
        
          return "OK";
        
      }
      catch(e)
      {
        throw Exception(e);
      }
        
      default:
        return Future.error(response.statusCode);
    }
  }

}