# Coordinator Pattern Study

This repository is a study on the Coordinator pattern, a design pattern used to manage the navigation flow of an iOS application.

## What are Coordinators?

Coordinators are objects that manage the presentation and dismissal of view controllers, allowing for a decoupled and modular approach to navigation.

## Coordinator Protocol Breakdown

The `Coordinator` protocol is defined as follows:

* **Properties**
	+ `parentCoordinator`: The parent coordinator of this coordinator.
	+ `childCoordinators`: The child coordinators of this coordinator.
	+ `navigationController`: The navigation controller associated with this coordinator.
* **Methods**
	+ `start()`: Starts the coordinator's navigation flow.
* **Extensions**
	+ `childDidFinish(_:)`: Removes a child coordinator from this coordinator's child coordinators array.
	+ `replaceCurrentCoordinator(with:)`: Replaces the current coordinator with a new one, handling the necessary bookkeeping and navigation.

## Example Use Case

This repository includes an example use case that demonstrates the Coordinator pattern in action. The scenario is as follows:

* The `RootCoordinator` is initialized and starts the app's navigation flow.
* The `RootCoordinator` activates the `LoginCoordinator`, which presents the login view controller.
* From the login view controller, the user can navigate to either the `RegisterCoordinator` or the `HomeCoordinator`.
* If the user navigates to the `RegisterCoordinator`, they can only go back to the `LoginCoordinator`.
* If the user navigates to the `HomeCoordinator`, the `LoginCoordinator` and `RegisterCoordinator` are deallocated, and the `HomeCoordinator` becomes a child of the `RootCoordinator`.
* From the `HomeCoordinator`, the user can navigate to the `SettingsCoordinator` using a push behavior, or log out, which will restore the `LoginCoordinator` and deallocate the `HomeCoordinator` and `SettingsCoordinator`.

This approach allows for efficient memory management, as unused coordinators are deallocated when they are no longer needed. The `RootCoordinator` remains the only constant throughout the app's navigation flow, and is responsible for initializing the app's navigation flow and allowing for custom initialization if needed.

By using this approach, we can avoid holding onto unused coordinators and reduce memory usage, making our app more efficient and responsive. The Coordinator pattern provides a clear and modular way to manage navigation flows, making it easier to develop and maintain complex iOS applications.
