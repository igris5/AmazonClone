import 'package:amazonclone/common/widgets/custom_button.dart';
import 'package:amazonclone/common/widgets/custom_textfield.dart';
import 'package:amazonclone/constants/globle_variable.dart';
import 'package:amazonclone/features/auth/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/bottom_bar.dart';
import '../../home/screens/home_screens.dart';

enum Auth{
  signin,
  signup,

}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth=Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();


  @override
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser(){
    authService.signUpUser(context: context,
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text);
  }

  void signInUser(){
    authService.signInUser(context: context,
        email: _emailController.text,
        password: _passwordController.text,);


  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(

          padding: const EdgeInsets.only(right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                padding: EdgeInsets.only(left: 10),
                child: const Text('WELCOME',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),),
              ),//Welcome heading wla

              ListTile(
                tileColor: _auth== Auth.signup?GlobalVariables.backgroundColor:GlobalVariables.greyBackgroundCOlor,

                title: const Text('Create Account',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth ,
                  onChanged: (Auth? val){
                    setState(() {
                      _auth=val! ;
                    });
                  },
                ) ,
              ),//Create account radio button
               if(_auth== Auth.signup)
                 Container(
                   padding: EdgeInsets.only(left: 10),
                   child: Form(
                     key: _signUpFormKey,
                     child: Column(
                       children: [
                         CustomTextField(
                             controller: _emailController,
                           hintText: 'E-Mail',


                         ),
                         const SizedBox(height: 10,),
                         CustomTextField(
                           controller: _nameController,
                           hintText: 'Name',


                         ),
                         const SizedBox(height: 10,),
                         CustomTextField(
                           controller: _passwordController,
                           hintText: 'password',


                         ),
                         const SizedBox(height: 10,),
                         CustomButton(text: 'Sign-Up',
                             onTap:(){
                           if(_signUpFormKey.currentState!.validate()){
                             signUpUser();
                           }

                         }),

                       ],

                     ),
                   ),
                 ),//uske andr ke elements


              ListTile(
                tileColor: _auth== Auth.signin?GlobalVariables.backgroundColor:GlobalVariables.greyBackgroundCOlor,
                title: const Text('Sign-In.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth ,
                  onChanged: (Auth? val){
                    setState(() {
                      _auth=val! ;
                    });
                  },
                ) ,
              ),
              if (_auth==Auth.signin)
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Form(
                  key: _signInFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _emailController,
                        hintText: 'E-Mail',


                      ),
                      const SizedBox(height: 10,),

                      CustomTextField(
                        controller: _passwordController,
                        hintText: 'password',


                      ),
                      const SizedBox(height: 10,),
                      CustomButton(text: 'Sign-In', onTap:(){

                        Navigator.pushNamedAndRemoveUntil(context, BottomBar.routeName, (route) => false);
                            if(_signInFormKey.currentState!.validate()){
                              ScaffoldMessenger.of(context).showSnackBar(          // yahi h jo niche pop up down hota h msg lekr
                                  SnackBar(content: Text('email-Id registered')));
                              signInUser();
                            }

                      }),

                    ],

                  ),
                ),
              ),


            ],
          ),
        ),
      ) ,
    );
  }
}
