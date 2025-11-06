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

  /// Bluetooth Permission Titles
  static const String bluetoothPermissionTitle = 'Enable Bluetooth access';

  /// Bluetooth Permission Subtitles
  static const String bluetoothPermissionSubtitle =
      '''Discover and connect to nearby devices so messages can hop device-to-device.''';

  /// Bluetooth Permission Info Card Text
  static const String infoCardBluetoothPermission =
      '''PulseChain will request Bluetooth access to find and connect to nearby. We don’t track your location.''';

  /// Location Permission Titles
  static const String locationPermissionTitle =
      'Allow Location (required by Android)';

  /// Location Permission Subtitles
  static const String locationPermissionSubtitle =
      '''Android requires Location to scan for Bluetooth reliably. We don’t track your location.''';

  /// Location Permission Info Card Text
  static const String infoCardLocationPermission =
      '''PulseChain requests Location permission to ensure reliable Bluetooth scanning on Android devices. We do not track or store your location data.''';

  /// Battery Optimization Titles
  static const String batteryOptimizationTitle =
      'Keep relays working in the background';

  /// Battery Optimization Subtitles
  static const String batteryOptimizationSubtitle =
      'Disable battery optimization to prevent the OS from pausing relays';

  /// Battery Optimization Info Card Text
  static const String infoCardBatteryOptimization =
      'Exclude PulseChain from optimization';

  /// Allow Bluetooth Button Text
  static const String allowBluetooth = 'Allow Bluetooth';

  /// Allow Location Button Text
  static const String allowLocation = 'Allow Location';

  /// Not Granted Yet Text
  static const String notGranted = 'Not granted yet';

  /// Granted Text
  static const String granted = 'Granted';

  /// Denied Text
  static const String denied = 'Denied';

  /// Continue Button Text
  static const String continueText = 'Continue';

  /// Not Now Button Text
  static const String notNow = 'Not now';

  /// The permission is required.
  static const String required = 'Required';

  /// The permission is android only.
  static const String androidOnly = 'Android only';

  ///  /// The permission is recommended.
  static const recommended = 'Recommended';
}
