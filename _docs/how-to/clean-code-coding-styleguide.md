# Clean Code Coding Style Guide

## What is Clean Code?

Def: Clean code is code that is easy to read, understand, and maintain. It follows a set of principles and best practices that enhance the quality of the codebase.

Clean code is characterized by:

- Should be readable and meaningful
- Should reduce cognitive load
- Should be concise and "to the point"
- Should avoid unintuitive names, complex nesting and big code blocks
- Should follow common best practices and patterns
- Should be fun to write and to maintain

## Key Pain Points

- Names - Variables, Functions, Classes
- Structure & Comments - Code Formatting, Good & Bad Comments
- Functions - Length, Parameters, Conditionals
- Conditionals & Error Handling - Deep Nesting, Missing Error Handling
- Classes & Data Structures - Missing Distinction, Bloated Classes

> Solutions:
>
> - Rules & Concepts
> - Patterns & Principles
> - Test-Driven Development (TDD)

## Clean Code VS Clean Architecture

- Clean Code - Focuses on hot wo write code - Focus on single problem files
- Clean Architecture - Focuses on where to write which code - Focus on the project as a whole

## Naming

### Variables

- Data containers - e.g. user input data, validation results, a list of products
- Use nouns or short phrases with adjectives

```js
const userData = { ... };
const isValid = true;
```

### Functions

- Commands or calculated values - e.g. send data to server, check if user is valid
- Use verbs ot short phrases with adjectives

```js
function sendData(data) { ... }
function inputIsValid(input) { ... }
```

### Classes

- Use classes to create "things" - e.g. a user, a product, a http request body
- Use nouns or short phrases with nouns

```js
class User { ... }
class RequestBody { ... }
```

### Naming Cases

- `snake_case` - `is_valid`, `send_response` - Common in Python - variables,functions, methods
- `camelCase` - `isValid`, `sendResponse` - Common in JavaScript, Java - variables, functions, methods
- `PascalCase` - `AdminRole`, `UserRepository` - Common in Python, Java, JavaScript - classes
- `kebab-case` - `side-drawer` - Common in HTML, CSS - file names, CSS classes

### Naming Variables, Constants & Properties

- Value is an Object - Describe the value - `user`, `database` - Provide more details without introducing redundancy - `authenticatedUser`, `sqlDatabase`
- Value is Number or String - Describe the value - `age`, `name` - Provide more details without introducing redundancy - `firstName`, `age`
- Value is Boolean - Answer a true/false question - `isValid`, `hasPermission` - Use prefixes like `is`, `has`, `can`, `should` to indicate boolean nature - `isAuthenticated`, `hasAccess`

### Naming Functions & Methods

- Function performs an operation - Describe the operation - `getUser()`, `response.send(...)` - provide more details without introducing redundancy - `getUserByEmail()`, `sendResponseToClient()`
- Function computes a Boolean - Answer a true/false question - `isValid()`, `purchase.isPaid()` - provide more details without introducing redundancy - `emailIsValid(...)`, `purchase.isPaid(...)`

### Naming Classes

- Describe the Object - `User`, `Product`, `HttpRequest` - Provide more details without introducing redundancy - `Customer`, `Course` - Avoid redundant suffixes like `Data`, `Info`, `Details` - `UserData` -> `User`, `ProductInfo` -> `Product`

### Common Error & Pitfalls

- Don't include redundant information in names - `userWithNameAndAge` -> `user` (`name` and `age` are already properties of the user object)
- Avoid unclear abbreviations - `getUsrById` -> `getUserById` (`Usr` is not a common abbreviation)
- Avoid single-letter names - `x`, `y`, `z` - Use descriptive names instead - `user`, `product`, `order`
- Avoid slang or jargon - `getTheThing()` -> `getUserById()` (avoid vague terms like "thing")
- Avoid disinformation - `userList = {u1: "...", u2: "..."}` - Use clear and accurate names - `userMap = {user1: "...", user2: "..."}`, `allAccounts = accounts.filter()` -> `filteredAccounts = accounts.filter()`

