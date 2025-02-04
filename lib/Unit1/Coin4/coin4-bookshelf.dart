import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin4/coin4-laptop.dart';
import 'package:flutter_application_1/Unit1/Coin4/coin4-parents.dart';
import 'package:flutter_application_1/Unit1/Coin4/coin4-piggyshake.dart';
import 'package:flutter_application_1/Unit1/Coin4/coin4-quiz1.dart';
import 'package:flutter_application_1/Unit1/Coin4/coin4-tapphone.dart';
import 'package:flutter_application_1/Providers/progress_provider.dart';
import 'package:flutter_application_1/Templates/coin_ending-template.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

Widget Shimmy() {
  return Opacity(
    opacity: 0.4,
    child: Shimmer.fromColors(
      baseColor: Colors.transparent,
      highlightColor: const Color.fromARGB(255, 189, 183, 183),
      child: Image.asset(
        'assets/Coin-4/bookshelf_pig.png',
        width: 100,
      ),
    ),
  );
}

class Bookshelf extends StatefulWidget {
  const Bookshelf({super.key});

  @override
  State<Bookshelf> createState() => _BookshelfState();
}

class _BookshelfState extends State<Bookshelf> {
  double faded1 = 0.4;
  double faded2 = 0.4;
  double faded3 = 0.4;
  double faded4 = 0.4;

