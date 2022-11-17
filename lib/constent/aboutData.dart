import 'package:flutter/material.dart';
import 'package:sarowar/model/about.dart';

class AboutData {
  List<About> data = [
    About(
        icon: Icons.speed,
        name: 'Fast',
        text: "Fast load times and lag free interaction, my highest priority."),
    About(
        icon: Icons.devices,
        name: 'Responsive',
        text: "My layouts will work on any device, big or small."),
    About(
        icon: Icons.tips_and_updates,
        name: 'Intuitive',
        text: "Strong preference for easy to use, intuitive UX/UI."),
    About(
        icon: Icons.rocket_launch,
        name: 'Dynamic',
        text:
            "Websites don't have to be static, I love making pages come to life."),
  ];
}
