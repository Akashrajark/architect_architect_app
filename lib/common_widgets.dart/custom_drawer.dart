import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class CustomDrawer extends StatefulWidget {
  final TabController tabController;
  const CustomDrawer({
    super.key,
    required this.tabController,
  });

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  void changeIndex(int index) {
    widget.tabController.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230,
      child: Material(
        color: secondaryColor,
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    DrawerButton(
                      label: 'Dashboard',
                      iconData: Icons.dashboard_rounded,
                      onPressed: () {
                        changeIndex(0);
                      },
                      isSelected: widget.tabController.index == 0,
                    ),
                    const SizedBox(height: 10),
                    DrawerButton(
                      label: 'University',
                      iconData: Icons.list_alt_rounded,
                      onPressed: () {
                        changeIndex(1);
                      },
                      isSelected: widget.tabController.index == 1,
                    ),
                    const SizedBox(height: 10),
                    DrawerButton(
                      label: 'Collage',
                      iconData: Icons.percent,
                      onPressed: () {
                        changeIndex(2);
                      },
                      isSelected: widget.tabController.index == 2,
                    ),
                    const SizedBox(height: 10),
                    DrawerButton(
                      label: 'Course',
                      iconData: Icons.location_city,
                      onPressed: () {
                        changeIndex(3);
                      },
                      isSelected: widget.tabController.index == 3,
                    ),
                    const SizedBox(height: 10),
                    DrawerButton(
                      label: 'Streams',
                      iconData: Icons.location_city,
                      onPressed: () {
                        changeIndex(4);
                      },
                      isSelected: widget.tabController.index == 4,
                    ),
                    const SizedBox(height: 10),
                    DrawerButton(
                      label: 'Interests',
                      iconData: Icons.location_city,
                      onPressed: () {
                        changeIndex(5);
                      },
                      isSelected: widget.tabController.index == 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  final String label;
  final IconData iconData;
  final Function() onPressed;
  final bool isSelected, isDrawerOpen;
  const DrawerButton({
    super.key,
    required this.label,
    required this.iconData,
    required this.onPressed,
    this.isSelected = false,
    this.isDrawerOpen = true,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? primaryColor : Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: isSelected ? null : onPressed,
        hoverColor: Colors.grey[200],
        focusColor: Colors.grey[200],
        highlightColor: Colors.grey[200],
        splashColor: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: isDrawerOpen
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: isSelected ? Colors.white : primaryColor,
              ),
              if (isDrawerOpen) const SizedBox(width: 10),
              if (isDrawerOpen)
                Text(
                  label.toUpperCase(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isSelected ? Colors.white : primaryColor,
                      ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
