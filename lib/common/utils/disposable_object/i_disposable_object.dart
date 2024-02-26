/// Interface for objects in which the state must be reset before
/// their destruction/removal from the tree by dependencies.
// ignore: one_member_abstracts
abstract class IDisposableObject {
  /// Method for resetting the state of an object before destroying it.
  void dispose();
}
