import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/l10n/l10n.dart';
import 'package:flutter_maps/map/map.dart';
import 'package:flutter_maps/theme/theme.dart';
import 'package:locations_repository/locations_repository.dart';

class App extends StatelessWidget {
  const App({
    required LocationsRepository locationsRepository,
    super.key,
  }) : _locationsRepository = locationsRepository;

  final LocationsRepository _locationsRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _locationsRepository,
      child: MaterialApp(
        theme: AppTheme.light,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const MapPage(),
      ),
    );
  }
}
