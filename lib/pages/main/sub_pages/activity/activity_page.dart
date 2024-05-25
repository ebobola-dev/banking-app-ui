import 'package:baking_app_ui/bloc/nav_bar/nav_bar_bloc.dart';
import 'package:baking_app_ui/bloc/nav_bar/nav_bar_event.dart';
import 'package:baking_app_ui/global_widgets/header.dart';
import 'package:baking_app_ui/pages/main/sub_pages/activity/widgets/achievement_progress.dart';
import 'package:baking_app_ui/pages/main/sub_pages/activity/widgets/bottom_clip.dart';
import 'package:baking_app_ui/pages/main/sub_pages/activity/widgets/charts.dart';
import 'package:baking_app_ui/pages/main/sub_pages/activity/widgets/extended_stats.dart';
import 'package:baking_app_ui/theme/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActivitySubPage extends StatefulWidget {
  const ActivitySubPage({super.key});

  @override
  State<ActivitySubPage> createState() => _ActivitySubPageState();
}

class _ActivitySubPageState extends State<ActivitySubPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animationController.forward();
    final navBarBloc = context.read<NavBarBloc>();
    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        if (_scrollController.position.atEdge) {
          if (_scrollController.position.pixels != 0) {
            navBarBloc.add(HideNavBarEvent());
          }
        } else {
          navBarBloc.add(ShowNavBarEvent());
        }
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _restartAniamtion({
    bool slowly = false,
  }) async {
    final duration =
        slowly ? const Duration(seconds: 7) : _animationController.duration;
    await _animationController.animateBack(0, duration: Duration.zero);
    await _animationController.animateTo(1, duration: duration);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(ThemeConfig.defaultPadding),
                child: Column(
                  children: [
                    Header(
                      leftWidget: Text(
                        'Activity',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      rightWidget: PopupMenuButton(
                        icon: SvgPicture.asset(
                          'assets/svg/dots.svg',
                        ),
                        padding: const EdgeInsets.all(12.0),
                        splashRadius: 28.0,
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            onTap: _restartAniamtion,
                            child: const Text("Restart animation"),
                          ),
                          PopupMenuItem(
                            child: const Text("Restart animation slowly"),
                            onTap: () => _restartAniamtion(slowly: true),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    AchievementProgress(
                      progress: 75,
                      animationController: _animationController,
                    ),
                    const SizedBox(height: 43),
                    Charts(animationController: _animationController),
                    const SizedBox(height: 60),
                    const ExtendedStats(),
                    const SizedBox(height: 36 - ThemeConfig.defaultPadding),
                  ],
                ),
              ),
              BottomClip(
                animationController: _animationController,
                screenWidth: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
