import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Album {
  final int userId;
  final int id;
  final String title;
  final Image thumbnail;

  const Album ({
    required this.userId,
    required this.id,
    required this.title,
    required this.thumbnail,
  })

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      thumbnail: json['thumbnail']
    );
  }
}