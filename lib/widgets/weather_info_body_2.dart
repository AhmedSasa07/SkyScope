import 'package:flutter/material.dart';
import 'package:weather_app_2/widgets/heading.dart';
import 'package:weather_app_2/widgets/vertical_weather_card.dart';

class WeatherInfoBody2 extends StatelessWidget {
  const WeatherInfoBody2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("London" , style: TextStyle(fontSize: 32),),
          Text("Heavy Rain Tonight" , style: TextStyle(fontSize: 24),),
          Text("17°" , style: TextStyle(fontSize: 120),),
          Image.asset("assets/images/rainy.png", height: 150,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              info(),
              info(),
              info(),
            ],
          ),
          Container(child: sectionHeadings(title: "Today", color: Colors.white, showActionButton: false,buttonTitle: "Next 7 Days",)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              verticalProductCard(),
              verticalProductCard(),
              verticalProductCard(),
              verticalProductCard(),
              verticalProductCard(),
            ],
          ),



        ],
      ),
    );
  }
}

class info extends StatelessWidget {
  const info({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 90,
          width: 90,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text("17°" , style: TextStyle(fontSize: 48,),)),
          ),
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: Colors.transparent),
          ),
        ),
        Text("Air Index" , style: TextStyle(fontSize: 16),),
      ],
    );
  }
}
