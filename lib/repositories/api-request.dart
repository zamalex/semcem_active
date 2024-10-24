import 'dart:developer';

import 'package:active_ecommerce_flutter/app_config.dart';
import 'package:active_ecommerce_flutter/helpers/main_helpers.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:active_ecommerce_flutter/middlewares/group_middleware.dart';
import 'package:active_ecommerce_flutter/middlewares/middleware.dart';
import 'package:active_ecommerce_flutter/repositories/aiz_api_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;



class ApiRequest{

  static Future<http.Response> get({required String url, Map<String,String>? headers,Middleware? middleware,GroupMiddleware? groupMiddleWare})async{
    Uri uri = Uri.parse(url);
    Map<String,String>? headerMap=commonHeader;

    if(appDefaultAddress!=null){
      headerMap['country_id']=appDefaultAddress!.country_id.toString();
      headerMap['city_id']=appDefaultAddress!.city_id.toString();
      headerMap['state_id']=appDefaultAddress!.state_id.toString();
    }


    headerMap.addAll(currencyHeader);
    if(headers!=null){
      headerMap.addAll(headers);
    }
  var response =    await http.get(uri,headers: headerMap);

    debugPrint("request ${url}");
    log("response ${response.body}");
    debugPrint("header ${headerMap.toString()}");
    return AIZApiResponse.check(response,middleware: middleware,groupMiddleWare: groupMiddleWare);
  }

  static Future<http.Response> post({required String url, Map<String,String>? headers,required String body,Middleware? middleware,GroupMiddleware? groupMiddleWare})async{
    Uri uri = Uri.parse(url);
    Map<String,String>? headerMap=commonHeader;
    if(appDefaultAddress!=null){
      headerMap['country_id']=appDefaultAddress!.country_id.toString();
      headerMap['city_id']=appDefaultAddress!.city_id.toString();
      headerMap['state_id']=appDefaultAddress!.state_id.toString();
    }
    headerMap.addAll(currencyHeader);
    if(headers!=null){
      headerMap.addAll(headers);
    }
  var response =    await http.post(uri,headers: headerMap,body: body);

    debugPrint("request ${url}");
    debugPrint("response ${response.body}");
    debugPrint("header ${headerMap.toString()}");

    return AIZApiResponse.check(response,middleware: middleware,groupMiddleWare: groupMiddleWare);
  }

  static Future<http.Response> delete({required String url, Map<String,String>? headers,Middleware? middleware,GroupMiddleware? groupMiddleWare})async{
    Uri uri = Uri.parse(url);
    Map<String,String>? headerMap=commonHeader;
    if(appDefaultAddress!=null){
      headerMap['country_id']=appDefaultAddress!.country_id.toString();
      headerMap['city_id']=appDefaultAddress!.city_id.toString();
      headerMap['state_id']=appDefaultAddress!.state_id.toString();
    }
    headerMap.addAll(currencyHeader);

    if(headers!=null){
      headerMap.addAll(headers);
    }
    var response =    await http.delete(uri,headers: headerMap);
    return AIZApiResponse.check(response,middleware: middleware,groupMiddleWare: groupMiddleWare);
  }

}