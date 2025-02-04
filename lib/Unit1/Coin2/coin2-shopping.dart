import 'package:flutter/material.dart';
import 'package:flutter_application_1/Unit1/Coin2/coin2-shopping_end.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';

class ShopGame extends StatefulWidget {
  const ShopGame({super.key});

  @override
  State<ShopGame> createState() => _ShopGameState();
}

class _ShopGameState extends State<ShopGame> {
  double cost = 0;
  double maxCost = 23.07;
  // List to keep track of which item in each row is enlarged
  List<int?> enlargedItemIndices = [null, null, null, null];

  // Function to update the state when an item is tapped
  void onItemTapped(int rowIndex, int itemIndex, double price) {
    setState(() {
      if (enlargedItemIndices[rowIndex] == itemIndex) {
        // If the item is already enlarged, shrink it and decrease the cost
        enlargedItemIndices[rowIndex] = null;
        cost -= price;
      } else {
        // If a different item is enlarged, shrink the current one and enlarge the new one
        if (enlargedItemIndices[rowIndex] != null) {
          cost -= getItemPrice(rowIndex, enlargedItemIndices[rowIndex]!);
        }
        enlargedItemIndices[rowIndex] = itemIndex;
        cost += price;
      }
    });
  }

  double getItemPrice(int rowIndex, int itemIndex) {
    List<List<double>> prices = [
      [5.50, 4.99, 3.99],
      [5.59, 6.99, 8.50, 7.50],
      [5.59, 4.99, 2.50],
      [0.95, 1.50, 3.99],
    ];
    return prices[rowIndex][itemIndex];
  }

  Widget itemMaker(String imageTitle, double price, int rowIndex, int itemIndex) {
    bool isEnlarged = enlargedItemIndices[rowIndex] == itemIndex;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: () => onItemTapped(rowIndex, itemIndex, price),
        child: Stack(
          clipBehavior: Clip.none, // Allow overflow for shadow effect
          children: [
            Stack(
              children: [
                AnimatedContainer(
                  width: isEnlarged ? 100.0 : 80.0, // Adjust width based on state
                  height: isEnlarged ? 100.0 : 80.0, // Adjust height to fit the item and price box
                  decoration: BoxDecoration(
                    color:  isEnlarged ? const Color.fromARGB(255, 255, 175, 55): const Color(0xffd4891c),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  duration: const Duration(milliseconds:100),
                ),
                Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                    child: Center(
                      child: Text(
                        "\$${price.toStringAsFixed(2)}",
                        style: const TextStyle(
                          color: Color.fromARGB(255, 68, 41, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: -20, // Adjust this value to move the item higher
              left: 0,
              right: 0,
              child: Image.asset(
                imageTitle,
                width: 60,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 241, 219),
      body: SafeArea(
        child: Stack(
          children: [
            ExitButton(),
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: TopBar(
                                        currentPage: 6,
                                        totalPages: 7,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0, bottom: 20),
                          child: Stack(
                            children: [
                              
                              Center(
                                child: Image.asset(
                                  'assets/Shopping_Icons/paper.png',
                                  width: 300,
                                ),
                              ),
                              const Center(
                                child: Text(
                                  '- eggs\n-milk\n-water',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'handwriting',
                                    height: 1.2,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                              
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  itemMaker('assets/Shopping_Icons/egg1.png', 5.50, 0, 0),
                                  itemMaker('assets/Shopping_Icons/egg2.png', 4.99, 0, 1),
                                  itemMaker('assets/Shopping_Icons/egg3.png', 3.99, 0, 2),
                                ],
                              ),
                              Container(
                                height: 20,
                                decoration: const BoxDecoration(
                                  color: Color(0xffAB7241),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  itemMaker('assets/Shopping_Icons/milk1.png', 5.59, 1, 0),
                                  itemMaker('assets/Shopping_Icons/milk2.png', 6.99, 1, 1),
                                  itemMaker('assets/Shopping_Icons/milk3.png', 8.50, 1, 2),
                                  itemMaker('assets/Shopping_Icons/milk4.png', 7.50, 1, 3),
                                ],
                              ),
                              Container(
                                height: 20,
                                decoration: const BoxDecoration(
                                  color: Color(0xffAB7241),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  itemMaker('assets/Shopping_Icons/water1.png', 5.59, 2, 0),
                                  itemMaker('assets/Shopping_Icons/water2.png', 4.99, 2, 1),
                                  itemMaker('assets/Shopping_Icons/water3.png', 2.50, 2, 2),
                                ],
                              ),
                              Container(
                                height: 20,
                                decoration: const BoxDecoration(
                                  color: Color(0xffAB7241),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  itemMaker('assets/Shopping_Icons/apple.png', 0.95, 3, 0),
                                  itemMaker('assets/Shopping_Icons/banana.png', 1.50, 3, 1),
                                  itemMaker('assets/Shopping_Icons/chocolate.png', 3.99, 3, 2),
                                ],
                              ),
                              Container(
                                height: 20,
                                decoration: const BoxDecoration(
                                  color: Color(0xffAB7241),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Image.asset('assets/Shopping_Icons/bigcart.png',
                              width: 200,)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  color: const Color(0xff8483E4),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Total: \$${cost.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 20),
                        IconButton(
                          onPressed: () {
                            // Navigate to SecondScreen (replace with your actual screen)
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShopEnd(savedAmount: maxCost - cost),
                              ),
                            );
                          },
                          icon: Stack(
                            children: [
                              Image.asset('assets/big green.png'),
                              const Center(
                                child: Text(
                                  '   Done?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
