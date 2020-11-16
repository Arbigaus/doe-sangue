import 'package:doe_sangue/Views/Profile/Components/BloodTypeAndHelpedComponent.dart';
import 'package:doe_sangue/Views/Profile/Components/ProfileUserComponent.dart';
import 'package:doe_sangue/Views/Profile/Components/UserDataComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: new BoxDecoration(color: Colors.red[800]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: ProfileUserComponent(
                    'Peter Parker',
                    'https://www.gannett-cdn.com/-mm-/cc053686530ce446f0a27dc352961fac33dd12ac/c=1144-81-2630-920/local/-/media/2017/06/26/USATODAY/USATODAY/636340759929048028-XXX-SPIDER-MAN-HOMECOMING-87249008.JPG')
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0)
                        )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget> [
                        BloodTypeAndHelpedComponent(),
                        UserDataComponent()
                      ],
                    ),
                  )
              )
            ],
          ),
        )
    );
  }

  static const TextStyle nameStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.white
  );

}
