import 'package:flutter/material.dart';
import 'package:flutter_ui/models/hotel_model.dart';

class HotelCaousel extends StatelessWidget {
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
                'Beaches & Hotels',
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
                itemCount: hotels.length,
                itemBuilder: (BuildContext context, int index) {
                  Hotel hotel = hotels[index];
                  return Container(
                    margin: EdgeInsets.all(10),
                    width: 250,
                    // color: Colors.red,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        //Image(image: Image.asset(hotels[index].imageUrl)),
                        Positioned(
                          bottom: -8,
                          child: Container(
                            //color: Colors.red[50],
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(top: 20),
                            height: 110,
                            width: 220,
                            decoration: BoxDecoration(
                                color: Colors.white54,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    hotel.name,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 29,
                                        letterSpacing: 1.5,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    hotel.address,
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 16),
                                  ),
                                  Text(
                                    "\$${hotel.price} / night",
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              width: 200,
                              height: 200,
                              image: AssetImage(hotel.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }))
      ],
    );
  }
}
