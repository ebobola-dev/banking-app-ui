import 'package:baking_app_ui/bloc/page/page_bloc.dart';
import 'package:baking_app_ui/bloc/page/page_event.dart';
import 'package:baking_app_ui/bloc/page/page_state.dart';
import 'package:baking_app_ui/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarItem extends StatefulWidget {
  final int index;
  final Color activeColor;
  final Color inactiveColor;
  const NavBarItem({
    super.key,
    required this.index,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  State<NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _colorController;
  late final Animation<Color?> _colorAnimation;

  @override
  void initState() {
    _colorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _colorAnimation = ColorTween(
      begin: widget.inactiveColor,
      end: widget.activeColor,
    ).animate(_colorController)
      ..addListener(() {
        setState(() {});
      });
    final currentPage = context.read<PageBloc>().state.page;
    if (currentPage == widget.index) {
      _colorController.forward();
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _colorController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PageBloc, PageState>(
      listener: (context, pageState) {
        if (pageState.page == widget.index) {
          _colorController.forward();
        } else {
          _colorController.animateBack(0);
        }
      },
      child: Material(
        color: Colors.transparent,
        child: SizedBox(
          width: 55,
          height: 55,
          child: InkWell(
            onTap: () => context
                .read<PageBloc>()
                .add(ChangePageEvent(newPage: widget.index)),
            borderRadius: BorderRadius.circular(50.0),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                Config.pagesSvg[widget.index],
                colorFilter:
                    ColorFilter.mode(_colorAnimation.value!, BlendMode.srcIn),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
