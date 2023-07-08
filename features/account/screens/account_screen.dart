import 'package:amazonclone/constants/globle_variable.dart';
import 'package:amazonclone/features/account/widgets/below_app_bar.dart';
import 'package:amazonclone/features/account/widgets/order.dart';
import 'package:amazonclone/features/account/widgets/top_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Container(
                alignment: Alignment.topLeft,
                child: Image(
                  image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-UaL5mHUS6ps3M_VluqwEVs1Lwv3hbSZeGQ&usqp=CAU'),
                  width: 120,
                  height: 45,

                ),


                //NetworkImage('https://www.pngfind.com/pngs/m/56-565024_amazon-logo-png-amazon-png-transparent-png.png'),
              ),

              Container(
                padding: const EdgeInsets.only(left: 10,),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 15 ),
                      child: Icon(Icons.notifications_outlined),

                    ),
                    SizedBox(width: 20,),
                    Padding(
                      padding: EdgeInsets.only(right: 15 ),
                      child: Icon(Icons.search_outlined),

                    )
                  ],
                ),

              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          BelowAppBar(),
          SizedBox(height: 10,),
          TopButtons(),
          SizedBox(height: 20,),
          Orders(),

        ],
      ),

    );
  }
}
