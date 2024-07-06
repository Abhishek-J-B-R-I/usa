import 'package:flutter/material.dart';
import 'package:weather_forecast_and_current_location/screens/location_screen.dart';
import 'package:weather_forecast_and_current_location/utilities/constants.dart';
import 'package:weather_forecast_and_current_location/services/weather.dart';
class City_screen extends StatefulWidget {
  const City_screen({super.key});

  @override
  State<City_screen> createState() => _City_screenState();
}

class _City_screenState extends State<City_screen> {
  String text_field_input="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/screen_city.jpg"),alignment: Alignment.bottomCenter,
                fit: BoxFit.cover)),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      }, child: Icon(Icons.arrow_back_ios))),
              Container(
                margin: EdgeInsets.all(15),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: k_textfield_decoration,
                  onChanged: (value) {
                    text_field_input=value;
                  },
                  /*onChanged: (value){


                    print(value);
                  },*/
                ),
              ),
              TextButton(onPressed: () async{
                //Navigator.pop(context,await text_field_input);
                Weathermodel livelocation = new Weathermodel();
                var data_weather = await livelocation.city_location_weather(text_field_input);
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return location_screen(weather_data: data_weather);
                }));
              }, child: Text("Get Weather", style: TextStyle( fontSize: 30, color: Colors.white),))
            ],
          ),
        ),
      ),
    );
  }
}
