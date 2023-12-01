import 'package:flutter/material.dart';

import '../Helper/color.dart';

class Incentives extends StatefulWidget {
  const Incentives({super.key});

  @override
  State<Incentives> createState() => _IncentivesState();
}

class _IncentivesState extends State<Incentives> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF112c48),
        title: const Text(
          "Incentives & Referral Earning",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
        toolbarHeight: 60,
        elevation: 6,

        // flexibleSpace: Container(
        //   decoration: const BoxDecoration(
        //     color: Colors.indigo,
        //     borderRadius: BorderRadius.only(bottomLeft:Radius.circular(16),bottomRight:Radius.circular(16) )
        //   ),
        // ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16))),

        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
              margin: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: const Color(0xFFe2ebfe),
              ),
              child: const Icon(
                Icons.arrow_back,
                color: colors.primary,
              )),
        ),
      ),
      backgroundColor: const Color(0xFFe2ebfe),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Daily Incentive",
                  style: TextStyle(
                      color: Color(0xFF112c48),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "7:00 PM to 5:30 AM",
                  style: TextStyle(color: Color(0xFF112c48), fontSize: 16),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Container(
                height: 100,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Order Earning",
                      style: TextStyle(
                          color: Color(0xFF112c48),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      height: 2,
                      width: 120,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      "Incentive",
                      style: TextStyle(
                          color: Color(0xFF112c48),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                width: 2,
                color: Colors.black,
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("350Rs"),
                          Text("550Rs"),
                          Text("700Rs"),
                          Text("100Rs")
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 2,
                              color: Colors.grey,
                              // margin: EdgeInsets.only(top: emptyHeight / 2, bottom: emptyHeight / 2),
                            ),
                          ),
                          const Indicator(),
                          const Indicator(),
                          const Indicator(),
                          const Indicator(),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text("70Rs"),
                          Text("110Rs"),
                          Text("140Rs"),
                          Text("200Rs")
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
            child: Text(
              "Condition",
              style: TextStyle(
                  color: Color(0xFF112c48),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding:
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 16,
                      width: 16,
                      decoration: const BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                      child: const Center(
                        child: Text(
                          "...\n",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Do not reject more than one order",
                      style: TextStyle(
                        color: Color(0xFF112c48),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 16,
                      width: 16,
                      decoration: const BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                      child: const Center(
                        child: Text(
                          "...\n",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Complete more than 5Hrs working time\nat a stretch",
                      style: TextStyle(
                        color: Color(0xFF112c48),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      height: 16,
                      width: 16,
                      decoration: const BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                      child: const Center(
                        child: Text(
                          "...\n",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Finish order in given time",
                      style: TextStyle(
                        color: Color(0xFF112c48),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      height: 16,
                      width: 16,
                      decoration: const BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                      child: const Center(
                        child: Text(
                          "...\n",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Delivery product safely without damage",
                      style: TextStyle(
                        color: Color(0xFF112c48),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
            child: Container(
              padding:
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color(0xFF112c48),
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 2, offset: Offset(0, 1))
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Column(
                    children: const [
                      Text(
                        "Incentive on Earning",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "4000",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 72,
                  ),
                  Container(
                    width: 80,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2,
                              offset: Offset(0, 1))
                        ]),
                    child: const Text("₹ 200"),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
            child: Container(
              padding:
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color(0xFF112c48),
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 2, offset: Offset(0, 1))
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Column(
                    children: const [
                      Text(
                        "Referred Vendors",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "0",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 72,
                  ),
                  Container(
                    width: 80,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2,
                              offset: Offset(0, 1))
                        ]),
                    child: const Text("₹ 000"),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color(0xFF112c48),
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: const [
                    BoxShadow(color: Colors.grey, blurRadius: 2, offset: Offset(0, 1))
                  ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Column(
                    children: const [
                      Text(
                        "Referred Friends",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "2",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 72,
                  ),
                  Container(
                    width: 80,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2,
                              offset: Offset(0, 1))
                        ]),
                    child: const Text("₹ 200"),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final double lineWidth, lineHeight;

  const Indicator({
    super.key,
    this.lineWidth = 40,
    this.lineHeight = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 12,
          width: 12,
          decoration:
          const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
        ),
        Container(
          width: lineWidth,
          height: lineHeight,
          color: Colors.grey,
          // margin: EdgeInsets.only(top: emptyHeight / 2, bottom: emptyHeight / 2),
        ),
      ],
    );
  }
}