## Code Structure, Comments & Formatting

### Bad Comments & Good Comments

- **Bad Comments**: Explain what the code does, but not why it does it. They can be misleading or redundant.

  ```js
  // This function sends data to the server
  function sendData(data) { ... }
  ```

  - Redundant information - Dividers/Block Markers - Misleading Comments - Commented-out Code - TODOs without context

- **Good Comments**: Explain why the code does what it does. They provide context and reasoning.
  ```js
  // Send user data to the server for processing
  function sendData(data) { ... }
  ```
  - Legal information - Explanation which can't be replaced by good naming - Warning - Todo Notes

### Code Formatting

- Use consistent indentation (2 or 4 spaces)
- Use spaces around operators and after commas
- Use line breaks to separate logical blocks of code
- Limit line length to 80-120 characters
- Use blank lines to separate sections of code
- Use consistent naming conventions (camelCase, snake_case, etc.)

## Functions & Methods

- calling the function should be readable - the number and order of arguments matter
- working with the function should be easy & readable - the length of the function body matters
- the function should do one thing - the number of parameters matters

### Keep the number of parameters low

- Prefer 0-2 parameters
- Use objects for multiple parameters
- Use default parameters for optional values
- Avoid using `arguments` objects

### Beware of Output Parameters

- Avoid using output parameters (parameters that are modified by the function) - they can lead to confusion and make the code harder to read by introducing side effects
- Prefer returning a value instead
- If output parameters are necessary, use clear naming to indicate their purpose

### Function should be small and do one thing

- Keep functions short (ideally under 20 lines)
- Each function should have a single responsibility
- Avoid deep nesting and complex logic
- Use early returns to simplify control flow

### Multiple Levels of Abstraction

- High Level - `isEmail(email)` - this is easy to read - there is no room for interpretations
- Low Level - `email.includes("@") && email.includes(".")` - this is harder to read - it requires more cognitive load to understand

### Why the "Level of Abstraction" matters

- Functions should do work that is one level of abstraction below their name
- GOOD: this function should return yes/no (true/false) - based on email validity

```js
function emailIsValid(email) {
  return email.includes("@") && email.includes(".");
}
```

- BAD: this function should orchestrate all the steps that are required to save a user

```js
function saveUser(email) {
  if (email.includes("@") && email.includes(".")) {
    // Save user logic
  }
}
```

### Try NOT to Mix Levels of Abstraction

- BAD - we need to read, understand and interpret the different steps

```js
if (!email.includes("@")) {
  console.log("Invalid email");
} else {
  const user = new User(email);
  user.save();
}
```

- GOOD: we just need to read the different steps

```js
if (!emailIsValid(email)) {
  showError("Invalid email");
} else {
  saveNewUser(email);
}
```

### Keeping Function Short Rule of Thumb

- extract code that works in the same functionality - `user.setAge(32)`, `user.setName("John")` -> `user.update({age: 31, name: "John"})`
- extract code that requires more interpretation than the surrounding code - `if((!email.includes('@')) { ... }` -> `if(!emailIsValid(email)) { ... }`

### DRY - Don't Repeat Yourself

> Should try to follow as much as possible the DRY principle - Don't Repeat Yourself

- Avoid duplicating code - extract common functionality into functions or classes
- Use helper functions to encapsulate repeated logic
- Use libraries or frameworks to avoid reinventing the wheel
  > Signs of code which "is not DRY":
  >
  > - you find yourself copying and pasting code
  > - you have multiple functions that do the same thing
  > - you have multiple classes that do the same thing
  > - you need to apply the same change in multiple places in your codebase

### KISS - Keep It Simple, Stupid

> Should try to follow as much as possible the KISS principle - Keep It Simple, Stupid

- Avoid unnecessary complexity - keep the code simple and straightforward
- Use simple data structures and algorithms
- Avoid over-engineering - don't add features or complexity that are not needed

> Signs of code which "is not KISS":
>
> - you have complex logic that is hard to follow
> - you have multiple layers of abstraction that are not needed
> - you have unnecessary dependencies or complexity in your code

