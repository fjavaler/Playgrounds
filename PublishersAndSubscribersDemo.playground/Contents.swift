import Combine
import Foundation

var subscriptions = Set<AnyCancellable>()

/// "Combinified" notification center.
example(of: "NotificationCenter") {
  // Create a notification center instance.
  let notificationCenter = NotificationCenter.default
  
  //Create a notification.
  let myNotification = Notification.Name("MyNotification")
  
  // Make notification center a publisher.
  let publisher = notificationCenter
    .publisher(for: myNotification, object: nil)
  
  // Create a subscription to the publisher.
  let subscription = publisher
    .print()
    .sink { _ in
      print("Notification received from a publisher!")
    }
  
  // Post a notification.
  notificationCenter.post(name: myNotification, object: nil)
  
  // Cancel the subscription.
  subscription.cancel()
}

// Two types of subscribers: sink and assign

/// Sink
example(of: "Just") {
  let just = Just("Hello World")
  just
    .sink { completion in
      print("Received Completion:", completion)
    } receiveValue: { string in
      print("Received Value:", string)
    }
    .store(in: &subscriptions)
}

/// Assign
example(of: "assign(to:on:") {
  class SomeObject {
    var value: String = "" {
      didSet {
        print(value)
      }
    }
  }
  
  let object = SomeObject()
  ["Hello","World!"].publisher
    .print()
    .assign(to: \.value, on: object)
    .store(in: &subscriptions)
}

/*
 Go-betweens:
 PassthroughSubject and CurrentValueSubject
 */

/// PassthroughSubject
example(of: "PassthroughSubject") {
  let subject = PassthroughSubject<String, Never>()
  
  subject
    .sink { value in
      print(value)
    }
    .store(in: &subscriptions)
  
  subject.send("Hello")
  subject.send("World")
  subject.send(completion: .finished)
  subject.send("Still there?")
}

/// CurrentValueSubject
example(of: "CurrentValueSubject") {
  let subject = CurrentValueSubject<Int, Never>(0)
  
  subject
    .print()
    .sink { value in
      print(value)
    }
    .store(in: &subscriptions)
  
  print(subject.value)
  
  subject.send(1)
  subject.send(2)
  
  print(subject.value)
  
  subject.send(completion: .finished)
}

/// Type erasure.
example(of: "Type erasure") {
  let subject = PassthroughSubject<Int, Never>()
  
  let publisher = subject.eraseToAnyPublisher()
  
  //   Erase doesn't allow you to send values through it.
  //  publisher.send(0)
  
  publisher
    .sink { value in
      print(value)
    }
    .store(in: &subscriptions)
  
  subject.send(0)
}
