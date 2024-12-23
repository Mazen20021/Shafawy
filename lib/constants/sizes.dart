import 'package:flutter/cupertino.dart';
import 'package:shafawy/constants/screen.dart';

class ConstantSizes
{
  double getIconSize(BuildContext context)
  {
    return ScreenSize().getSize(context).width * 0.35;
  }
  double getTextSize(BuildContext context)
  {
    return ScreenSize().getSize(context).width * 0.1;
  }
  double getButtonLabelSize(BuildContext context)
  {
    return ScreenSize().getSize(context).width * 0.055;
  }
  double getButtonWidth(BuildContext context)
  {
    return ScreenSize().getSize(context).width * 0.8;
  }
  double getButtonHeight(BuildContext context)
  {
    return ScreenSize().getSize(context).width * 0.2;
  }
  double getCopyRightsSize(BuildContext context)
  {
    return ScreenSize().getSize(context).width * 0.035;
  }
}