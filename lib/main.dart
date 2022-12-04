import 'package:card_swipe/swipe_deck.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'card_data_model.dart';

List<CardDataModel> cardDataList = <CardDataModel>[
  CardDataModel(
    assetImagePath: 'assets/images/arc_de_triomphe-francia.jpg',
    placeName: 'Arc de Triomphe',
    countryName: 'Francia',
  ),
  CardDataModel(
    assetImagePath: 'assets/images/city_hall-san_francisco.jpg',
    placeName: 'City Hall',
    countryName: 'San Francisco',
  ),
  CardDataModel(
    assetImagePath: 'assets/images/eiffel_tower-france.jpg',
    placeName: 'Eiffel Tower',
    countryName: 'France',
  ),
  CardDataModel(
    assetImagePath: 'assets/images/masjid_al_haram-mecca.jpg',
    placeName: 'Masjid al Haram',
    countryName: 'Mecca',
  ),
  CardDataModel(
    assetImagePath: 'assets/images/postcard_shot-cinque_terre.jpg',
    placeName: 'Postcard Shot',
    countryName: 'Cinque Terre',
  ),
  CardDataModel(
    assetImagePath: 'assets/images/taj_mahal-india.jpg',
    placeName: 'Taj Mahal',
    countryName: 'India',
  ),
  CardDataModel(
    assetImagePath: 'assets/images/temple_of_apollo-greece.jpg',
    placeName: 'Temple of Apollo',
    countryName: 'Greece',
  ),
];

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Swipe Deck',
      home: PlacesDeck(),
    );
  }
}

class PlacesDeck extends StatelessWidget {
  const PlacesDeck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Center(child: Text('Discover', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFC8660),
                Color(0xFFF95EA0),
              ],
              stops: [0.0, 1.0],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
            )
        ),
        child: SwipeDeck(
          startIndex: 1,
          cardSpreadInDegrees: 5,
          widgets: cardDataList.map((CardDataModel cardData) => ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(cardData.assetImagePath),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        cardData.placeName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        cardData.countryName,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 30,
                  child: SizedBox(
                    height: 40,
                    child: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                            elevation: 2,
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                              ),
                              child: const Icon(
                                Icons.refresh,
                                size: 17,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),),
                            elevation: 2,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.white,
                              ),
                              child: const Icon(
                                Icons.close,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),),
                            elevation: 2,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.white,
                              ),
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                            elevation: 2,
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                              ),
                              child: const Icon(
                                Icons.star,
                                color: Colors.lightGreen,
                                size: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ).toList(),
        ),
      ),
    );
  }
}