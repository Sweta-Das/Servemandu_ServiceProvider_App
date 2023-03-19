// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:servemandu_sp_app/mainScreens/order_details_screen.dart';
import 'package:servemandu_sp_app/model/items.dart';


class OrderCard extends StatelessWidget
{
  final int? itemCount;
  final List<DocumentSnapshot>? data;
  final String? orderID;
  //final List<String>? seperateQuantitiesList;

  OrderCard({
    this.itemCount,
    this.data,
    this.orderID,
    //this.seperateQuantitiesList,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        //displaying order details after checking out on MyOrderScreen()
        Navigator.push(context, MaterialPageRoute(builder: (c)=> OrderDetailsScreen(orderID: orderID)));
      },

      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black12,
                Colors.white54,
              ],
              begin:  FractionalOffset(0.0, 0.0),
              end:  FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            )
        ),

        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        height: itemCount! * 125,
        child: ListView.builder(
          itemCount: itemCount,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index)
          {
            Items model = Items.fromJson(data![index].data()! as Map<String, dynamic>);
            return placedOrderDesignWidget(model, context, [index]);
          },
        ),
      ),
    );
  }
}




Widget placedOrderDesignWidget(Items model, BuildContext context, seperateQuantitiesList)
{
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 120,
    color: Colors.grey[200],
    child: Row(
      children: [
        Image.network(model.thumbnailUrl!, width: 120,),
        const SizedBox(width: 10.0,),

        //service title
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 20,),

              //service price
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      model.title!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: "Acme",
                      ),
                    ),
                  ),

                  const SizedBox(width: 10,),
                ],
              ),

              const SizedBox(width: 20,),

              Row(
              children: [
                  const Text(
                    "Rs. ",
                    style: TextStyle(fontSize: 16.0, color: Colors.blue),
                  ),
                  Text(
                    model.price.toString(),
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              // Row(
              //   children: [
              //     const Text(
              //         "x ",
              //         style: TextStyle(
              //           color: Colors.black54,
              //           fontSize: 14,
              //         ),
              //     ),
              //     Expanded(
              //       child: Text(
              //         seperateQuantitiesList,
              //         style: const TextStyle(
              //           color: Colors.black54,
              //           fontSize: 30,
              //           fontFamily: "Acme",
              //         ),
              //       ),
              //     ),
              //   ],
              // ),

            ],
          ),
        ),
      ],
    ),
  );
}