### YAGNI - You Aren't Gonna Need It

> Should try to follow as much as possible the YAGNI principle - You Aren't Gonna Need It

- Don't add functionality until it is needed - avoid speculative coding
- Focus on the current requirements and avoid adding features that are not needed
- Refactor and improve the code as requirements change

> Signs of code which "is not YAGNI":
>
> - you have code that is not used
> - you have code that is not needed for the current requirements
> - you have code that is not needed for the current functionality

### Do not OVERDO It - Avoid Useless Extraction - Use Common Sense

> Always question if the extraction is really needed
> Always question if the change is really improving readability

- Opinion - you should split functions reasonably -> being as granular as possible will not automatically improve readability
  - Make reasonable decisions and do not split if: you are renaming the operation, finding the new function will take longer than reading the extracted code, can't produce a reasonable name for the extracted function

### What is & How to avoid (UNEXPECTED) Side Effects

> Keep functions pure - same input should always produce the same output
> Avoid side effects - functions should not modify external state or variables

- A SIDE EFFECT is an operation which does not just act on function inputs and change the function output but which instead changes the overall system / program state.
- SIDE EFFECTS are not automatically bad - we do need them in our programs - but unexpected side effects should be avoided

- Naming for side effects:
  - `saveUser(user)` - side effect is expected
  - `isValid(user)` - side effect is NOT expected
  - `showMessage(...)` - side effect expected
  - `createUser(...)` - side effect NOT NECESSARILY expected
- If you need a side effect, make it clear in the function name
- Avoid side effects in functions that are expected to be pure - e.g. `isValid(user)` should not modify the user object or any global state
- Use pure functions whenever possible - they are easier to test and reason about
- If a function has side effects, document them clearly
- Use tools like linters to detect unexpected side effects in your code

### Testing Matters

- Unit testing helps write clean code - because it forces you to think if you can easily test a function - if the function does too many things, has side effects, or is too complex, it will be hard to test
- Write tests for your functions - this will help you identify potential issues and improve the code quality
- Use test-driven development (TDD) to write tests before implementing the code - this will help you focus on the requirements and avoid over-engineering
- Use mocking and stubbing to isolate functions and test them independently
- Use integration tests to test the interaction between different components of your code

## Control Structures & Errors (Code smart, NOT verbose)

> Should avoid ARROW code - code with deep nesting, complex conditionals, and verbose error handling (name like this because it looks like an arrow pointing downwards)

### Useful Concepts

- Avoid Deep Nesting - use early returns to simplify control flow
  - Use Factory functions & Polymorphism to avoid complex conditionals
  - Utilize Errors and Exceptions to handle errors gracefully
- Prefer Positive Checks (if isEmpty VS isNotEmpty)

### Guards

- Use guard clauses to handle special cases early in the function
- This helps to reduce nesting and improve readability

- BAD:

```js
if (email.includes("@")) {
  // DO STUFF
}
```

```js
if (user.active) {
  if (user.hasPermission) {
    // DO STUFF
  }
}
```

- GOOD:

```js
if (!email.includes("@")) {
  return; // FAIL FAST
}
// DO STUFF
```

```js
if (!user.active || !user.hasPermission) {
  return; // FAIL FAST
}
// DO STUFF
```

### Other Useful Patterns

- Extract control structures into functions & prefer positive checks
- Use early returns to simplify control flow
- Invert conditionals to reduce nesting
- Extract validation code into separate functions
- Use Error guards to handle special cases

### Embrace Error & Error Handling

- throwing & handling errors can replace if statements and lead to more focused functions
  > RULE: If something is an error -> Make it an error.

```js
if (!isEmail) {
  return { code: 422, message: "Invalid email" };
}
```

```js
if (!isEmail) {
  const error = new Error("Invalid email");
  error.code = 422;
  throw error;
}
```

### Using Factory Functions & Polymorphism

- Factory functions - function that produces an object or a value based on some input
- Polymorphism - ability to use different implementations of a function or method based on the input

