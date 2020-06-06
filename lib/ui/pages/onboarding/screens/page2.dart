import 'package:flutter/material.dart';
import 'package:flutter_app/ui/elements/circles_with_image.dart';
import 'package:flutter_app/util/assets.dart';

const double IMAGE_SIZE = 370.0;

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: double.infinity,
      width: double.infinity,
      decoration: new BoxDecoration(
          gradient: LinearGradient(
              colors: [
//                Colors.pink[400],
//                Colors.deepPurple[600],
//                Colors.deepPurple[900],
                Colors.grey[50],
                Colors.grey[50],
                Colors.grey[100],
              ],
              begin: Alignment(0.5, -1.0),
              end: Alignment(0.5, 1.0)
          )
      ),
      child: Stack(
        children: <Widget>[
          new Positioned(
            child: new CircleWithImage(Assets.pose2),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          new Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  child: Image(
                    image: AssetImage(Assets.onboardingSlide[1]),
                    fit: BoxFit.contain,
                  ),
                  height: IMAGE_SIZE,
                  width: IMAGE_SIZE,
                ),
                new Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 25, 18.0, 18.0),
                  child: Text(Assets.onboardingHeader[1],
                    style: Theme.of(context).textTheme.display1.copyWith(color: Colors.grey[800]),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(Assets.onboardingDesc[1],
                  style: Theme.of(context).textTheme.body1.copyWith(color: Colors.grey[800]),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )
        ],
        alignment: FractionalOffset.center,
      ),
    );
  }
}