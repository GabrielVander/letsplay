// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();

  static S current;

  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();

      return S.current;
    });
  }

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Explore`
  String get explorePageHeaderTitle {
    return Intl.message(
      'Explore',
      name: 'explorePageHeaderTitle',
      desc: '',
      args: [],
    );
  }

  /// `Find people to play with`
  String get explorePageHeaderSubtitle {
    return Intl.message(
      'Find people to play with',
      name: 'explorePageHeaderSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `My followers`
  String get explorePageMyFollowersTabTitle {
    return Intl.message(
      'My followers',
      name: 'explorePageMyFollowersTabTitle',
      desc: '',
      args: [],
    );
  }

  /// `New people`
  String get explorePageNewPeopleTabTitle {
    return Intl.message(
      'New people',
      name: 'explorePageNewPeopleTabTitle',
      desc: '',
      args: [],
    );
  }

  /// `Cute gamer dog image`
  String get explorePageMyFollowersTabContentIllustrationLabel {
    return Intl.message(
      'Cute gamer dog image',
      name: 'explorePageMyFollowersTabContentIllustrationLabel',
      desc: '',
      args: [],
    );
  }

  /// `Oops...`
  String get explorePageMyFollowersTabContentMessageTitle {
    return Intl.message(
      'Oops...',
      name: 'explorePageMyFollowersTabContentMessageTitle',
      desc: '',
      args: [],
    );
  }

  /// `You should be logged in to access this`
  String get explorePageMyFollowersTabContentMessageBody {
    return Intl.message(
      'You should be logged in to access this',
      name: 'explorePageMyFollowersTabContentMessageBody',
      desc: '',
      args: [],
    );
  }

  /// `Cute sleepy koala image`
  String get explorePageNewPeopleTabContentIllustrationLabel {
    return Intl.message(
      'Cute sleepy koala image',
      name: 'explorePageNewPeopleTabContentIllustrationLabel',
      desc: '',
      args: [],
    );
  }

  /// `Oh no...`
  String get explorePageNewPeopleTabContentMessageTitle {
    return Intl.message(
      'Oh no...',
      name: 'explorePageNewPeopleTabContentMessageTitle',
      desc: '',
      args: [],
    );
  }

  /// `It seems no one is online. Help us grow by sharing the app with your friends!`
  String get explorePageNewPeopleTabContentMessageBody {
    return Intl.message(
      'It seems no one is online. Help us grow by sharing the app with your friends!',
      name: 'explorePageNewPeopleTabContentMessageBody',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}
