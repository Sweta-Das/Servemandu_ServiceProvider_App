// ignore_for_file: unnecessary_null_comparison, unused_label

import 'package:flutter/material.dart';
import 'package:servemandu_sp_app/model/address.dart';
import '../widgets/simple-app-bar.dart';


class CustomerSupport extends StatefulWidget {
  final Address? model;
  CustomerSupport({this.model});

  @override
  State<CustomerSupport> createState() => _CustomerSupportState();
}

class _CustomerSupportState extends State<CustomerSupport> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: "Customer Support"),    

      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 40),
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage("images/Logo.png"),
              ),
              // Image.asset("images/Logo.png",
              // color: Colors.blueGrey,
              // colorBlendMode: BlendMode.softLight,),
              SizedBox(height: 40,),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'About Servemandu', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.cyan[900],)),
                  ]
                ),
              ),
              SizedBox(height: 20),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Servemandu is a home solution app that delivers service at your door. It bridges the gap between valuable service providers like you and your customers.', style: TextStyle(fontStyle: FontStyle.italic, fontSize: 17, fontWeight: FontWeight.bold, color: Colors.blueGrey)),
                  ]
                ),
              ),

              SizedBox(height: 30),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'For any grievances, please contact our admin at ', style: TextStyle(fontStyle: FontStyle.italic, fontSize: 17, fontWeight: FontWeight.bold, color: Colors.blueGrey)),
                      //TextSpan(text: 'projectservemandu@gmail.com', style: TextStyle(fontSize: 17, color: Colors.lightBlue)),
                      //TextSpan(text: 'location.', style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.blueGrey, fontSize: 17)),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Text("admin@gmail.com", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.cyan[900]),),
                Text('projectservemandu@gmail.com', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.cyan[900])),
                      
            ],
          ),
        )              
        
      )
    );
  }

}