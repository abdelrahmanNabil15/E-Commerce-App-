import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../model/cartModel.dart';


class homeSrvice{

  final CollectionReference _CategorycollectionReference=
  FirebaseFirestore.instance.collection("Categories");
  final CollectionReference _ProductcollectionReference=
  FirebaseFirestore.instance.collection("Products");

  final CollectionReference _CartcollectionReference=
  FirebaseFirestore.instance.collection("Cart");


  Future<List<QueryDocumentSnapshot>> getCategory() async{
var value = await _CategorycollectionReference.get();
return value.docs;
  }
  Future<List<QueryDocumentSnapshot>> getBestSelling() async{
    var value = await _ProductcollectionReference.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> AddCart() async{
    var value = await _CartcollectionReference.add( CartModel().toJson());

  }
}