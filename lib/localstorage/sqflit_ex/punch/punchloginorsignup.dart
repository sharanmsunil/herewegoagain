import 'package:flutter/material.dart';
import 'package:herewegoagain/localstorage/sqflit_ex/punch/punchlogin.dart';
import 'package:herewegoagain/localstorage/sqflit_ex/punch/punchsignup.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LoginOrSignUp extends StatelessWidget {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/images/pngtree-white-wavy-line-blue-curve-texture-background-picture-image_1389640.jpg'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'PUNCH',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Punch • Earn • Repeat',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      child: PageView(
                        controller: _controller,
                        children: [
                          page1(),
                          page1(),
                          page1(),
                        ],
                      ),
                    ),
                    SmoothPageIndicator(controller: _controller, count: 3,
                    effect: SwapEffect(
                      activeDotColor: Colors.black,
                      dotColor: Colors.grey.shade300,
                      dotWidth: 10,
                      dotHeight: 10
                    ),),
                    SizedBox(
                      height: 100,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            minimumSize: Size(300, 50)),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUpPunch()));
                        },
                        child: Text(
                          'SIGNUP',
                          style: TextStyle(color: Colors.white),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: Size(300, 50),
                            side: BorderSide(width: 3, color: Colors.black)),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPunch()));
                        },
                        child: Text(
                          'LOGIN',
                          style: TextStyle(color: Colors.black),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.folder_copy,
            color: Colors.black,
            size: 80,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Organize, find and enjoy your',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Text(
            'loyalty cards in a more modern',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Text(
            'and dynamic way',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ],
      ),
    );
    ;
  }
}
