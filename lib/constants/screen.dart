import 'package:flutter/material.dart';
class ScreenSize
{
  Size getSize(BuildContext context)
  {
    return MediaQuery.of(context).size;
  }
}
