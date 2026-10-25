// Copyright 2013 The Flutter Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/services.dart' show ByteData;
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

/// A collection of properties used to specify custom behavior of the
/// GoogleFonts library.
class GoogleFontsConfig {
  /// Whether or not the GoogleFonts library can make requests to
  /// [fonts.google.com](https://fonts.google.com/) to retrieve font files.
  bool allowRuntimeFetching = true;

  /// The HTTP client used to fetch fonts.
  ///
  /// If this is null, a shared default [http.Client] will be used.
  ///
  /// If you supply a client, you are responsible for closing it.
  http.Client? httpClient;

  /// Changes the bytes of each font file before it is registered.
  ///
  /// Called with the family name (for example `Tenali Ramakrishna`) and the
  /// verified file, from the asset bundle, the device cache, or the network.
  /// The cached file is not changed. Return [bytes] to keep the font as is.
  ///
  /// Set it before the first font loads: a font that has loaded keeps its
  /// bytes until [clearCache]. Telosnex fork.
  ByteData Function(String family, ByteData bytes)? fontBytesTransform;
}

/// Deprecated. Use [GoogleFontsConfig] instead.
@Deprecated('Use GoogleFontsConfig instead')
typedef Config = GoogleFontsConfig;

/// Shared configuration instance for the Google Fonts library.
///
/// This instance is not exported and is not meant for public consumption.
/// Applications should configure Google Fonts using `GoogleFonts.config` or
/// `GoogleFontsLite.config`.
@internal
final GoogleFontsConfig sharedGoogleFontsConfig = GoogleFontsConfig();
