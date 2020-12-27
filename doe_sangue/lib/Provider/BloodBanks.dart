
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Models/BloodBank.dart';

class BloodBanks with ChangeNotifier {
  final CollectionReference _banks = Firestore.instance.collection("BloodLocations");

  List<BloodBank> bankList;

  fetchBankList() async {
    try {
      QuerySnapshot querySnapshot = await _banks.getDocuments();
      var list = querySnapshot.documents;

      List<BloodBank> data = list.map((item) => BloodBank(
        title: item['title'],
        phone: item['phone'],
        map: item['map'],
        address: item['address'],
        lat: item['lat'],
        long: item['long']
      )).toList();

      bankList = data;

    } catch (e) {
      throw(e);
    }
  }

  List<BloodBank> getBankList() {
    return bankList;
  }
}