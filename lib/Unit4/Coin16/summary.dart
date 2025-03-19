import 'package:flutter/material.dart';
import 'package:flutter_application_1/Templates/coin_ending-template.dart';
import 'package:flutter_application_1/Templates/exit_button.dart';
import 'package:flutter_application_1/Templates/topbar.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CoinApp(
              coinNumber: 16,
              description: 'What are Taxes?',
            ),
          ),
        );
      },
      child: Scaffold(
        backgroundColor: const Color(0xfffff1db),
        body: SafeArea(
            child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 🏷️ Header
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: 15,
                      left: 0,
                      right: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 180,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 91, 24, 233),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 180,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 140, 82, 255),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "Let's Take a Trip Down Tax Road",
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Source",
                          height: 1.3,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 80),

                // ✅ Summary Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 91, 24, 233),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CoinApp(
                          coinNumber: 16,
                          description: 'What are Taxes?',
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Let's summarize what you have learned",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                const SizedBox(height: 30),

                // ✅ Cat and Speech Bubble
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Align to bottom
                  children: [
                    // 🐱 Larger Cat Image
                    Image.asset(
                      'assets/corporatewawa.png',
                      width: 150, // Increased size
                      height: 150, // Increased size
                    ),
                    const SizedBox(height: 15),

                    // 💬 Speech Bubble
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 122, 72, 230),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Taxes in Canada fund services like healthcare, education, public safety, and infrastructure. Key types include income tax (from paychecks), sales tax (on purchases), corporate tax (on business profits), property tax (on property value), and tariffs (on imports). Taxes provide essential resources for public services and community development.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18, // Slightly larger font
                        ),
                        softWrap: true, // Ensures text wraps when it's too long
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),
              ],
            ),
            ExitButton(),
            const Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TopBar(
                      currentPage: 6,
                      totalPages: 6,
                    ),
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
