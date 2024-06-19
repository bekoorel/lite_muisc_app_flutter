import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:music_app/components/dwon_list.dart';
import 'package:music_app/components/players_buttons.dart';
import 'package:music_app/consetns/consetens.dart';
import 'package:music_app/consetns/get_it.dart';
import 'package:music_app/logic/permashn.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final permGetit = getIt<PermashnApp>();

  @override
  void initState() {
    super.initState();
    permGetit.permission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(gradient: ColorsApp.gradientBlack),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                'musaic app',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: ColorsApp.lightGray,
                    fontSize: 35.sp),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 350.h,
                width: 270.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorsApp.gray,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: ColorsApp.lightGray,
                          offset: const Offset(1.0, 1.0),
                          blurRadius: 30.0)
                    ]),
              ),
              const PlayerButtons(),
              const Spacer(),
              GestureDetector(
                onVerticalDragUpdate: (details) {
                  // Check the direction of the drag
                  if (details.delta.dy < 0) {
                    // Swipe up action
                    showMaterialModalBottomSheet(
                      backgroundColor: ColorsApp.black.withOpacity(0.1),
                      animationCurve: Curves.bounceInOut,
                      context: context,
                      builder: (context) => DownList(),
                    );
                  }
                },
                child: Icon(
                  Icons.keyboard_arrow_up_rounded,
                  color: ColorsApp.lightGray,
                  size: 100,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
