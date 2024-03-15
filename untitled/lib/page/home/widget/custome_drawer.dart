import 'package:flutter/material.dart';
import 'package:untitled/core/confige/constants.dart';
import 'package:untitled/core/confige/page_route_name.dart';

import '../../../main.dart';

class CustomDrawer extends StatelessWidget {
  Function onCategoryDrawerTap;
   CustomDrawer({
    super.key,
      required this.onCategoryDrawerTap
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.mediaQuery.width*0.8,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: Constants.mediaQuery.width*0.8,
            height: 160,
            color: Constants.theme.primaryColor,
            child:  Text(
              "News App!",
              style:Constants.theme.textTheme.titleLarge,
            ),
          ),
          InkWell(
            onTap: (){
              onCategoryDrawerTap();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15 , top: 25 ,bottom: 10),
              child: Row(
                children: [
                  const Icon(Icons.list_outlined,
                  size:35, color: Colors.black, ),
                  const SizedBox(width: 8,),
                  Text(
                    "Categories",
                    style:Constants.theme.textTheme.titleLarge?.copyWith(
                      color: Colors.black
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              navigatorKey.currentState!.pushReplacementNamed(PagesRouteName.settingsView);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15 , top: 10 ,bottom: 10),
              child: Row(
                children: [
                  const Icon(Icons.settings,
                    size:35, color: Colors.black, ),
                  const SizedBox(width: 8,),
                  Text(
                    "settings",
                    style:Constants.theme.textTheme.titleLarge?.copyWith(
                        color: Colors.black
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
