import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/language/const.dart';
import 'package:template/routes/app_routes.dart';
var language = [
  {
    "country" : vn,
    'image_country': 'assets/images/vn.png',
    "key" : 'vi',
  },
  {
    "country" : en,
    'image_country': 'assets/images/en.jpg',
    "key" : 'en',
  },
];
var menu = [
  {
    "title" : 'Action',
    'icon': Icons.article_outlined,
    'screen': '',
  },
  {
    "title" : 'Action',
    'icon': Icons.article_outlined,
    'screen': '',
  },
  {
    "title" : 'Action',
    'icon': Icons.article_outlined,
    'screen': '',
  },
  {
    "title" : 'Action',
    'icon': Icons.article_outlined,
    'screen': '',
  },
  {
    "title" : vn,
    'icon': Icons.language,
    'screen': AppRoutes.LANGUAGE,
  },
  {
    "title" : logOut,
    'icon': Icons.arrow_forward_rounded,
    'screen': AppRoutes.SIGN_IN,
  },
];