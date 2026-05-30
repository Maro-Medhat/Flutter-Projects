import 'package:flutter/material.dart';
import 'package:practical_3/model/plan_model.dart';

List<PlanModel> dummyPlans = [
  PlanModel(
    id: 1,
    title: "Vinyasa Flow",
    subtitle: "Vinyasa Flow Subtitle",
    imgPath: "assets/image_1.png",
    price: 25.00,
  ),
  PlanModel(
    id: 2,
    title: "Morning HIIT Blast",
    subtitle: "Morning HIIT Blast Subtitle",
    imgPath: "assets/image_2.png",
    price: 25.00,
  ),
  PlanModel(
    id: 3,
    title: "Rhythm Cycling",
    subtitle: "Rhythm Cycling Subtitle",
    imgPath: "assets/image_3.png",
    price: 25.00,
  ),
];

List<String> dummyTypes = [
  "All", "Yoga", "HIIT", "Cycling", "Pilates"
];

List<String> dummyDays = [
  "Mon", "Tue", "Wed", "Thu", "Fri"
];

List<List<dynamic>> dummyCardsContent = [
  [Icons.access_time_filled_rounded, "Duration", "60 minutes"],
  [Icons.leaderboard, "Level", "Intermediate"],
  [Icons.local_fire_department_rounded, "Calories", "450-600"],
];