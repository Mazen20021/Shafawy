import 'package:flutter/cupertino.dart';
import 'package:shafawy/constants/screen.dart';

class ConstantLocations
{
  double getIconLocation(BuildContext context)
  {
    return -ScreenSize().getSize(context).width * 0.2;
  }
  double getTextLocation(BuildContext context)
  {
    return -ScreenSize().getSize(context).width * 0.2;
  }
  double getCopyRightsLocation(BuildContext context)
  {
    return ScreenSize().getSize(context).width * 0.4;
  }
}
