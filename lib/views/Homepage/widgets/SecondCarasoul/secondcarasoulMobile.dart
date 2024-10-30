import 'package:flutter/material.dart';

class secondCarasoulMobile extends StatelessWidget {
  const secondCarasoulMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
     
      color: Color.fromRGBO(189, 189, 189, 1),
      child: Image.asset("assets/shop (11).png",fit: BoxFit.fitWidth,),
    );
  }
}
