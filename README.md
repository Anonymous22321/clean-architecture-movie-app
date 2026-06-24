# VERY IMPORTANT NOTES:
Figma Link:
https://www.figma.com/board/nyVhlMVONU2OZJLvUuomTI/Flutter-Clean-Architecture?node-id=0-1&p=f&t=xNzvwJDPqGISLntm-0
Repository Link:
https://github.com/usamaaelgendy/solid-starter-project

- Point for later:
  while working, when start new project in development stage every error or exception should 
  appear in console, while on production stage errors or exceptions should appear on 
  "Crashlytics Logger" 

![Getx Diagram](https://i0.wp.com/flutterjunction.com/wp-content/uploads/2023/01/sadsa.png?resize=640%2C327&ssl=1)

## New Terminology:
- Monolithic class ⇒means "Single, Large that handles multiple, often unrelated functions that 
  should be split into Smaller, Specific classes".
- Monolithic app ⇒ it means "software program built as a single, unified, and indivisible unit,
  combining user interface, business logic, and data access layers into one large codebase".
- Abstract class ⇒ means a "contract defines WHAT something does WITHOUT specifying HOW it does it".
- There is a rule you must follow to enhance your mindset in coding:
  "DON'T REPEAT YOURSELF".
  this rule mean don't duplicate the code you write, the method, and the ideas. 
  If you write the same concrete implementation , method, or variable. this means 
  something went wrong. 
- SOC ⇒ stands for "Separate of Concerns"
- Singleton's purpose =>  is to control object creation , limiting the number of objects to one 
  but allowing flexibility to create new objects if needed.
- when making general abstract class that you know the return type may change ,you may 
  receive the return type . If not clear review section 12 (Callable class).  

## Reminders:
-  We can use inheritance principle when the relationship between parent and child ⇒
   "is a" relationship not "has a" relationship.
- In dart multiple inheritance not supported instead we use "mixin" to make multiple inheritance.

- What are Mixins?
  - Reusable pieces of code that can be added to classes to give them additional capabilities.
  - Mixins allow you to  add methods and properties to classes without using traditional 
    inheritance.
  - enabling interface composition with default implementation. 
- We can implement multiple interfaces in dart.

- Quick Revision on Repository:
  - Definition: The Repository pattern is an architectural design pattern that acts as a mediator
    (middleman) between your application's business logic (like GetX Controllers or ViewModels)
    and your data sources (like APIs, Firebase, or a local database).
  - Core Responsibilities:
    - Hides Data Origins: Your ViewModels call clean methods like getProducts(). They remain 
      completely blind to whether that data is coming from a remote Supabase backend, 
      a REST API, or a local cache.
    - Data Conversion (Mapping): It intercepts raw data payloads (like JSON maps or database rows),
      parses them safely into strongly-typed Dart model objects, and handles backend error 
      exceptions.
    - Single Source of Truth: It manages data coordination, such as checking if local database 
      data exists before wasting a network call to fetch data from the internet.

-

## Clean Architecture and SOLID Principles
   here we will learn make a project with clean code and learning about SOLID principles.
   now shall we start:
### First: What are SOLID principles? and Why to use them?
- Group of the principles that enhances your code to make it clean, readable, and maintainable. 
- Benefits:-
  1. Make code readable. 
  2. Reduce bugs and make it easy to fix.
  3. Facilitation of Development Cycle.
  4. Make code clean.
  5. Make it easy for modification and maintenance code.
### Second:What is Clean Architecture? Why Clean Architecture?
- It means Separate your application code into layers and these layers define SOC inside codebase.
- Also means Software design philosophy that separate the elements of a design into ring levels.
Clean Architecture pros:
- Make code readable.
- Reduce bugs and make it easy to fix.
- Facilitation of Development Cycle.
- Make code clean.
- Make it easy for modification and maintenance code.

### Second:What is Clean Architecture? Why Clean Architecture?
- It is a Fixed File Structure for building app, helps us to write a readable code.
- Clean Architecture Layers with flutter Framework:
1. Data Layer.
2. Domain Layer.
3. Presentation Layer.


S.O.L.I.D principles of Object-Oriented Design:

## Now, Let's begin S.O.L.I.D Principles:
- Every Character represent a principle of these principles
- So we have 5 principles let's talk about them:

### S ⇒ Represents Single Responsibility Principle:
- This is the first principle in SOLID.
- It means 
  - "A class should only do ONE thing.",
  - "A class should have only ONE reason to change".
- When to be violated ?
  This happens when the class have more than ONE reason to change.
### O ⇒ Represents Open / Closed Principle:
- This is the second principle in SOLID.
- Its definition is:
  - "Software entities should be OPEN for extension but CLOSED for modification".
  - "You should be able to add new functionality to your code WITHOUT changing existing code".
- This principle is a live example on an importance of OOP principles 
  abstraction, Polymorphism, inheritance, and encapsulation.
- To add new feature for specific type like "section 3.3" we can relay on mixin 
  as multiple inheritance to avoid ocp violation 
### L ⇒ Represents Liskov Substitution Principle: 
- This is the third principle in SOLID principles.
- It means "Objects of a Sub class  should be REPLACEABLE with objects of their Parent class
  WITHOUT breaking the application"
- The reason importance of this principle lies on avoiding breaking code which means substitute
  any subclass that conflicts with its parent class like example 4.1.
- This principle can open a wide sights for your coding way for solving problems in its best way.
- Violations of LSP:
  1. Altering desirable properties of the program.
  2. Unexpected Exception happens when subclass throw an error for an action the parent class
     handles normally.
  3. Ignored Methods happens when subclass has empty methods.
### I ⇒ Represents Interface Segregation Principle:
- The fourth principle in SOLID.
- Its definition is:
  - "Clients shouldn't be forced to depend on interfaces they don't use."
  - "No client should be forced to implement methods it doesn't need."
- The main difference between LSP and ISP, that ISP is for parent exception , 
  while the LSP is for subclass exceptions .   //(if not clear ,revision session 5.1).
- An important question you should always ask yourself to not make violations:
  "Are all subclass that implement specific parent interface class need all the methods in it?".
- Violations of ISP:
  1. Parent class implement irrelevant methods that subclass will not need them.
  2. A single interface mixes unrelated responsibilities.
  3.  Adding a new method to an interface requires all existing (and unrelated) 
      concrete classes to be updated.
- When using ISP is not the best case ?
  You should answer yourself a question to avoid this conflict 
  "Do we have shared logic(concrete implementation)?".
  If the answer is " YES " then ISP is not the best case cause it will break the rule 
  " Don't repeat yourself " in other words you will have to reimplement the same concrete 
  implementation every time you use the interface .
 to solve this problem we will resort to OOP , exactly to Mixins.
- 
### D ⇒ Represents Dependency Inversion Principle:
- The last principle in SOLID.
- Its Definition:
  - "High-level modules should not depend on Low-level modules. Both should depend on abstraction".
  - "Abstraction should not depend on details. Details should depend on abstractions".
- This principle doesn't mean Dependency Injection, don't conflict them.
- The DI(Dependency Injection):
  - Give objects what they need instead of letting them create it themselves.
  - Objects receive their dependencies from outside, rather than creating them internally.
- Types of DI:
  - Constructor Injection:
    - means inject required dependencies on constructor.
    - fits in cases like production-level and development-leve , which means by "logic"
      can't select more than  one class per run.
  - Field Injection:
    - means inject object on separate setter to use it on field (class) level. 
    - usage like MI, but the critical difference between them , when there is more than one 
      method have to inject the object on it , we use FI not MI.
  - Method Injection:
    - means Inject the object on method directly.
    - This type fits when there is more than one class implement abstraction in same scenario,
      and just one method need this injection,when all types can be used on
      same runtime. // If not clear revision session (6.2.2). 
- With application growth , DI may be become harder and harder cause you may need to inject 
  dependencies inside dependencies and that will be exhausted so we will rely on 
  package called get_it.
- Get_it package:
  - its power is to make a container that contain all dependencies needed.
  - usage: create file called "service_locator" file has all dependencies needed.
  - Important question you should ask yourself:
    - "Is this abstract class, every time I use it , I have to create new instance?"
      - If the answer is "No", then create "registerLazySingleton" to it.      //(session 3 DI) 
      - else use "registerFactory" which mean everytime use this class, 
        You create new instance.
  - ways to use it:
    - remove all CI and use serviceLocator Directly.
    - (most common use): create all classes constructors in service_locator file 
  - there is a critical flaw in this package:
    - you can use injection for object not created in "service_locator" file, and will not provide
      error in compile time but will appear in runtime.
- Violations:
  - when using low-level module directly in high-level module without contract, 
    leads to inflexibility. 

## Finally, we ended SOLID principles, now let's begin with clean architecture:

### Clean Architecture Layers in Flutter Framework:
- Domain Layer: Use cases, Entities.
- Data Layer: Repository, Model, Data Source (Local, Remote). 
- Presentation Layer: User Interfaces (UI),State Management(GetX,Provider,Bloc,Cubit).

### How to use Clean Architecture:
- First , you must understand project requirements deeply. cause the first layer is domain layer.
- Second , start create entities of project.
### Clean Architecture helps you Organize your thoughts
- When you start a new project , First thing you must do is analyze the project and its features,
  then divine your project into module which means(collecting similar things into same space).
- Second, Data Source, which means where exactly this data come from (local, server)
- Then , start create Layers and don't forget core folder.
  























# Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
