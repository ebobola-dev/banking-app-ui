import 'package:baking_app_ui/global_widgets/header.dart';
import 'package:baking_app_ui/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActivitySubPage extends StatelessWidget {
  const ActivitySubPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(ThemeConfig.defaultPadding),
          child: Column(
            children: [
              Header(
                leftWidget: Text(
                  'Activity',
                  style: Theme.of(context).textTheme.headline1,
                ),
                rightWidget: SizedBox(
                  width: 30,
                  height: 30,
                  child: IconButton(
                    onPressed: () {},
                    padding: const EdgeInsets.all(3.75),
                    icon: SvgPicture.asset(
                      'assets/svg/dots.svg',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
