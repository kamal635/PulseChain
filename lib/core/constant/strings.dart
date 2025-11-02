/// Defines application string constants.
abstract final class AppStrings {
  /// The name of the application.
  static const String appName = 'PulseChain';

  /// Welcome Page Strings
  static const String titleWelcom =
      'Offline messaging that hops device-to-device.';

  /// Welcome Page subtitle
  static const String subtitleWelcome = '''
No internet required. Messages can travel through nearby phones as you move.''';

  /// Feature Badge Strings
  static const String chipOnDeviceEncryption = 'On-device encryption.';

  /// Feature Badge Strings
  static const String chipMultiHopRelays = 'Multi-hop relays';

  /// Feature Badge Strings
  static const String chipBatteryFriendly = 'Battery-friendly.';

  /// Permission Requirement Strings
  static const String permissionRequirementSubTitle1 =
      'Allow Bluetooth to discover nearby devices.';

  /// Permission Requirement Strings
  static const String permissionRequirementSubTitle2 =
      'Required by the OS for reliable bluetooth scanning.';

  /// Permission Requirement Strings
  static const String permissionRequirementSubTitle3 =
      'keeps relays running reliably in the background.';

  /// Permission Requirement Titles
  static const String permissionRequirementTitle1 = 'Bluetooth';

  /// Permission Requirement Titles
  static const String permissionRequirementTitle2 = 'Location';

  /// Permission Requirement Titles
  static const String permissionRequirementTitle3 = 'Battery Optimization';

  /// Get Started Button Text
  static const String getstarted = 'Get Started';

  /// How It Works Page Title
  static const String howitworks = 'How It Works';

  /// Caption Text
  static const String captionNoAccount =
      'No account. No phone number. Everything stays on your device.';

  /// How It Works Step 1 Titles
  static const String howItWorksStep1Title = 'Create a local room';

  /// How It Works Step 1 Descriptions
  static const String howItWorksStep1Description =
      '''Start a conversation that’s only visible to devices nearby. No internet needed.''';

  /// How It Works Step 2 Titles
  static const String howItWorksStep2Title = 'Phones nearby relay your message';

  /// How It Works Step 2 Descriptions
  static const String howItWorksStep2Description =
      '''Other PulseChain users’ phones act as stepping stones, extending your message’s reach.''';

  /// How It Works Step 3 Titles
  static const String howItWorksStep3Title = 'Delivery confirmed';

  /// How It Works Step 3 Descriptions
  static const String howItWorksStep3Description =
      '''You’ll get a confirmation once your message reaches its destination, no matter the path it took.''';
}
