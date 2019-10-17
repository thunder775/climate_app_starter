import 'package:clima/loading_screen.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  String cityName;
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 16),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white.withOpacity(.5),
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.white,
                        size: 35,
                      ),
                      hintText: 'Enter your city',
                      hintStyle: TextStyle(color: Colors.black)),
                  onChanged: (String text) {
                    widget.cityName = text;
                    print(widget.cityName);
                  },
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                        (context),
                        MaterialPageRoute(
                            builder: (context) => LoadingScreen(cityName: widget.cityName,)));
                  },
                  child: Text(
                    'Get Weather',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'Spartan MB',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
