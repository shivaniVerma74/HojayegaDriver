import 'package:flutter/material.dart';
import 'package:hojayegadriverapp/Authview/loginscreen.dart';
import 'PageIndicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: controller,
            children: const [
              FirstScreen(),
              SecondScreen(),
              ThirdScreen(),
              // FourthScreen(),
              // FifthScreen(),
            ],
          ),
          PageIndicator(
            controller: controller,
            itemCount: 3,
          )
        ],
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/images/introimage.png',
              fit: BoxFit.fill,
            ),
        ),
        Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Image.asset(
              'assets/images/image1.png',
              scale: 2,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            const Text(
              'Choose Multiple Orders',
              style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: const Text(
                'Maximum Profit Potential Optimize Efficiency by Combining Orders to save Time and Fuel, Earning More Rewards.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/images/introimage.png',
              fit: BoxFit.fill,
            )),
        Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              'assets/images/image2.png',
              scale: 2,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            const Text(
              'WEEKLY PAYOUTS',
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: const Text(
                'Get paid on each safe delivery. No more waiting.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25, color: Colors.red,
                  fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/images/introimage.png',
              fit: BoxFit.fill,
            )),
        Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              'assets/images/image3.png',
              scale: 2,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            const Text(
              'NO MORE WAITING FOR ORDERS',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: const Text(
                'Increase your earnings using our delivery app. Simply plan your delivery route and earn with every minute you work."',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700
                ),
              ),
            )
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: GestureDetector(
                onTap: () =>   Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginScreen()), (Route<dynamic> route) => false),
                child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.green,
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                ),
              ),
          ),
        ),
      ],
    );
  }
}

class FourthScreen extends StatelessWidget {
  const FourthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/images/introimage.png',
              fit: BoxFit.fill,
            )),
        Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              'assets/images/3.png',
              scale: 2,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            const Text(
              'Effortlessly Schedule Appointment Dates',
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.red),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: const Text(
                'Get best service.Pre Book the service. save time and money',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class FifthScreen extends StatelessWidget {
  const FifthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [



        SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/images/introimage.png',
              fit: BoxFit.fill,
            )),
        Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Image.asset(
              'assets/images/4.png',
              scale: 2,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Text(
              'It\'s Flexibility At Your Fingertips!',
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.red),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: const Text(
                'No need to stress about updating your portfolio rates daily with Hojayega! Easily adjust and offer the best rates to yourloyal clients whenever you want',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: GestureDetector(
                onTap: () =>   Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) =>LoginScreen()),
                        (Route<dynamic> route) => false),
                child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.green,
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    )),
              )),
        )
      ],
    );
  }
}
