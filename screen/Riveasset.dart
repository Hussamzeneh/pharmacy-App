import 'package:flutter/cupertino.dart';
import 'package:pharmacy/screen/Signup.dart';
import 'package:pharmacy/screen/login.dart';
import 'package:rive/rive.dart';

import 'homepage2.dart';

class RiveAsset {
  final String ? artboard , stateMachineName , titile , src ;
  late SMIBool? input;
  int? index;

  RiveAsset({required this.src,required this.artboard,required this.stateMachineName,required this.titile ,this.input , this.index});
  set setInput (SMIBool Status){
    input = Status;
  }



}
List <RiveAsset> bottomnavs = [
  RiveAsset(src: 'RiveAssets/icons.riv', artboard: "HOME", stateMachineName: "HOME_interactivity", titile: "HOME" ,index: 0),
  RiveAsset(src: 'RiveAssets/icons.riv', artboard: "CHAT", stateMachineName: "CHAT_Interactivity", titile: "CHAT" ,index: 1) ,
  RiveAsset(src: 'RiveAssets/icons.riv', artboard: "SEARCH", stateMachineName: "SEARCH_Interactivity", titile: "SEARCH" ,index: 2) ,

  RiveAsset(src: 'RiveAssets/icons.riv', artboard: "USER", stateMachineName: "USER_Interactivity", titile: "USER" , index: 3),
  RiveAsset(src: 'RiveAssets/icons.riv', artboard: "LIKE/STAR", stateMachineName: "STAR_Interactivity", titile: "BELL" ,index: 4) ,
  RiveAsset(src: 'RiveAssets/icons.riv', artboard: "SETTINGS", stateMachineName: "SETTINGS_Interactivity", titile: "USER" , index: 5)

];

    List<RiveAsset> spidermenu2 = [
      RiveAsset(src: 'RiveAssets/icons.riv', artboard: "HOME", stateMachineName: "HOME_interactivity", titile: "HOME" ,index: 0),
      RiveAsset(src: 'RiveAssets/icons.riv', artboard: "CHAT", stateMachineName: "CHAT_Interactivity", titile: "CHAT" ,index: 1) ,
      RiveAsset(src: 'RiveAssets/icons.riv', artboard: "SEARCH", stateMachineName: "SEARCH_Interactivity", titile: "SEARCH" ,index: 2) ,

      RiveAsset(src: 'RiveAssets/icons.riv', artboard: "USER", stateMachineName: "USER_Interactivity", titile: "USER" , index: 3),
      RiveAsset(src: 'RiveAssets/icons.riv', artboard: "LIKE/STAR", stateMachineName: "STAR_Interactivity", titile: "FAVOURITE" ,index: 4) ,
      RiveAsset(src: 'RiveAssets/icons.riv', artboard: "SETTINGS", stateMachineName: "SETTINGS_Interactivity", titile: "SETTINGS" , index: 5)


    ];

    List<RiveAsset> spidermenu3 = [
      RiveAsset(src: 'RiveAssets/icons.riv', artboard: "TIMER", stateMachineName: "TIMER_Interactivity", titile: "HISTORY" , index: 5) ,
      RiveAsset(src: 'RiveAssets/icons.riv', artboard: "BELL", stateMachineName: "BELL_Interactivity", titile: "NOTIFCATIONS" , index: 5)

    ];
Widget? getSelectedWidget({required  index}){
  Widget? widget;
  switch(index){
    case 0:
      widget =homepage2();
      break;
    case 1:
      widget = login();
      break; case 2:
    widget = Signup();
    break; case 3:
    widget = null;
    break;case 4:
    widget = null;
    break;case 5 :
    widget= null;
    break;

  }
  return widget;
}


    class RiveUtils{
static StateMachineController getRivecontroller(Artboard artboard , {StateMachineName = "State Machine 1"}){
    StateMachineController? controller=
    StateMachineController.fromArtboard(artboard, StateMachineName);
    artboard.addController(controller!);
    return controller;
  }

    }

