import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transport/transport/delivery_details.dart';
import 'dart:math' as math;

import 'package:transport/widgets/app_clipper.dart';

class transporter_dashboard extends StatefulWidget {
  @override
  _transporter_dashboardState createState() => _transporter_dashboardState();
}

class _transporter_dashboardState extends State<transporter_dashboard> {
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
                          _buildMenu("Chat", 2),
                          _buildMenu("Delivery Detail", 1),
                          _buildMenu("Driver List", 0),
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
        index == 1 ?Navigator.push(context, MaterialPageRoute(builder: (context)=> delivery_details())):transporter_dashboard();
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
                    Container(
                      margin: EdgeInsets.only(top: 40, left: 20),
                      width: 264,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        border: Border.all(
                          color: Colors.grey[500],
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 20,top: 15),
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  border: Border.all(
                                    color: Colors.grey[500],
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/Head-Front.png",),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20,),
                              Text("Akash More",
                                style: TextStyle(
                                  fontSize: 16,
                                ),),
                              SizedBox(width: 20,),
                              IconButton(
                                icon: Icon(Icons.call,color: Colors.lightGreen,),
                                iconSize: 25,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20),
                    width: 264,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      border: Border.all(
                        color: Colors.grey[500],
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 20,top: 15),
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                border: Border.all(
                                  color: Colors.grey[500],
                                ),
                                image: DecorationImage(
                                  image: AssetImage("assets/images/Head-Front.png",),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Text("Akash More 2",
                              style: TextStyle(
                                fontSize: 16,
                              ),),
                            SizedBox(width: 10,),
                            IconButton(
                              icon: Icon(Icons.call,color: Colors.lightGreen,),
                              iconSize: 25,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20),
                    width: 264,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      border: Border.all(
                        color: Colors.grey[500],
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 20,top: 15),
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                border: Border.all(
                                  color: Colors.grey[500],
                                ),
                                image: DecorationImage(
                                  image: AssetImage("assets/images/Head-Front.png",),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Text("Akash More 3",
                              style: TextStyle(
                                fontSize: 16,
                              ),),
                            SizedBox(width: 10,),
                            IconButton(
                              icon: Icon(Icons.call,color: Colors.lightGreen,),
                              iconSize: 25,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20),
                    width: 264,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      border: Border.all(
                        color: Colors.grey[500],
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 20,top: 15),
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                border: Border.all(
                                  color: Colors.grey[500],
                                ),
                                image: DecorationImage(
                                  image: AssetImage("assets/images/Head-Front.png",),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Text("Akash More 4",
                              style: TextStyle(
                                fontSize: 16,
                              ),),
                            SizedBox(width: 10,),
                            IconButton(
                              icon: Icon(Icons.call,color: Colors.lightGreen,),
                              iconSize: 25,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20),
                    width: 264,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      border: Border.all(
                        color: Colors.grey[500],
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 20,top: 15),
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                border: Border.all(
                                  color: Colors.grey[500],
                                ),
                                image: DecorationImage(
                                  image: AssetImage("assets/images/Head-Front.png",),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Text("Akash More 5",
                              style: TextStyle(
                                fontSize: 16,
                              ),),
                            SizedBox(width: 10,),
                            IconButton(
                              icon: Icon(Icons.call,color: Colors.lightGreen,),
                              iconSize: 25,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20),
                    width: 264,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      border: Border.all(
                        color: Colors.grey[500],
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 20,top: 15),
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                border: Border.all(
                                  color: Colors.grey[500],
                                ),
                                image: DecorationImage(
                                  image: AssetImage("assets/images/Head-Front.png",),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Text("Akash More 6",
                              style: TextStyle(
                                fontSize: 16,
                              ),),
                            SizedBox(width: 10,),
                            IconButton(
                              icon: Icon(Icons.call,color: Colors.lightGreen,),
                              iconSize: 25,
                            ),
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
