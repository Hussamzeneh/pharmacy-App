import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Costom Widget/ContactCard.dart';
import '../theme/themeprovider.dart';
import 'homepage.dart';

class ContactListPage extends StatelessWidget {
  const ContactListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar:  AppBar(
        actions: [ Switch(
            activeColor: Color(0xffFF28C34C),
            value: switchvalue,
            onChanged: (newValue) {
              switchvalue = newValue;
              Provider.of<themeproviedr>(context, listen: false)
                  .toggleTheme();
            }),],
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft :Radius.circular(12) ,bottomRight: Radius.circular(12) )
        ),

        title: Text('TEACHER LIST' , style: TextStyle(color: Colors.white),),
        centerTitle:  true,
        backgroundColor: Colors.purple,

      ),
      body: PerspectiveListView(
        visualizedItems: 8,
        itemExtent:  MediaQuery.of(context).size.height *.33,
        initialIndex:  10,
        backItemsShadowColor: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.all(10),
        children: List.generate(20, (index) {
          final borderColor = Colors.accents[index %Colors.accents.length];
          return ContactCard(borderColor: borderColor);

        }),



      ),

    );
  }
}

class PerspectiveListView extends StatefulWidget {
  final List<Widget> children ;
  final double itemExtent;
  final int visualizedItems;
  final int initialIndex ;
  final EdgeInsetsGeometry padding;
  final ValueChanged<int>  ?onTapFrontItem ;
  final ValueChanged<int> ? onChangedItem ;
  final Color ? backItemsShadowColor ;
  const PerspectiveListView({
    super.key, required this.children, required this.itemExtent, required this.visualizedItems,  this.initialIndex = 0,  this.padding = const EdgeInsets.all(0.0),  this.onTapFrontItem,  this.onChangedItem,  this.backItemsShadowColor = Colors.black,
  });


  @override
  State<PerspectiveListView> createState() => _PerspectiveListViewState();
}

class _PerspectiveListViewState extends State<PerspectiveListView> {
  PageController? _pageController;

  double? _pagePercent;

  int? _curentindex ;

  void initState(){
    _pageController = PageController(
      initialPage:  widget.initialIndex ,
      viewportFraction: 1/widget.visualizedItems ,


    );
    _curentindex = widget.initialIndex;
    _pagePercent = 0.0 ;
    _pageController?.addListener(_pageListner);

    super.initState();

  }


  @override
  void dispose() {
   _pageController?.removeListener(_pageListner);
   _pageController?.dispose();
    super.dispose();
  }
  void _pageListner(){
    _curentindex = _pageController?.page?.floor();
    _pagePercent = (_pageController!.page! - _curentindex!).abs();
    setState(() {

    });

  }
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context , constraints){
      final height = constraints.maxHeight;

        return Stack(
          children: [
            Padding(
              padding: widget.padding,
              child: _PerspectiveItems(
                heightItem: widget.itemExtent ,
                currentIndex: _curentindex!,
                cheldrend: widget.children,
                generateItems: widget.visualizedItems -1,
                pagePercent:  _pagePercent!,






              ),
            ) ,
            Positioned.fill(

                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin:  Alignment.topCenter ,
                      end: Alignment.bottomCenter ,
                      colors: [
                        widget.backItemsShadowColor!.withOpacity(0.1),
                        widget.backItemsShadowColor!.withOpacity(0)

                      ]

                    )

                  ),
                ))



,
            PageView.builder(
              scrollDirection:  Axis.vertical ,
              controller: _pageController,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (value){
                if(widget.onChangedItem!=null){

                  widget.onChangedItem!(value);
                }


              },
              itemCount: widget.children.length,
              itemBuilder: (context , index){

               return const SizedBox();



              },






            ),
            Positioned.fill(
                top: height - widget.itemExtent,
                child: GestureDetector(
              onTap: (){
                if(widget.onTapFrontItem != null){
                  widget.onTapFrontItem!(_curentindex!);
                }

              },
            ))

          ],
        );
      }
    );
  }
}

class _PerspectiveItems extends StatelessWidget {
  const _PerspectiveItems({
    super.key, required this.generateItems, required this.currentIndex, required this.heightItem, required this.pagePercent, required this.cheldrend,
  });

  final int generateItems;
final int currentIndex;
final double heightItem;
final double pagePercent;
final List<Widget> cheldrend;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(

        builder: (context , constraints){
          final hight = constraints.maxHeight;

          return Stack(

            fit: StackFit.expand,
            children: List.generate(generateItems, (index) {
              final invertedIndex = (generateItems -2) - index;
              final indexPlus = index +1;
              final positionPercent = indexPlus /generateItems;
              final endpositionPercent = index /generateItems;

              return (currentIndex > invertedIndex)?_TransformatedItem(
                child:  cheldrend[currentIndex - (invertedIndex +1)],
                heightItem: heightItem ,
                factorchange:  pagePercent,
                scale:  lerpDouble(.5, 1, positionPercent),
                endscale:  lerpDouble(.5, 1.0, endpositionPercent),
                translatey: (hight - heightItem) * positionPercent,
                endtranslatey: (hight - heightItem) * endpositionPercent,



              ) :
              const SizedBox();




            }) ..add((currentIndex < (cheldrend.length - 1)?
            _TransformatedItem(
              child:  cheldrend[currentIndex +1],
              heightItem: heightItem ,
              factorchange:  pagePercent,

              translatey: hight+20 ,
              endtranslatey: (hight - heightItem) ,



            )

                :const SizedBox()))..insert(0, (currentIndex > (generateItems - 1)?   _TransformatedItem(
              child:  cheldrend[currentIndex  - generateItems],
              heightItem: heightItem ,
              factorchange:  1.0,

             endscale:  .5,



            )
                : SizedBox())),
          );

        },
        );
  }
}

class _TransformatedItem extends StatelessWidget {
  const _TransformatedItem({
    super.key, required this.child, required this.heightItem, required this.factorchange,  this.scale = 1.0,  this.endscale = 1.0,  this.translatey = 0.0,  this.endtranslatey = 0.0,
  });
  final Widget child ;
  final double heightItem;
  final double factorchange;
  final double ?scale ;
  final double ?endscale ;
  final double ?translatey ;
  final double ? endtranslatey ;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.topCenter,
      transform: Matrix4.identity()..scale(lerpDouble(scale, endscale, factorchange))..translate(0.0 , lerpDouble(translatey!, endtranslatey!, factorchange!)! ,0.0),

      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          height: heightItem,
          width: double.infinity,
          child: child,

        ),

      ),
    );
  }
}
