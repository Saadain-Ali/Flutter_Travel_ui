import 'package:flutter/material.dart';
import 'package:flutter_ui/models/destination_model.dart';
import 'package:flutter_ui/screens/destination_screen.dart';

class DestinationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Top Destinations',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              ),
              GestureDetector(
                onTap: () {
                  print('im see all...');
                },
                child: Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
            // color: Colors.blue,
            height: 300,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: destinations.length,
                itemBuilder: (BuildContext context, int index) {
                  Destination destination = destinations[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              DestinationScreen(destination: destination),
                        )),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      width: 200,
                      // color: Colors.red,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          //Image(image: Image.asset(destinations[index].imageUrl)),
                          Positioned(
                            bottom: 3,
                            child: Container(
                              //color: Colors.red[50],
                              height: 110,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '${destination.activities.length} activities',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      destination.description,
                                      style: TextStyle(color: Colors.black45),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              // color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 6.0)
                              ],
                            ),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              // overflow: Overflow.clip,
                              children: <Widget>[
                                Hero(
                                  tag: destination.imageUrl,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image(
                                      width: 180,
                                      height: 180,
                                      image: AssetImage(destination.imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        destination.city,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.5,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Icon(
                                            Icons.location_on,
                                            size: 15,
                                            color: Colors.white54,
                                          ),
                                          Text(
                                            destination.country,
                                            style: TextStyle(
                                              color: Colors.white54,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }))
      ],
    );
  }
}
