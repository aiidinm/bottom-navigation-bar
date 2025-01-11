import 'package:bottom_navigation_bar/animated_positend_value.dart';
import 'package:bottom_navigation_bar/clipper.dart';
import 'package:bottom_navigation_bar/size_config.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavigationCustom extends StatefulWidget {
  const BottomNavigationCustom({super.key});

  @override
  State<BottomNavigationCustom> createState() => _BottomNavigationCustomState();
}

class _BottomNavigationCustomState extends State<BottomNavigationCustom> {
  int _correctIndex = 0;

  @override
  Widget build(BuildContext context) {
    AppSize().initSize(context);
    return Scaffold(
      body: Stack(
        children: [
          //background
          Positioned.fill(
            child: Container(
              padding: const EdgeInsets.all(12),
              color: Colors.grey[700],
            ),
          ),
          //bottom navigation bar background
          Positioned(
            bottom: 25,
            right: 10,
            left: 10,
            child: Container(
              height: 52,
              width: AppSize.screenWidth,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                color: Colors.deepPurple[700],
              ),
              child: Stack(
                children: <Widget>[
                  //list of icons

                  Positioned(
                    top: 0,
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        BottomNavigationBar(
                          icon: Iconsax.home,
                          index: 0,
                          currentIndex: _correctIndex,
                          onPressed: (val) {
                            setState(() {
                              _correctIndex = val;
                            });
                          },
                        ),
                        BottomNavigationBar(
                          icon: Iconsax.message,
                          index: 1,
                          currentIndex: _correctIndex,
                          onPressed: (val) {
                            setState(() {
                              _correctIndex = val;
                            });
                          },
                        ),
                        BottomNavigationBar(
                          icon: Iconsax.heart,
                          index: 2,
                          currentIndex: _correctIndex,
                          onPressed: (val) {
                            setState(() {
                              _correctIndex = val;
                            });
                          },
                        ),
                        BottomNavigationBar(
                          icon: Iconsax.add_circle,
                          index: 3,
                          currentIndex: _correctIndex,
                          onPressed: (val) {
                            setState(() {
                              _correctIndex = val;
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  //animation  posited

                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                    left: animatedPositedLeftValue(_correctIndex),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 3,
                          width: AppSize.blockSizeHorizontal * 9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),

                        //clipper
                        ClipPath(
                          clipper: MyCustomClipper(),
                          child: Container(
                            height: AppSize.blockSizeHorizontal * 15,
                            width: AppSize.blockSizeHorizontal * 10,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                              colors: <Color>[
                                Colors.white.withOpacity(0.7),
                                Colors.white.withOpacity(0.1),
                                Colors.transparent,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar(
      {super.key,
      required this.icon,
      required this.index,
      required this.currentIndex,
      required this.onPressed});

  final IconData icon;
  final int index;
  final int currentIndex;
  final Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    AppSize().initSize(context);
    return InkWell(
      onTap: () {
        onPressed(index);
      },
      child: Container(
        height: AppSize.blockSizeHorizontal * 13,
        width: AppSize.blockSizeVertical * 10,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedOpacity(
              opacity: (currentIndex == index) ? 1 : 0.8,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
              child: Icon(
                icon,
                color: (currentIndex == index) ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