```js
function getTransactionProcessor(type) {
  if (type === "credit") {
    return new CreditTransactionProcessor();
  } else if (type === "debit") {
    return new DebitTransactionProcessor();
  } else {
    throw new Error("Unknown transaction type");
  }
}
}
```

### Avoid Magic Numbers & Strings

```js
const TRANSACTION_TYPE_CREDIT = "credit";
const TRANSACTION_TYPE_DEBIT = "debit";

function getTransactionProcessor(type) {
  if (type === TRANSACTION_TYPE_CREDIT) {
    return new CreditTransactionProcessor();
  } else if (type === TRANSACTION_TYPE_DEBIT) {
    return new DebitTransactionProcessor();
  } else {
    throw new Error("Unknown transaction type");
  }
}
```

## Objects, Classes & Data Containers / Structures

> Clean Code <==> Patterns & Principles
> Write code which is readable and easy to understand <==> Write code which is maintainable and extensible

### Objects VS Data Containers / Data Structures

- Objects - encapsulate behavior and data - e.g. `User`, `Product`, `HttpRequest`
  - private internals / properties, public APIs (methods) to interact with the object
  - contains your business logic (in OOP) or functions (in FP)
  - abstractions over concrete data and behavior
- Data Containers / Data Structures - encapsulate data only - e.g. `UserData`, `ProductData`, `HttpRequestData`
  - public properties, no private internals, (almost) no API methods
  - store and transport data, but do not contain business logic or functions
  - concretes only data, no behavior

```js
class User {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }

  getName() {
    return this.name;
  }

  setAge(age) {
    this.age = age;
  }
}
```

```js
class UserData {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }
}
```

#### Why it Matters

- Because you can end-up writing bad code if you don't distinguish between objects and data containers
- by mistake, you might expose internal implementation details or create tight coupling between components
- you might inadvertently introduce bugs or make the code harder to maintain

### Classes & Polymorphism

- Use classes to encapsulate behavior and data
- Use inheritance and interfaces to achieve polymorphism
- Polymorphism is the ability of an object to take on many forms
- It allows you to use different implementations of a method or function based on the object type and avoids complex conditionals

```js
class User {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }
}

class AdminUser extends User {
  constructor(name, age, permissions) {
    super(name, age);
    this.permissions = permissions;
  }

  hasPermission(permission) {
    return this.permissions.includes(permission);
  }
}
```

### Classes Should Be Small

- you typically should prefer many small classes over a few large classes
- classes should have a single responsibility (SRP - Single Responsibility Principle)
- classes should be focused on a single task or functionality

### Cohesion & Coupling

- Cohesion - how closely related and focused the responsibilities of a single class are
  - High cohesion - class has a single responsibility and does it well
  - Low cohesion - class has multiple responsibilities and is harder to maintain
  - How much are your class methods using the class properties?
    - Maximum Cohesion - all methods use the class properties - a highly cohesive object
    - No Cohesion - all methods do not use any class properties - data structures / containers with utility methods
- Coupling - how closely related different classes are
  - Low coupling - classes are independent and can be changed without affecting each other
  - High coupling - classes are tightly connected and changes in one class affect others

### The "Law of Demeter" (LoD)

- A class should only interact with its immediate friends and not with the friends of its friends
- This helps to reduce coupling and improve maintainability
- Principle of least knowledge - do not depend on the internals of "strangers" (other objects which you do not directly know)
- Code in a method may only access direct internals (properties and methods) of:
  - the object it belongs to
  - objects that are stored in properties of that objects
  - objects which are received as methods parameters
  - objects which are created in the method

```js
function deliverLastPurchase() {
  // const date = this.customer.lastPurchase.date; // BAD - accessing a property of a property
  // const date = this.customer.getLastPurchaseDate(); // GOOD - using a method of the object

  // this.warehouse.deliverPurchaseByDate(this.customer, date); // BAD - accessing a property of a property of a property
  this.warehouse.deliverPurchaseByDate(this.customer.lastPurchase); // GOOD - accessing a property of the object and leave the extraction of date to the warehouse
}
```

