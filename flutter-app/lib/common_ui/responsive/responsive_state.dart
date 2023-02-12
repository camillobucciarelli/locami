import 'package:flutter/material.dart';

abstract class ResponsiveState<W extends StatefulWidget> extends State<W> {

  Widget buildResponsive(BuildContext context, BoxConstraints constraints);


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: buildResponsive);
  }
}
