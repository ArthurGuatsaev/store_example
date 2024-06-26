import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_example/get_any/data/repositories/any_data_repository.dart';
import 'package:store_example/get_any/data/repositories/file_native_worker/file_native_worker_data.dart';
import 'package:store_example/get_any/domain/blocs/any/any_bloc_bloc.dart';
import 'package:store_example/get_any/domain/repositories/any_repository.dart';
import 'package:store_example/get_any/domain/repositories/file_native_worker/file_native_worker.dart';
import '../../themes/theme.dart';
import '../navigation/router.dart';
part 'domain/dependencies.dart';
part 'domain/initialize.dart';
part 'domain/repo.dart';
part 'view/home_app.dart';
part 'view/loading_app.dart';
