import 'dart:convert';

import 'package:eblendrang2/blocs/blocs_exports.dart';
import 'package:eblendrang2/pages/detail_dokumen.dart';
import 'package:eblendrang2/pages/home/main_page.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:eblendrang2/blocs/blocs_exports.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:supercharged/supercharged.dart';

import '../models/models.dart';
import '../providers/auth_provider.dart';
import '../themes.dart';

part 'dokumen_instansi.dart';
part 'informasi.dart';
part 'general_page.dart';
