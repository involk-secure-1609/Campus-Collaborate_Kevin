import 'dart:convert';
import 'package:campuscollaborate/constants/api_end_points.dart';
import 'package:campuscollaborate/services/get_access_token.dart';
import 'package:http/http.dart' as http;
import '../models/user_info.dart';

class UserServices{
  Future<UserInfo> getCurrentUserDetails()async{
   try{
     final String accessToken=await GetAccessTokenService.accessToken();
     final http.Response response= await http.get(Uri.parse('$globalApiPoint${userEndPoint}userById'),
         headers: {
           'Cookie': accessToken,
           'Content-Type': 'application/json'
         }
     );
     final UserInfo userInfo= UserInfo.fromJson(jsonDecode(response.body));
     return userInfo;
   }catch(e){
     rethrow;
   }
  }
}