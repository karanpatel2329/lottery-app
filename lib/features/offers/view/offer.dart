import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottery_app/features/offers/controller/offer_controller.dart';
import 'package:scratcher/scratcher.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({super.key});

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  OfferController offerController = Get.find<OfferController>();

  @override
  void initState() {
    super.initState();
    offerController.centerController =
        ConfettiController(duration: const Duration(seconds: 3));
  }

  @override
  void dispose() {
    offerController.centerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text('Scratch Card Rewards'),
      ),
      body: Stack(
        children: [
          GridView.builder(
            itemCount: offerController.numberOfOffers.value,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemBuilder: (context, index) {
              int rewardAmount = offerController.getRewardAmount(index);
              return Scratcher(
                brushSize: 60,
                threshold: 90,
                image: const Image(
                  image: AssetImage('assets/images/cover.png'),
                ),
                onChange: (value) {},
                onThreshold: () => offerController.centerController.play(),
                child: Container(
                    height: 250,
                    width: 250,
                    color: Colors.white.withOpacity(0.3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/prize.png",
                          fit: BoxFit.contain,
                          width: 90,
                          height: 90,
                        ),
                        Column(
                          children: [
                            Text(
                              "You won",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: Colors.white
                              ),
                            ),
                            Text(
                              "Rs ${rewardAmount}",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                
                                color: Colors.white
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              );
            },
          ),
          Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              confettiController: offerController.centerController,
              blastDirection: pi / 2,
              maxBlastForce: 5,
              minBlastForce: 1,
              emissionFrequency: 0.03,
              numberOfParticles: 25,
              gravity: 0,
            ),
          ),
        ],
      ),
    );
  }
}
