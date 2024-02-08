import 'package:campuscollaborate/constants/api_end_points.dart';
import 'package:campuscollaborate/hive_boxes.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

class AuthenticationServices{
  Future<void> loginAuthenticate()async{
   try{
     final result = await FlutterWebAuth.authenticate(
         url: outlookAuthenticationLogin, callbackUrlScheme: "campuscollaborate");
     final String? accessToken = Uri.parse(result).queryParameters['token'];
     if(accessToken==null){
       throw ("Access Token or User not found");
     }
     accessTokenBox.put(accessTokenKey, accessToken);
     loggedInBox.put(loggedInKey, true);
   }catch(e){
     rethrow;
   }
  }
}