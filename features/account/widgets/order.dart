import 'package:amazonclone/constants/globle_variable.dart';
import 'package:amazonclone/features/account/widgets/single_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {


  //temporary list

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Container(
                padding: const EdgeInsets.only(left: 15),
                child: Text('Your Orders', style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),),
              ),

              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text('See All', style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),),
              ),
              // display products

            ],
          ),
        ),
      Container(
        height: 170,
          padding: const EdgeInsets.only(left: 10, right: 0,top: 20),

        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: ( context, int index){
            return SingleProduct(image: index==0?'https://images.pexels.com/photos/2528118/pexels-photo-2528118.jpeg?auto=compress&cs=tinysrgb&w=600':index==1?
            'https://images.pexels.com/photos/1542252/pexels-photo-1542252.jpeg?auto=compress&cs=tinysrgb&w=600':'https://images.pexels.com/photos/3589903/pexels-photo-3589903.jpeg?auto=compress&cs=tinysrgb&w=600');


        },),
      )
      ],
    );
  }
}
