import 'package:doe_sangue/Views/Settings/Components/SettingsHeader.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {

  static const TextStyle buttonStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(color: Colors.red[800]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            Expanded(
              flex: 1,
              child: SettingsHeader(
                'Peter Parker',
                  'https://www.gannett-cdn.com/-mm-/cc053686530ce446f0a27dc352961fac33dd12ac/c=1144-81-2630-920/local/-/media/2017/06/26/USATODAY/USATODAY/636340759929048028-XXX-SPIDER-MAN-HOMECOMING-87249008.JPG')
              ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0)
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(child: Container()),
                    Expanded(child: Center(
                        child: Text("Informações para doar", style: buttonStyle, textAlign: TextAlign.center))),
                    Expanded(child: Center(
                        child: Text("Editar perfil", style: buttonStyle, textAlign: TextAlign.center))),
                    Expanded(child: Center(
                        child: Text("Sobre", style: buttonStyle, textAlign: TextAlign.center))),
                    Expanded(child: Center(
                        child: Text("Sair", style: buttonStyle, textAlign: TextAlign.center))),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}