import 'package:flutter/material.dart';

import '../Helper/color.dart';

class PickUpLocationNew extends StatefulWidget {
  const PickUpLocationNew({super.key});

  @override
  State<PickUpLocationNew> createState() => _PickUpLocationNewState();
}

class _PickUpLocationNewState extends State<PickUpLocationNew> {
  bool showImage = false;
  showDialogue() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            content: SizedBox(
              height: 300,
              width: 400,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFF112c48), width: 2),
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      children: [
                        const Text(
                          "Reason",
                          style: TextStyle(
                              color: Color(0xFF112c48),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text("1. Cash:", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(child: TextFormField())
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text("2. Paid In Advance\nTransaction Id:", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(child: TextFormField())
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text("3. Drop Client Paying:", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(child: TextFormField())
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 35,
                    width: 100,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: colors.secondary, // Background color
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Submit", style: TextStyle(fontSize: 19, color: colors.white, fontWeight: FontWeight.bold),
                          // style: TextStyle(color: Colors.white),
                        ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF112c48),
        title: const Text(
          "Pick Up Location",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
        toolbarHeight: 60,
        elevation: 6,
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
                color: Colors.green,
              )),
        ),
      ),
      backgroundColor: const Color(0xFFe2ebfe),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              child: Text(
                "Pick Up Location",
                style: TextStyle(
                    color: Color(0xFF112c48),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: const [
                  Icon(
                    Icons.pin_drop_outlined,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '372 Mclean Rd,Milner, GA, 30257',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              child: Text(
                "Product",
                style: TextStyle(
                    color: Color(0xFF112c48),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                height: 112,
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,
                          offset: Offset(0, 1))
                    ]),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/submit.png",
                      height: 96,
                      width: 96,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Butter Milk one Packet",
                          style: TextStyle(
                              color: Color(0xFF112c48),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: 110,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Weight:",
                                  style: TextStyle(
                                    color: Color(0xFF112c48),
                                    fontSize: 12,
                                  )),
                              Text("3kg",
                                  style: TextStyle(
                                    color: Color(0xFF112c48),
                                    fontSize: 12,
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: 110,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Amount:",
                                  style: TextStyle(
                                    color: Color(0xFF112c48),
                                    fontSize: 12,
                                  )),
                              Text("\$180",
                                  style: TextStyle(
                                    color: Color(0xFF112c48),
                                    fontSize: 12,
                                  ))
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                )),
             Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Product Info :",
                    style: TextStyle(
                        color: Color(0xFF112c48),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("5 Box of sweets",
                          style: TextStyle(
                              color: Color(0xFF112c48), fontSize: 16)),
                      Text("1 Box of roti",
                          style: TextStyle(
                              color: Color(0xFF112c48), fontSize: 16)),
                      Text("1 Box of dal",
                          style: TextStyle(
                              color: Color(0xFF112c48), fontSize: 16)),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => () {},
                    child: Container(
                        height: 60,
                        width: 60,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 32,
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showImage = true;
                      });
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Image.asset(
                        "assets/images/submit.png",
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.red),
                      child:  Column(
                        children: const [
                          Text(
                            "Online - 50Rs",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Drop Client",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Center(
              child: Container(
                height: 150,
                width: 150,
                padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white),
                child: Center(
                  child: showImage
                      ? GestureDetector(
                    onTap: showDialogue,
                    child: Column(
                      children: [
                         Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Icon(
                              Icons.highlight_remove,
                              color: Colors.red,
                            ),
                          ],
                        ),
                        Container(
                          height: 80,
                          width: 80,
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2,
                                    offset: Offset(0, 1))
                              ]),
                          child: Image.asset(
                            "assets/images/submit.png",
                            height: 64,
                            width: 64,
                          ),
                        ),
                      ],
                    ),
                  )
                      : Container(
                      height: 80,
                      width: 80,
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 2,
                                offset: Offset(0, 1))
                          ]),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Color(0xFF112c48),
                        size: 56,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
