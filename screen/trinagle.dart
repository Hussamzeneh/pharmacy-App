import 'package:flutter/material.dart';


class tringle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Draw Triangle'),
        ),
        body: Container(
          height: 100, width: double.infinity,

          decoration: BoxDecoration(gradient: LinearGradient(

transform: GradientRotation(250),
              stops: [.5  , .5 ],
//            begin: Alignment.topLeft , end:Alignment.bottomRight ,


            colors: [
          Colors.yellow , Colors.pink



        ])),),
      ),
    );
  }
}






class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill; // Change this to PaintingStyle.stroke for just an outline

    var path = Path();
    path.moveTo(size.width / 2, 0); // Top center of the canvas
    path.lineTo(0, size.height); // Bottom left of the canvas
    path.lineTo(size.width, size.height); // Bottom right of the canvas
    path.close(); // Returns the path to the starting point to create a closed shape

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}


  class TrianglePainter2 extends CustomPainter {
  TrianglePainter2({
  required this.firstcolor
  }
  ) ;
  Color firstcolor = Colors.blue ;


  @override
  void paint(Canvas canvas, Size size) {
  var paint = Paint()
  ..color = firstcolor
  ..style = PaintingStyle.fill; // Change this to PaintingStyle.stroke for just an outline

  var path = Path();
  path.moveTo(size.width / 2, 0); // Top center of the canvas
  path.lineTo(size.height, 0); // Bottom left of the canvas
  path.lineTo(size.width, size.height); // Bottom right of the canvas
  path.close(); // Returns the path to the starting point to create a closed shape

  canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
  return false;
  }





  }