  @override
  void initState() {
    super.initState();
    final progressProvider =
        Provider.of<ProgressProvider>(context, listen: false);
    setState(() {
      faded1 = progressProvider.sublevel == 1 ? 1 : 0.4;
      faded2 = progressProvider.sublevel <= 2 ? 1 : 0.4;
      faded3 = progressProvider.sublevel <= 3 ? 1 : 0.4;
      faded4 = progressProvider.sublevel <= 4 ? 1 : 0.4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 219),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              ExitButton(),
              Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 40, bottom: 20),
                      child: Text(
                        'Well... You can \nchoose where!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff8956ef),
                          fontSize: 30,
                        ),
                      ),
                    ),
                    const Text(
                      'Tap the shiny option',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff4d4d4d),
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            color: const Color(0xffad7045),
                            width: 300,
                            height: 500,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      color: const Color(0xff915831),
                                      width: 280,
                                      height: 100,
                                    ),
                                    Positioned(
                                      right: 5,
                                      bottom: -10,
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Coin4shake(),
                                            ),
                                          );
                                        },
                                        icon: Stack(
                                          children: [
                                            Opacity(
                                              opacity: faded1,
                                              child: Image.asset(
                                                'assets/Coin-4/bookshelf_pig.png',
                                                width: 100,
                                              ),
                                            ),
                                            if (Provider.of<ProgressProvider>(context,
                                                        listen: false)
                                                    .sublevel ==
                                                1)
                                              Shimmy(),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 20,
                                      bottom: 0,
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 10,
                                            height: 60,
                                            color: Color(0xff0097b2),
                                          ),
                                          const SizedBox(width: 5),
                                          Container(
                                            width: 10,
                                            height: 60,
                                            color: Color(0xff040606),
                                          ),
                                          const SizedBox(width: 5),
                                          Container(
                                            width: 10,
                                            height: 60,
                                            color: Color(0xff0097b2),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Stack(
                                  children: [
                                    Container(
                                      color: const Color(0xff915831),
                                      width: 280,
                                      height: 100,
                                    ),
                                    Positioned(
                                      left: 5,
                                      bottom: -10,
                                      child: IconButton(
                                        onPressed: () {
                                          if (Provider.of<ProgressProvider>(context,
                                                      listen: false)
                                                  .sublevel >=
                                              2) {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => const Laptop(),
                                              ),
                                            );
                                          }
                                        },
                                        icon: Stack(
                                          children: [
                                            Opacity(
                                              opacity: faded2,
                                              child: Image.asset(
                                                'assets/Coin-4/bookshelf_laptop.png',
                                                width: 100,
                                              ),
                                            ),
                                            if (Provider.of<ProgressProvider>(context,listen: false).sublevel == 2)
                                              Opacity(
                                                opacity: 0.4,
                                                child: Shimmer.fromColors(
                                                  baseColor: Colors.transparent,
                                                  highlightColor: const Color.fromARGB(
                                                      255, 189, 183, 183),
                                                  child: Image.asset(
                                                    'assets/Coin-4/bookshelf_laptop.png',
                                                    width: 100,
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 20,
                                      bottom: 0,
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 10,
                                            height: 60,
                                            color: Color(0xff040606),
                                          ),
                                          const SizedBox(width: 5),
                                          Container(
                                            width: 10,
                                            height: 60,
                                            color: Color(0xff040606),
                                          ),
                                          const SizedBox(width: 5),
                                          Container(
                                            width: 10,
                                            height: 60,
                                            color: Color(0xff0097b2),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Stack(
                                  children: [
                                    Container(
                                      color: const Color(0xff915831),
                                      width: 280,
                                      height: 100,
                                    ),
                                    Positioned(
                                      right: 5,
                                      bottom: -10,
                                      child: IconButton(
                                        onPressed: () {
                                          if (Provider.of<ProgressProvider>(context,
                                                      listen: false)
                                                  .sublevel >=
                                              4) {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const Coin4parent(),
                                              ),
                                            );
                                          }
                                        },
                                        icon: Stack(
                                          children: [
                                            Opacity(
                                            opacity: faded4,
                                            child: Image.asset(
                                              'assets/Coin-4/bookshelf_family.png',
                                              width: 80,
                                            ),
                                          ),
                                          if (Provider.of<ProgressProvider>(context,listen: false).sublevel == 4)
                                              Opacity(
                                                opacity: 0.4,
                                                child: Shimmer.fromColors(
                                                  baseColor: Colors.transparent,
                                                  highlightColor: const Color.fromARGB(
                                                      255, 189, 183, 183),
                                                  child: Image.asset(
                                                    'assets/Coin-4/bookshelf_family.png',
                                                    width: 80,
                                                  ),
                                                ),
                                              ),
                                          ], 
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 25,
                                      bottom: -10,
                                      child: IconButton(
                                        onPressed: () {
                                          if (Provider.of<ProgressProvider>(context,
                                                      listen: false)
                                                  .sublevel >=
                                              3) {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const Coin4phone(),
                                              ),
                                            );
                                          }
                                        },
                                        icon: Stack(
                                          children: [
                                            Opacity(
                                            opacity: faded3,
                                            child: Image.asset(
                                              'assets/Coin-4/bookshelf_phone.png',
                                              width: 70,
                                            ),
                                          ),
                                          if (Provider.of<ProgressProvider>(context,listen: false).sublevel == 3)
                                              Opacity(
                                                opacity: 0.4,
                                                child: Shimmer.fromColors(
                                                  baseColor: Colors.transparent,
                                                  highlightColor: const Color.fromARGB(
                                                      255, 189, 183, 183),
                                                  child: Image.asset(
                                                    'assets/Coin-4/bookshelf_phone.png',
                                                    width: 70,
                                                  ),
                                                ),
                                              ),
                                          ],
                                          
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          color: const Color(0xffa06740),
                                          width: 135,
                                          height: 135,
                                        ),
                                        Positioned(
                                          right: 10,
                                          top: 52,
                                          child: Container(
                                            color: const Color(0xff915831),
                                            width: 5,
                                            height: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 10),
                                    Stack(
                                      children: [
                                        Container(
                                          color: const Color(0xffa06740),
                                          width: 135,
                                          height: 135,
                                        ),
                                        Positioned(
                                          left: 10,
                                          top: 52,
                                          child: Container(
                                            color: const Color(0xff915831),
                                            width: 5,
                                            height: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -30,
                          left: 0,
                          right: 0,
                          child: Align(
                            alignment: Alignment.center,
                            child:
                                Image.asset('assets/Coin-4/wawaBack.png', width: 150),
                          ),
                        ),
                      ],
                    ),
                    if (Provider.of<ProgressProvider>(context, listen: false)
                            .sublevel >=
                        5)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child:
                            ElevatedButton(onPressed: () {
                              Navigator.push(
                    context,
                    
                    MaterialPageRoute(builder: (context) => Coin4Quiz1(isRepeat: false)), // Replace NewPage() with your new page
                  );
                            }, child: const Text("Next")),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
