
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';

const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xFF1D1E33);
const buttomContainerColour = Color(0xFFEB1555);
const inactiveCardColour = Color(0xFF111328);

enum Gender{
  male,
  female
}
class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = inactiveCardColour;
  Color femaleCardColour = inactiveCardColour;


  void updateColour(Gender selectedGender){
    if(selectedGender==Gender.male){
      maleCardColour=activeCardColour;
      femaleCardColour=inactiveCardColour;
    }else{
      maleCardColour=inactiveCardColour;
    }
    if(selectedGender==Gender.female){
      femaleCardColour=activeCardColour;
      maleCardColour=inactiveCardColour;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          updateColour(Gender.male);
                      });;},
                      child: ReusableCard(
                  colour: maleCardColour,
                  cardChild: IconContent(icon: FontAwesomeIcons.mars,label: 'MALE',),
                ),
                    )),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColour(Gender.female);
                      });
    }
                    ,
                    child: ReusableCard(
                      colour: femaleCardColour,
                      cardChild: IconContent(icon:FontAwesomeIcons.venus,label: 'FEMALE',),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: ReusableCard(
                colour: inactiveCardColour,
              ))
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(child: ReusableCard(colour: activeCardColour)),
              Expanded(
                  child: ReusableCard(
                colour: inactiveCardColour,
              ))
            ],
          )),
          Container(
            color: buttomContainerColour,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}





