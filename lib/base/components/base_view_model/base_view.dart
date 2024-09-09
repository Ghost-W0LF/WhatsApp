
import 'package:flutter/material.dart';
import 'package:whats_app_ui/base/components/base_view_model/base_view_abstract.dart';

 class BaseViewModel extends ChangeNotifier implements BaseViewAbstract{
    static final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
    

      void showSnackBar(String? content,)  {
    scaffoldKey.currentState?.showSnackBar(SnackBar(
      content: Text(content??"no data"),
      duration: const Duration(milliseconds: 200),
    ));
  }

 
  
}