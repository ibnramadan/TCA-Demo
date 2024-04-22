## What is The Composable Architecture

`TCA` is one of the variations of [unidirectional architectures](https://medium.com/@atimca/how-to-cook-reactive-programming-part-1-unidirectional-architectures-introduction-5c73f3f7793d) family, such as `Redux`, `RxFeedback`, `Flux` etc. Let's just copy some explanation from the [official GitHub](https://github.com/pointfreeco/swift-composable-architecture).

This library provides a few core tools you can use to build applications of varying purposes and complexity. It provides compelling stories that you can follow to solve many day-to-day problems you encounter when building applications, such as:

* **State management**
 <br> How to manage the state of your application using simple value types, and share the state across many screens. This way, you can see mutations in one screen immediately in another.

* **Composition**
 <br> How to break down large features into smaller components that can be extracted to their own, isolated modules. And that you can easily glued back together to form the feature.

* **Side effects**
 <br> How to let certain parts of the application talk to the outside world in the most testable and understandable way possible.

* **Testing**
 <br> How to test a feature built in the architecture, but also write integration tests for features that have been composed of many parts. Also: how to write end-to-end tests to understand how side effects influence your application. This allows you to make strong guarantees that your business logic is running in the way you expect it to.

* **Ergonomics**
 <br> How to accomplish all of the above in a simple API with as few concepts and moving parts as possible.

To build a feature using the Composable Architecture, let's define some types and values that model a domain:

* **State**
 <br> A type that describes the data your feature needs to perform its logic and render its UI.

* **Action**
 <br> A type that represents all actions that can happen in your features, such as user actions, notifications, event sources et cetera.

* **Environment**
 <br> A type that holds any dependencies the feature needs, like API clients, analytics clients and so on.

* **Reducer**
 <br> A function that describes how to evolve the current state of the app to the next state given an action. The reducer is also responsible for returning any effects that should be run, such as API requests, which can be done by returning an Effect value.

* **Store**
 <br> The runtime that actually drives your feature. You send all user actions to the store so that the store can run the reducer 
