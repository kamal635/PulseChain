/// Defines the types of permissions used in the application.
enum PermissionKind {
  /// Bluetooth permission.
  bluetooth,

  /// Location permission.
  location,

  /// Battery optimization permission.
  battery,
}

/// Defines the status of a permission.
enum PermissionStatus {
  /// Permission has been granted.
  granted,

  /// Permission has been denied.
  denied,

  /// Permission has not been granted yet.
  notGrantedYet,
}
