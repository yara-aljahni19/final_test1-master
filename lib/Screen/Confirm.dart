import 'package:final_test/Screen/LogInS.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../../models/authentication.dart';
import 'package:email_auth/email_auth.dart';

var assetImage8 = AssetImage('assets/confirm_img.png');
var confirm_img = Image(image: assetImage8);
// Reset page
class Confirm extends StatefulWidget {
  Confirm({Key? key}) : super(key: key);

  @override
  Confirm1 createState() => Confirm1();
}

class Confirm1 extends State<Confirm> with TickerProviderStateMixin {

  final _formKey = GlobalKey<FormState>();
  final Authentication _auth = Authentication();
  final String error1 = "user undefined ";
  TextEditingController _emailContoller = TextEditingController();
  late AnimationController _animationController;

  double _containerPaddingLeft = 20.0;
  late double _animationValue;
  double _translateX = 0;
  double _translateY = 0;
  double _rotate = 0;
  double _scale = 1;

  late bool show;
  bool sent = false;
  Color _color = Colors.lightBlue;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1300));
    show = true;
    _animationController.addListener(() {
      setState(() {
        show = false;
        _animationValue = _animationController.value;
        if (_animationValue >= 0.2 && _animationValue < 0.4) {
          _containerPaddingLeft = 100.0;
          _color = Colors.green;
        } else if (_animationValue >= 0.4 && _animationValue <= 0.5) {
          _translateX = 80.0;
          _rotate = -20.0;
          _scale = 0.1;
        } else if (_animationValue >= 0.5 && _animationValue <= 0.8) {
          _translateY = -20.0;
        } else if (_animationValue >= 0.81) {
          _containerPaddingLeft = 20.0;
          sent = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Color(0xFFE8FFFF),
            appBar: AppBar(
              title: Text('Confirm page'),
            ),
            resizeToAvoidBottomInset: false,
            body: Stack(
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.only(
                        left: 90.0, top: 55.0, right: 90.0, bottom: 200.0),
                    child: confirm_img,
                  ),
                  Container(
                      child: Text(
                          '  A verification link has been sent to your email address  ',
                          style: TextStyle(
                              height: 21, color: Colors.black, fontSize: 15))),
                  Container(
                      child: Text(
                          '  check your email and click the link to continue  ',
                          style: TextStyle(
                              height: 23.5,
                              color: Colors.black,
                              fontSize: 15))),


                  Container(

                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.all(100.0),
                                child: Center(
                                    child: GestureDetector(

                                        onTap: () {
                                          _animationController.forward();
                                        },
                                        child: AnimatedContainer(
                                            decoration: BoxDecoration(
                                              color: _color,
                                              borderRadius: BorderRadius
                                                  .circular(100.0),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: _color,
                                                  blurRadius: 21,
                                                  spreadRadius: -15,
                                                  offset: Offset(
                                                    0.0,
                                                    20.0,
                                                  ),
                                                )
                                              ],
                                            ),
                                            padding: EdgeInsets.only(
                                                left: _containerPaddingLeft,
                                                right: 20.0,
                                                top: 10.0,
                                                bottom: 10.0),
                                            duration: Duration(
                                                milliseconds: 400),
                                            curve: Curves.easeOutCubic,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                (!sent)
                                                    ? AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 400),
                                                  child: Icon(Icons.send),
                                                  curve: Curves.fastOutSlowIn,
                                                  transform: Matrix4
                                                      .translationValues(
                                                      _translateX, _translateY,
                                                      0)
                                                    ..rotateZ(_rotate)
                                                    ..scale(_scale),
                                                )
                                                    : Container(),
                                                AnimatedSize(
                                                  vsync: this,
                                                  duration: Duration(
                                                      milliseconds: 600),
                                                  child: show
                                                      ? SizedBox(width: 10.0)
                                                      : Container(),
                                                ),
                                                AnimatedSize(
                                                  vsync: this,
                                                  duration: Duration(
                                                      milliseconds: 200),
                                                  child: show
                                                      ? Text("Send")
                                                      : Container(),
                                                ),
                                                AnimatedSize(
                                                  vsync: this,
                                                  duration: Duration(
                                                      milliseconds: 200),
                                                  child: sent
                                                      ? Icon(Icons.done)
                                                      : Container(),
                                                ),
                                                AnimatedSize(
                                                  vsync: this,
                                                  alignment: Alignment.topLeft,
                                                  duration: Duration(
                                                      milliseconds: 600),
                                                  child: sent
                                                      ? SizedBox(width: 10.0)
                                                      : Container(),
                                                ),
                                                AnimatedSize(
                                                  vsync: this,
                                                  duration: Duration(
                                                      milliseconds: 200),
                                                  child: sent
                                                      ? Text("Done")
                                                      : Container(),
                                                ),
                                              ],
                                            ))))

                            )
                          ]
                      )
                  )
                ]
            )
        )
    );
  }
}





