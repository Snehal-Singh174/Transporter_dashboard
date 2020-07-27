import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transport/transport/delivery_details.dart';
import 'package:transport/transport/delivery_details_completed.dart';
import 'dart:math' as math;

import 'package:transport/widgets/app_clipper.dart';

import 'dashboard.dart';

class delivery_details_progress extends StatefulWidget {
  @override
  _delivery_details_progressState createState() => _delivery_details_progressState();
}

class _delivery_details_progressState extends State<delivery_details_progress> {
  var paddingLeft = 0.0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF62B9BF),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left:0),
                child: _driver_list(),
              ),
              Container(
                color: Color(0xFF62B9BF),
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _customAppBar(),

                  ],
                ),
              ),
              Container(
                color: Color(0xFF62B9BF),
                height: MediaQuery.of(context).size.height,
                width: 60,
                margin: EdgeInsets.only(top: 195),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Transform.rotate(
                  angle: -math.pi / 2,
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          _buildMenu("Chat", 0),
                          _buildMenu("Delivery Detail", 1),
                          _buildMenu("Driver List", 2),
                        ],
                      ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 250),
                        margin: EdgeInsets.only(left: paddingLeft),
                        width: 150,
                        height: 75,
                        child: Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: ClipPath(
                                clipper: AppClipper(),
                                child: Container(
                                  width: 150,
                                  height: 60,
                                  color: Color(0xFF62B9BF),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Transform.rotate(
                                angle: math.pi / 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 40),
                                  child: Icon(
                                    Icons.blur_on,
                                    size: 30,
                                    color: Colors.white,
                                  ),
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
        ),
      ),
    );
  }

  Widget _buildMenu(String menu, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          paddingLeft = index * 150.0;
        });
        index == 2 ?Navigator.push(context, MaterialPageRoute(builder: (context)=> transporter_dashboard())):delivery_details();
      },
      child: Container(
        width: 150,
        padding: EdgeInsets.only(top: 16),
        child: Center(
          child: Text(
            menu,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  Widget _customAppBar()
  {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20,top: 20),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Center(
              child: Image.asset("assets/images/logo.png"),
            ),
          ),
          SizedBox(width: 16,),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: RichText(
              text: TextSpan(
                text: "Hello\n",
                style: TextStyle(color: Colors.black,fontSize: 15),
                children: [
                  TextSpan(
                    text: "Cerebro",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 20,),
          Expanded(
            child: Container(
              width: 200,
              height: 40,
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.search,
                    size: 20,
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10,),
          Container(
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: Color(0xFF62B9BF),
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Center(
              child: IconButton(
                iconSize: 50,
                icon: Icon(Icons.menu,color: Colors.white,),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _driver_list()
  {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 100,left: 60),
        width: 500,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 40,
                    height: 40,
                    margin: EdgeInsets.only(top: 40,left: 50),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        image: DecorationImage(image: AssetImage("assets/images/group-3.png"),fit: BoxFit.cover)
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Text("Assign Your Driver",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 60,top: 20),
                    child: GestureDetector(
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> delivery_details()));},
                      child: Text("Pending",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30,top: 20),
                    child: Text("In Progress",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),

                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30,top: 20),
                    child: GestureDetector(
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> delivery_details_completed()));},
                      child: Text("Completed",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 10),
                width: 264,
                height: 105,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                  border: Border.all(
                    color: Colors.grey[500],
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 20,top: 15),
                              width: 140,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              child: Text("Sell_Name -- Akash More",
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              width: 140,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              child: Text("Sell_City  -- Surat, Gujarat",
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              width: 140,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              child: Text("Buy_Name -- Paras Gang",
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              width: 140,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              child: Text("Buy_City -- Surat, Gujarat",
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          color: Colors.grey,
                          height: 103,
                          width: 1,
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 20,top: 30),
                              child: Text("100pcs",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text("Saree",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
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
