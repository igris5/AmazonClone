import 'dart:convert';

import 'package:amazonclone/common/widgets/bottom_bar.dart';
import 'package:amazonclone/constants/error_handling.dart';
import 'package:amazonclone/constants/utils.dart';
import 'package:amazonclone/features/home/screens/home_screens.dart';
import 'package:amazonclone/models/user.dart';
import 'package:amazonclone/providers/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/globle_variable.dart';
class AuthService {

  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
}) async {
    try{
       User user = User(
           id: '',
           name: name,
           token: '',
           address: '',
           password: password,
           email: email,
           type: ''
       );

       http.Response res= await http.post(Uri.parse('$uri/api/signup'),
           body: user.toJson(),
           headers:  <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
           },

       );

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: (){
            showSnackBar(context, 'Account created! Login with the same Credentials');
        
      });
    } catch(e){
      showSnackBar(context, e.toString());

    }

  }


  //sign in ke lie
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,

  }) async {
    try{



      http.Response res= await http.post(Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'email': email,
          'passwoed': password,
        }),
        headers:  <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },

      );
       //print(res.body);
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: ()async{

          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          Navigator.pushNamedAndRemoveUntil(context, BottomBar.routeName, (route) => false);

          });
    } catch(e){
      showSnackBar(context, e.toString());

    }

  }





  void getUserData(
    BuildContext context,


  ) async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if(token == null) {
        prefs.setString('x-auth-token', '');
      }

       var tokenRes = await http.post(
         Uri.parse('$uri/tokenIsValid'),
         headers: <String, String>{
           'Content-Type': 'application/json; charset=UTF-8',
           'x-auth-token':token!

         },
       );


        var response = jsonDecode(tokenRes.body);
        if(response == true){
         http.Response userRes = await http.get(Uri.parse('$uri'),
           headers: <String, String>{
             'Content-Type': 'application/json; charset=UTF-8',
             'x-auth-token':token

           },

         );

         var userProvider = Provider.of<UserProvider>(context, listen: false);
         userProvider.setUser(userRes.body);
        }
      //http.Response res= await http.post(Uri.parse('$uri/api/signin'),
       // body: jsonEncode({
       //   'email': email,
       //   'passwoed': password,
       // }),
        //headers:  <String, String>{
        //  'Content-Type': 'application/json; charset=UTF-8',
       // },

      //);
      //print(res.body);
     // httpErrorHandle(
      //    response: res,
      //    context: context,
      //    onSuccess: ()async{

      //      SharedPreferences prefs = await SharedPreferences.getInstance();
       //     Provider.of<UserProvider>(context, listen: false).setUser(res.body);
       //     await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
       //     Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);

       //   });
    } catch(e){
      showSnackBar(context, e.toString());

    }

  }

}