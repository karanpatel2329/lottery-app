import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery_app/features/offers/view/offer.dart';

class OfferController extends GetxController{
  final TextEditingController offerController = TextEditingController();
  RxInt numberOfOffers = 0.obs;
  late ConfettiController centerController;
   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void submitOffer(){
    numberOfOffers.value = int.parse(offerController.text);
    offerController.clear();
    Get.to(const OfferScreen());
  }

 int getRewardAmount(int index) {
    if (index == 0) {
      return 10;
    } else if (index == 1) {
      return 15;
    } else if (index % 2 == 0) {
      return getRewardAmount(index - 1);
    } else {
      return getRewardAmount(index - 3);
    }
  }
}