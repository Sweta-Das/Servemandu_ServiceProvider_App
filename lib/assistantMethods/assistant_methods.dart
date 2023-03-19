// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:servemandu_sp_app/global/global.dart';


// checking for orders
seperateOrderServiceIDs(orderIDs)
{
  List<String> seperateServiceIDsList=[], defaultServiceList=[];
  int i=0;
  
  // get order placed service Ids from the firestore
  defaultServiceList = List<String>.from(orderIDs);

  for(i; i<defaultServiceList.length; i++)
  {
    //5666777:1 (serviceID : No. of service)
    String item = defaultServiceList[i].toString();
    //var pos = item.lastIndexOf(":"); 

    //5666777
    //String getItemId = (pos != -1) ? item.substring(0, pos) : item;
    String getServiceId = item;
    print("\nThis is serviceID now = " + getServiceId);

    seperateServiceIDsList.add(getServiceId);
  }

  print("\nThis is Services List now = ");
  print(seperateServiceIDsList);

  return seperateServiceIDsList;
}

// checking if item already exists in the cart
seperateServiceIDs()
{
  List<String> seperateServiceIDsList=[], defaultServiceList=[];
  int i=0;
  
  // get services already present in the cart 
  defaultServiceList = sharedPreferences!.getStringList("userCart")!;

  for(i; i<defaultServiceList.length; i++)
  {
    //5666777:1 (serviceID : No. of service)
    String item = defaultServiceList[i].toString();
    //var pos = item.lastIndexOf(":"); 

    //5666777
    //String getItemId = (pos != -1) ? item.substring(0, pos) : item;
    String getServiceId = item;
    print("\nThis is serviceID now = " + getServiceId);

    seperateServiceIDsList.add(getServiceId);
  }

  print("\nThis is Services List now = ");
  print(seperateServiceIDsList);

  return seperateServiceIDsList;
}


// separateOrderItemQuantities(orderIDs)
// {
//   List<String> separateItemQuantityList=[];
//   List<String> defaultItemList=[];
//   int i=1;

//   defaultItemList = List<String>.from(orderIDs);

//   for(i; i<defaultItemList.length; i++)
//   {
//     //56557657:7
//     String item = defaultItemList[i].toString();


//     //0=:
//     //1=7
//     //:7
//     List<String> listItemCharacters = item.split(":").toList();

//     //7
//     var quanNumber = int.parse(listItemCharacters[1].toString());

//     print("\nThis is Quantity Number = " + quanNumber.toString());

//     separateItemQuantityList.add(quanNumber.toString());
//   }

//   print("\nThis is Quantity List now = ");
//   print(separateItemQuantityList);

//   return separateItemQuantityList;
// }

// separateItemQuantities()
// {
//   List<int> separateItemQuantityList=[];
//   List<String> defaultItemList=[];
//   int i=1;

//   defaultItemList = sharedPreferences!.getStringList("userCart")!;

//   for(i; i<defaultItemList.length; i++)
//   {
//     //56557657:7
//     String item = defaultItemList[i].toString();


//                                         //0=:
//                                        //1=7
//     //:7
//     List<String> listItemCharacters = item.split(":").toList();

//                               //7
//     var quanNumber = int.parse(listItemCharacters[1].toString());

//     print("\nThis is Quantity Number = " + quanNumber.toString());

//     separateItemQuantityList.add(quanNumber);
//   }

//   print("\nThis is Quantity List now = ");
//   print(separateItemQuantityList);

//   return separateItemQuantityList;
// }

clearCartNow(context)
{
  //all services from cart are removed except the garbage value; set cart to be empty
  sharedPreferences!.setStringList("userCart", ['garbageValue']);
  
  //get empty cart in our local storage
  List<String>? emptyList = sharedPreferences!.getStringList("userCart");

  //updating firestore database
  FirebaseFirestore.instance
      .collection("users")
      .doc(firebaseAuth.currentUser!.uid)
      .update({"userCart": emptyList}).then((value) // updating cart list
  {
    // checking if the empty cart list is stored locally
    sharedPreferences!.setStringList("userCart", emptyList!);
  });
}