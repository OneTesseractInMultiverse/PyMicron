# PyMicron

## Why Microservices?

Microservices are easier to test due to the fact that services are smaller. Microservices
can also be deployed independently which decouples services from each other and allow it 
service's code to evolve at their own speed. Organization of the development effort can also
be done by using multiple development teams. Each team, can own the responsibility for one or
more services. Each team is then capable of deploying and scaling their services independently
from each other. 

The fact that microservices are smaller programs, makes them also easier for developers to 
understand which allows organizations to put new developers up to speed faster. Another great
advantage, is the fact that microservices eliminate the long-term commitment to a technology stack
due to the fact that each service can pick the technology stack that better suites the requirements
and the skills of the development team. 

Microservices offer a higher degree of fault tolerance due to a higher degree of fault isolation
between services. 

### Drawbacks of microservices

Microservices are not a silver bullet, the do have some drawbacks that might not make it the ideal
solution in multiple scenarios. The first and most obvious drawback is the additional complexity
of creating distributed systems. Developers might need to implement inter-service communication
mechanisms. Managing transactional consistency across multiple services can be a difficult and 
complex task. Use cases that span multiple services require careful coordination between the teams. 
From an operational perspective, managing multiple services can be a high demanding task and more
overall resources might be consumed.

## Decomposing an application into services

Deciding how to partition an application into  microservices is often a difficult task. There are
some strategies that can help on this task:

- **Decompose by business capability:** The main idea in this approach is to define services 
corresponding to business capabilities.

- **Decompose by domain-driven design sub-domain**

- **Decompose by verb or use case:** In this strategy, services are defined in correspondence 
with particular actions. e.g. *Product Ordering Service* that is responsible for managing complete 
product orders.

- **Decompose by nouns or resources:** Define services that are responsible for all operations 
on entities/resources of a given type. e.g. *Identity Service* that is responsible for managing 
user identities. 

The main idea, is that each service should only have a small set of responsibilities. A good idea
is to look into Robert C. Martin's talk about the Single-Responsibility-Principle (SRP). The SRP 
defines a responsibility of a class as a reason to change, and states that a class should only 
have one reason to change. It makes sense to apply the SRP to service design as well. 

## Maintaining Data Consistency

In order to ensure loose coupling, each service has its own database. Maintaining data consistency 
between services is a challenge because 2 phase-commit/distributed transactions is not an option 
for many applications. An application must instead use the Saga pattern. A service publishes 
an event when its data changes. Other services consume that event and update their data. There 
are several ways of reliably updating data and publishing events including Event Sourcing and 
Transaction Log Tailing.

## Query data across microservices

Another challenge is implementing queries that need to retrieve data owned by multiple services.
The API Composition and Command Query Responsibility Segregation (CQRS) patterns can be used to 
tackle this problem. 

