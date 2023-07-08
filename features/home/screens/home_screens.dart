import 'package:amazonclone/features/home/widgets/address_box.dart';
import 'package:amazonclone/providers/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/globle_variable.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName ='/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(


      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: (){},
                          child: Padding(
                            padding: EdgeInsets.only(left:6 ),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 23,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.only(top: 10),
                        hintText: 'Search Amazon.in',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        )

                      ),
                    ),

                  ),


                  //NetworkImage('https://www.pngfind.com/pngs/m/56-565024_amazon-logo-png-amazon-png-transparent-png.png'),
                ),
              ),

              Container(
                padding: const EdgeInsets.only(left: 10,),
                child: Row(
                  children: [

                    SizedBox(width: 15,),
                    Padding(
                      padding: EdgeInsets.only(right: 15 ),
                      child: Icon(Icons.mic,color: Colors.black,),

                    )
                  ],
                ),

              ),
            ],
          ),
        ),
      ),
      body:Column(
        children: [
           AddressBox(),
        ],
      ),



      // Center(
        //child: Text(
       //   user.toJson(),
      //  ),
     // ),
    );
  }
}

