import 'package:equatable/equatable.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/widgets.dart';

class AppIconsData extends Equatable {
  final AppIconIndividualData individualData;
  final AppIconSizeData sizes;

  const AppIconsData({
    required this.individualData,
    required this.sizes,
  });

  factory AppIconsData.main() => AppIconsData(
        individualData: AppIconIndividualData.main(),
        sizes: AppIconSizeData.main(),
      );

  @override
  List<Object?> get props => [
        individualData,
        sizes,
      ];
}

class AppIconIndividualData extends Equatable {
  final IconData settings;
  final IconData search;
  final IconData building;
  final IconData bookMark;
  final IconData signOut;
  final IconData profile;
  final IconData dismiss;

  const AppIconIndividualData({
    required this.settings,
    required this.search,
    required this.building,
    required this.bookMark,
    required this.signOut,
    required this.profile,
    required this.dismiss,
  });

  factory AppIconIndividualData.main() => const AppIconIndividualData(
        settings: FluentSystemIcons.ic_fluent_settings_dev_regular,
        search: FluentSystemIcons.ic_fluent_search_regular,
        building: FluentSystemIcons.ic_fluent_building_regular,
        bookMark: FluentSystemIcons.ic_fluent_bookmark_regular,
        signOut: FluentSystemIcons.ic_fluent_sign_out_regular,
        profile: FluentSystemIcons.ic_fluent_person_accounts_regular,
        dismiss: FluentSystemIcons.ic_fluent_pane_close_regular,
      );
  @override
  List<Object?> get props => [
        settings,
        search,
        building,
        bookMark,
        signOut,
        profile,
        dismiss,
      ];
}

class AppIconSizeData extends Equatable {
  final double small;
  final double regular;
  final double big;

  const AppIconSizeData({
    required this.small,
    required this.big,
    required this.regular,
  });

  factory AppIconSizeData.main() => const AppIconSizeData(
        small: 13.0,
        big: 25.0,
        regular: 20.0,
      );

  @override
  List<Object?> get props => [
        small,
        regular,
        big,
      ];
}
