import 'dart:convert';
import 'dart:io';

import 'package:ideasoft_test_case/core/constant/app_constant.dart';
import 'package:ideasoft_test_case/model/category/get_category_model.dart';
import 'package:ideasoft_test_case/product/enum/network_path.dart';
import 'package:http/http.dart' as http;

class CategoryService {
    Future<List<CategoryModel>> getList()async{
 
      List<CategoryModel> liste = [];

    final String networkPath = NetworkPath.category.path;
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
          CategoryModel model = CategoryModel.fromJson(item);

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

  Future<String> putItem(CategoryModel item)async
  {
    final String networkPath = NetworkPath.category.path;
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

  Future<String> postItem(CategoryModel item)async
  {
    final String networkPath = NetworkPath.category.path;
    final uri =  Uri.parse("${AppConstant.baseUrl}$networkPath");
    Map jsonItem = item.toJson();
    var body = json.encode(jsonItem);
   try{
     final response = await http.post(uri,
    headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${AppConstant.token}'
    },
    body: body
    );
    switch(response.statusCode)
    {
      case 201:
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
    final String networkPath = NetworkPath.category.path;
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