### Why you should TELL, not ASK

- Avoid using getters and setters to access or modify properties of an object
- Instead, use methods that encapsulate the behavior and logic of the object

### SOLID Principles
- **S** - Single Responsibility Principle (SRP) - a class should have only one reason to change
- **O** - Open/Closed Principle (OCP) - a class should be open for extension but closed for modification
- **L** - Liskov Substitution Principle (LSP) - objects of a superclass should be replaceable with objects of a subclass without affecting the correctness
- **I** - Interface Segregation Principle (ISP) - a class should not be forced to implement interfaces it does not use
- **D** - Dependency Inversion Principle (DIP) - high-level modules should not depend on low-level modules, both should depend on abstractions

#### Single Responsibility Principle (SRP)
Restringing classes to one core responsibility leads to smaller classes -> Smaller classes tend to be easier to read
```js
class User {
    login(email: string, password: string): void {}
    signUp(email: string, password: string): void {}
    assignRole(role: string): void {}
}
```
## Clean Code Checklist

### Naming
- [ ] Use descriptive ane meaningful names for variables, functions, and classes
  - [ ] Variable & Properties - nouns or short phrases with adjectives
  - [ ] Functions & Methods - verbs or short phrases with adjectives
  - [ ] Classes - nouns or short phrases with nouns
- [ ] Be as specific as necessary adn possible
- [ ] Use YES/NO "questions" for boolean variables
- [ ] Avoid misleading names
- [ ] Be consistent with your names (eg. stick to get instead of fetch, or use snake_case instead of camelCase)
### Comments & Formatting
- [ ] Most comments are BAD - avoid them!
- [ ] Some good comments are acceptable
  - [ ] Legal comments
  - [ ] Warnings
  - [ ] Helpful explanations (eg. Regex, complex logic)
  - [ ] Todos (do not overdo it though)
- [ ] use vertical formatting
  - [ ] Keep related concepts close to each other (vertical density)
  - [ ] Add spacing/distance (eg. blank lines) between concepts that are not directly related (vertical distance)
  - [ ] Write code top bottom: called function should come below calling function (if possible)
- [ ] Use horizontal formatting
  - [ ] Avoid long lines (80-120 characters)
  - [ ] Use indentation to express scope and hierarchy
### Functions
- [ ] Limit the number of parameters your function use - less is better
  - [ ] Levels of abstraction inside the function body should be one level below the level implied by the function name
  - [ ] Avoid mixing levels of abstractions in functions
  - [ ] But: Avoid redundant splitting!
- [ ] Stay DRY - Don't Repeat Yourself
- [ ] Avoid unexpected side effects
### Control Structures & Errors
- [ ] Keep it simple - avoid complex conditions and nested structures
- [ ] Use early returns to reduce nesting
- [ ] Handle errors gracefully - use try/catch where appropriate
- [ ] Prefer positive checks (if isEmpty VS isNotEmpty)
- [ ] Avoid deep nesting - use guards and early returns
  - [ ] Consider using GUARD statements
  - [ ] Consider using POLYMORPHISM and FACTORY functions to avoid complex conditionals
  - [ ] Extract control structures into separate functions
- [ ] Consider using "real" errors (with error handling) instead of "synthetic errors" built with if statements
### Objects, Classes & Data Structures
- [ ] Prefer composition over inheritance
- [ ] Keep your data structures simple and focused
- [ ] Use immutable data structures where possible
- [ ] Focus on building "real objects" or data containers / structures
- [ ] Build small classes - focus on a single responsibility (which does not mean "single method")
- [ ] Build classes with high cohesion and low coupling
- [ ] Follow the "Law of Demeter" for "real objects" (avoid accessing properties of properties eg. `this.customer.lastPurchase.date`)
- [ ] Especially when using OOP - follow SOLID principles
- [ ] Especially SRP and OCP will help a lot with writing clean code (= readable and maintainable code)