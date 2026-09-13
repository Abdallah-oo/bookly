import 'package:bookly/bookly_app.dart';
import 'package:bookly/core/dependency_injection/get_it.dart';
import 'package:bookly/core/services/hive/hive_services.dart';
import 'package:bookly/core/utils/helpers/setup_bloc_observer.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SetupBlocObserver();

  await _initHive();
  await dotenv.load(fileName: '.env');
  GetItServiceLocator.setup();
  runApp(const Bookly());
}

Future<void> _initHive() async {
  await Hive.initFlutter();
  _registerHiveAdapters();
  await _openHiveBoxes();
}

void _registerHiveAdapters() {
  Hive.registerAdapter(BookEntityAdapter());
}

Future<void> _openHiveBoxes() async {
  await Future.wait([Hive.openBox<BookEntity>(HiveService.homebooksBoxsName)]);
  await Future.wait([Hive.openBox<BookEntity>(HiveService.newestbooksBoxsName)]);
}
