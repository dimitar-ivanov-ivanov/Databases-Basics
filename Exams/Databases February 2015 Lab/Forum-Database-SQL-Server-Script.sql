USE [master]
GO
/****** Object:  Database [Forum]    Script Date: 25/02/2015 16:01:14 ******/
CREATE DATABASE [Forum]
GO

USE [Forum]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [ntext] NOT NULL,
	[QuestionId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[IsHidden] [bit] NULL,
 CONSTRAINT [PK_Answers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Questions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Content] [ntext] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

CREATE TABLE [dbo].[QuestionsTags](
	[TagId] [int] NOT NULL,
	[QuestionId] [int] NOT NULL
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Tags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](30) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](10) NULL,
	[RegistrationDate] [date] NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Votes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Value] [int] NOT NULL,
	[AnswerId] [int] NOT NULL,
 CONSTRAINT [PK_Votes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Answers] ON 

INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (2, N'What architecture did you run on? Did you compile with good optimization settings? I just tried your code, with and without the sort (the C++ variant) and did not find any runtime difference. Having a look at the assembler output (gcc.godbolt.org is handy for that) I could also see that there is no branch done on the if, but a cmovge is being used. When using -O2 I see a difference in speed only, but not with -O3... –  PlasmaHH', 2, 7, CAST(0x00009ED4015FBA30 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (10, N'If you have 5 to 10 minutes, I generally recommend people to read this Integration with Apache Camel by Jonathan Anstey. It''s a well written piece which gives a brief introduction to and overview of some of Camel''s concepts, and it implements a use case with code samples. In it, Jonathan writes:

"Apache Camel is an open source Java framework that focuses on making integration easier and more accessible to developers. It does this by providing:

concrete implementations of all the widely used EIPs
connectivity to a great variety of transports and APIs
easy to use Domain Specific Languages (DSLs) to wire EIPs and transports together"
There is also a free chapter of Camel in Action which introduces Camel in the first chapter. Jonathan is a co-author on that book with me.', 6, 14, CAST(0x0000A1E900FC7164 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (11, N'One of the things you need to understand, before you try to understand Apache Camel, are Enterprise Integration Patterns. Not everyone in the field is actually aware of them. While you can certainly read the Enterprise Integration Patterns book, a quicker way to get up to speed on them would be to read something like the Wikipedia article on Enterprise Application Integration.

One you have read and understood the subject area, you would be much more likely to understand the purpose of Apache Camel', 6, 13, CAST(0x0000A01D00F58DB8 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (12, N'My take to describe this in a more accessible way...

In order to understand what Apache Camel is, you need to understand what Enterprise Integration Patterns are.

Let''s start with what we presumably already know: The Singleton pattern, the Factory pattern, etc; They are merely ways of organizing your solution to the problem, but they are not solutions themselves. These patterns were analyzed and extracted for the rest of us by the Gang of Four, when they published their book: Design Patterns. They saved some of us tremendous effort in thinking of how to best structure our code.

Much like the Gang of Four, Gregor Hohpe and Bobby Woolf authored the book Enterprise Integration Patterns (EIP) in which they propose and document a set of new patterns and blueprints for how we could best design large component-based systems, where components can be running on the same process or in a different machine.

They basically propose that we structure our system to be message oriented -- where components communicate with each others using messages as inputs and outputs and absolutely nothing else. They show us a complete set of patterns that we may choose from and implement in our different components that will together form the whole system.

So what is Apache Camel?

Apache Camel offers you the interfaces for the EIPs, the base objects, commonly needed implementations, debugging tools, a configuration system, and many other helpers which will save you a ton of time when you want to implement your solution to follow the EIPs.

Take MVC. MVC is pretty simple in theory and we could implement it without any framework help. But good MVC frameworks provide us with the structure ready-to-use and have gone the extra mile and thought out all the other "side" things you need when you create a large MVC project and that''s why we use them most of the time.

That''s exactly what Apache Camel is for EIPs. It''s a complete production-ready framework for people who want to implement their solution to follow the EIPs.', 6, 11, CAST(0x00009F99017C472C AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (14, N'In short:

When there is a requirement to connect / integrate systems, you will probably need to connect to some data source and then process this data to match your business requirements.

In order to do that:

1) You could develop custom program that would do it (might be time consuming and hard to understand, maintain for other developer)

2) Alternatively, you could use Apache Camel to do it in standardised way (it has most of the connectors already developed for you, you just need to set it up and plug your logic - called Process):

Camel will help you to:

Consume data from any source/format
Process this data
Output data to any source/format
By using Apache Camel you will make it easy to understand / maintain / extend your system to another developer.

Apache Camel is developed with Enterprise Integration Patterns. The patterns help you to integrate systems in a good way :-)', 6, 8, CAST(0x00009E7C018AD940 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (15, N'Here is another attempt at it.

You know how there are/were things like Webmethods, ICAN Seebeyond, Tibco BW, IBM Broker. They all did help with integration solutions in the enterprise. These tools are commonly known by the name Enterprise Application Integration (EAI) tools.

There were mostly drag drop tools built around these technologies and in parts you would have to write adapters in Java. These adapter code were either untested or had poor tooling/automation around testing.

Just like with design patterns in programming, you have Enterprise Integration patterns for common integration solutions. They were made famous by a book of the same name by Gregor Hohpe and Bobby Woolf.

Although it is quite possible to implement integration solutions which use one or many EIP, Camel is an attempt at doing this within your code base using one of XML, Java, Groovy or Scala.

Camel supports all Enterprise Integration Patterns listed in the book via its rich DSL and routing mechanism.

So Camel is a competing technoloy to other EAI tools with better support for testing your integration code. The code is concise because of the Domain Specific Languages (DSLs). It is readable by even business users and it is free and makes you productive.', 6, 7, CAST(0x00009F9C00BBDDC0 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (16, N'There are lot of frameworks that facilitates us for messaging and solving problems in messaging. One such product is Apache Camel.

Most of the common problems have proven solutions called as design patterns. The design pattern for messaging is Enterprise Integration patterns(EIPs) which are well explained here. Apache camel help us to implement our solution using the EIPs.

The strength of an integration framework is its ability to facilitate us through EIPs or other patterns,number of transports and components and ease of development on which Apache camel stands on the top of the list

Each of the Frameworks has its own advantages Some of the special features of Apache camel are the following.

It provides the coding to be in many DSLs namely Java DSL and Spring xml based DSL , which are popular.
Easy use and simple to use.
Fuse IDE is a product that helps you to code through UI', 6, 15, CAST(0x0000A2D300C892E0 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (17, N'Camel helps in routing, transformation, monitoring.

It uses Routes; which can be described as :

When service bus receives particular message, it will route it through no of services/broker destinations such as queue/topics. This path is known as route.

Example: your stock application has got some input by analyst, it will be processed through the application/web component and then result will be published to all the interested/registered members for particular stock update.', 6, 13, CAST(0x0000A19C005936AC AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (18, N'A definition from another perspective:

Apache Camel is an integration framework. It consists of some Java libraries, which helps you implementing integration problems on the Java platform. What this means and how it differs from APIs on the one side and an Enterprise Service Bus (ESB) on the other side is described in my article "When to use Apache Camel".', 6, 12, CAST(0x0000A37F01015D28 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (19, N'Serializability of a class is enabled by the class implementing the java.io.Serializable interface. Classes that do not implement this interface will not have any of their state serialized or deserialized. All subtypes of a serializable class are themselves serializable. The serialization interface has no methods or fields and serves only to identify the semantics of being serializable.
In other words, serializable objects can be written to streams, and hence files, object databases, anything really.

Also, there is no syntactic difference between a JavaBean and another class -- a class defines a JavaBean if it follows the standards.

There is a term for it because the standard allows libraries to programmatically do things with class instances you define in a predefined way. For example, if a library wants stream any object you pass into it, it knows it can because your object is serializable (assuming the lib requires your objects be proper JavaBeans).', 7, 23, CAST(0x0000A42600DA3298 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (20, N'@worldsayshi - No, it''s not required. For example a bean can contain a String; and String is not a bean. (String is immutable, so you cannot create it by calling an empty constructor and a setter.) It seems reasonable that a Serializable object should have Serializable members, unless it somehow serializes them from outside. So no, Java bean members do not need to have any aspect of Java beans. Although it is more simple if they are beans, too.', 7, 16, CAST(0x0000A1410099F354 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (21, N'As for Serializable: That is nothing but a "marker interface" (an interface that doesn''t declare any functions) that tells Java that the implementing class consents to (and implies that it is capable of) "serialization" -- a process that converts an instance into a stream of bytes. Those bytes can be stored in files, sent over a network connection, etc, and have enough info to allow a JVM (at least, one that knows about the object''s type) to reconstruct the object later -- possibly in a different instance of the application, or even on a whole other machine!

Of course, in order to do that, the class has to abide by certain limitations. Chief among them is that all instance fields must be either primitive types (int, bool, etc), instances of some class that is also serializable, or marked as transient so that Java won''t try to include them. (This of course means that transient fields will not survive the trip over a stream. A class that has transient fields should be prepared to reinitialize them if necessary.)

A class that can not abide by those limitations should not implement Serializable (and, IIRC, the Java compiler won''t even let it do so.)', 7, 15, CAST(0x0000A3A5013447EC AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (22, N'JavaBeans are Java classes which adhere to an extremely simple coding convention. All you have to do is to

Implement java.io.Serializable interface - To save the state of an object
use a public empty argument constructor - To instantiate the object
And provide public getter and setter methods - To get and set the values of private variables (properties ).', 7, 16, CAST(0x00009E9C00128C70 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (23, N'Java Beans are using for less code and more work approach... Java Beans are used throughout Java EE as a universal contract for runtime discovery and access. For example, JavaServer Pages (JSP) uses Java Beans as data transfer objects between pages or between servlets and JSPs. Java EE''s JavaBeans Activation Framework uses Java Beans for integrating support for MIME data types into Java EE. The Java EE Management API uses JavaBeans as the foundation for the instrumentation of resources to be managed in a Java EE environment.

About Serialization:

In object serialization an object can be represented as a sequence of bytes that includes the object''s data as well as information about the object''s type and the types of data stored in the object.

After a serialized object has been written into a file, it can be read from the file and deserialized that is, the type information and bytes that represent the object and its data can be used to recreate the object in memory.', 7, 17, CAST(0x0000A0FC002511D8 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (24, N'As per the Wikipedia:

The class must have a public default constructor (with no arguments). This allows easy instantiation within editing and activation frameworks.

The class properties must be accessible using get, set, is (can be used for boolean properties instead of get), and other methods (so-called accessor methods and mutator methods) according to a standard naming convention. This allows easy automated inspection and updating of bean state within frameworks, many of which include custom editors for various types of properties. Setters can have one or more than one argument.

The class should be serializable. [This allows applications and frameworks to reliably save, store, and restore the bean''s state in a manner independent of the VM and of the platform.]

For more information follow this link.', 7, 18, CAST(0x0000A0CB00421C38 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (25, N'Properties of JavaBeans

A JavaBean is a Java object that satisfies certain programming conventions:

The JavaBean class must implement either Serializable or Externalizable

The JavaBean class must have a no-arg constructor

All JavaBean properties must have public setter and getter methods

All JavaBean instance variables should be private

Example of JavaBeans', 7, 19, CAST(0x00009F330138FC9C AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (27, N'The anonymous class you''re creating works well. However you should be aware that this is an inner class and as such, it''ll contain a reference to the surrounding class instance. So you''ll find you can''t do certain things with it (using XStream for one). You''ll get some very strange errors.

Having said that, so long as you''re aware then this approach is fine. I use it most of the time for initialising all sorts of collections in a concise fashion.

EDIT: Pointed out correctly in the comments that this is a static class. Obviously I didn''t read this closely enough. However my comments do still apply to anonymous inner classes.', 8, 21, CAST(0x00009F6E00B7F624 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (28, N'The problem with this approach is that it is not type-safe at all (and if you are using Java, you want type safety). You can put any kind of objects as keys and values. It only really works for a Map<Object, Object> (though one could use an analogous approach with an String[][] for Map<String,String> and similar for other Map<T,T>. It doesn''t work for Maps where the key-type is different from the value type.', 8, 22, CAST(0x0000A17801075EA8 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (29, N'Quick question regarding the double brace initialization: When doing this, Eclipse issues a Warning about a missing Serial ID. On one hand, I don''t see why a Serial ID would be needed in this specific case, but on the other hand, I usually don''t like supressing warnings. What are your thoughts on this?', 8, 23, CAST(0x0000A1A7012098DC AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (30, N'But that I more consider is the code readability and maintainability. In this point of view, I stand a double brace is a better code style rather then static method.

The elements are nested and inline.
It is more OO, not procedural.
the performance impact is really small and could be ignored.
Better IDE outline support (rather then many anonymous static{} block)
You saved few lines of comment to bring them relationship.
Prevent possible element leak/instance lead of uninitialized object from exception and bytecode optimizer.
No worry about the order of execution of static block.
In addition, it you aware the GC of the anonymous class, you can always convert it to a normal HashMap by using new HashMap(Map map).

You can do this until you faced another problem. If you do, you should use complete another coding style (e.g. no static, factory class) for it.', 8, 24, CAST(0x0000A02F010BBDCC AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (31, N'(A subset of) Guava used to be called Google Collections. If you aren''t using this library in your Java project yet, I strongly recommend trying it out! Guava has quickly become one of the most popular and useful free 3rd party libs for Java, as fellow SO users agree. (If you are new to it, there are some excellent learning resources behind that link.)', 8, 25, CAST(0x0000A3D9011C676C AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (32, N'I do not like Static initializer syntax and I''m not convinced to anonymous subclasses. Generally, I agree with all cons of using Static initializers and all cons of using anonymous subclasses that were mentioned in previus answers. On the other hand - pros presented in these posts are not enough for me. I prefer to use static initialization method:', 8, 26, CAST(0x0000A27300F8EFBC AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (33, N'I like using the static initializer "technique" when I have a concrete realization of an abstract class that has defined an initializing constructor but no default constructor but I want my subclass to have a default constructor.', 8, 27, CAST(0x0000A15E000E3A30 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (34, N'I like the anonymous class syntax; it''s just less code. However, one major con I have found is that you won''t be able to serialize that object via remoting. You will get an exception about not being able to find the anonymous class on the remote side.', 8, 16, CAST(0x00009F9F01663590 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (35, N'According to the language specification, the language itself must consider string to be exactly the same as the BCL type System.String, nothing else. That is not ambiguous at all. Of course, you can implement your own compiler, using the C# grammar, and use all of the tokens found like that for something arbitrary, unrelated to what is defined in the C# language specification. However, the resulting language would only be a C# lookalike, it could not be considered C#', 11, 18, CAST(0x00009FE1007D9D6C AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (36, N'System.String is THE .net string class - in C# string is an alias for System.String - so in use they are the same.

As for guidelines I wouldn''t get too bogged down and just use whichever you feel like - there are more important things in life and the code is going to be the same anyway.

If you find yourselves building systems where it is necessary to specify the size of the integers you are using and so tend to use Int16, Int32, UInt16, UInt32 etc. then it might look more natural to use String - and when moving around between different .net languages it might make things more understandable - otherwise I would use string and int.', 11, 11, CAST(0x0000A23301533E7C AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (38, N'Lower case string is an alias for System.String. They are the same in C#.

There''s a debate over whether you should use the System types (System.Int32, System.String, etc.) types or the C# aliases (int, string, etc). I personally believe you should use the C# aliases, but that''s just my personal preference.', 11, 8, CAST(0x0000A37700820E24 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (39, N'I''ve seen a number of developers confused, not knowing whether to use string or String in their code. Because in C# the string (a keyword) maps exactly to System.String (an FCL type), there is no difference and either can be used.
In C#, long maps to System.Int64, but in a different programming language, long could map to an Int16 or Int32. In fact, C++/CLI does in fact treat long as an Int32. Someone reading source code in one language could easily misinterpret the code''s intention if he or she were used to programming in a different programming language. In fact, most languages won''t even treat long as a keyword and won''t compile code that uses it.
The FCL has many methods that have type names as part of their method names. For example, the BinaryReader type offers methods such as ReadBoolean, ReadInt32, ReadSingle, and so on, and the System.Convert type offers methods such as ToBoolean, ToInt32, ToSingle, and so on. Although it''s legal to write the following code, the line with float feels very unnatural to me, and it''s not obvious that the line is correct:', 11, 7, CAST(0x0000A212018B78A0 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (45, N'It''s a matter of convention, really. "string" just looks more like C/C++ style. The general convention is to use whatever shortcuts your chosen language has provided (int/Int for Int32). This goes for "object" and "decimal" as well.

Theoretically this could help to port code into some future 64-bit standard in which "int" might mean Int64, but that''s not the point, and I would expect any upgrade wizard to change any "int" references to "Int32" anyway just to be safe.', 11, 1, CAST(0x0000A2B3007461C0 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (46, N'String stands for System.String and it is a .NET Framework type. string is an alias in the C# language for  System.String. Both of them are compiled to System.String in IL (Intermediate Language), so there is no difference. Choose what you like and use that. If you code in C#, I''d prefer string as it''s a C# type alias and well-known by C# programmers.', 5, 23, CAST(0x0000A2C70085BC54 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (47, N'Both are same. But from coding guidelines perspective it''s better to use string instead of String. This is what generally developers use. e.g. instead of using Int32 we use int as int is alias to Int32 FYI “The keyword string is simply an alias for the predefined class System.String.” - C# Language Specification 4.2.3 http://msdn2.microsoft.com/En-US/library/aa691153.aspx', 11, 24, CAST(0x00009E92009ECC58 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (48, N'Finally, when it comes to which to use: personally I use the aliases everywhere for the implementation, but the CLR type for any APIs. It really doesn''t matter too much which you use in terms of implementation - consistency among your team is nice, but no-one else is going to care. On the other hand, it''s genuinely important that if you refer to a type in an API, you do so in a language neutral way. A method called ReadInt32 is unambiguous, whereas a method called ReadInt requires interpretation. The caller could be using a language which defines an int alias for Int16, for example. The .NET framework designers have followed this pattern, good examples being in the BitConverter, BinaryReader and Convert classes.', 11, 25, CAST(0x00009F6000114450 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (49, N'Another even-later-to-the-party thought: If you use the BCL type name (String), the compiler has to resolve it in the context of your using statements, to see whether you indeed meant System.String or perhaps AdvancedPhysics.String or RememberToBuyButter.TieAroundFinger.String. Lower-case string, on the other hand, is a keyword, and can only ever refer to System.String. Presumably this affects the compilation time, though I doubt the difference is observable.', 11, 17, CAST(0x00009EBC00AC6980 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (50, N'According to ECMA-334, section 9.4.3, "string" is a keyword. :-) I agree with you that "string" is a type if you focus on the semantics, but I''d say it''s a keyword (i.e. a reserved word) if you focus on the syntax. The standard backs both points of view (perhaps too ambiguously!). To me, the OP is about syntax, so I tend to focus on syntax when I look at answers, but I see your point too. Furthermore, your answer, as it stands, may be interpreted as to mean that two different types exist: string and String, when that is not the case. One is a maping to the other. ', 11, 16, CAST(0x0000A032014F42F4 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (51, N'The C# language specification states, “As a matter of style, use of the keyword is favored over use of the complete system type name.” I disagree with the language specification; I prefer to use the FCL type names and completely avoid the primitive type names. In fact, I wish that compilers didn’t even offer the primitive type names and forced developers to use the FCL type names instead. Here are my reasons:', 11, 19, CAST(0x0000A1B801092A08 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (52, N'Coming late to the party: I use the CLR types 100% of the time (well, except if forced to use the C# type, but I don''t remember when the last time that was).

I originally started doing this years ago, as per the CLR books by Ritchie. It made sense to me that all CLR languages ultimately have to be able to support the set of CLR types, so using the CLR types yourself provided clearer, and possibly more "reusable" code.

Now that I''ve been doing it for years, it''s a habit and I like the coloration that VS shows for the CLR types.

The only real downer is that auto-complete uses the C# type, so I end up re-typing automatically generated types to specify the CLR type instead.

Also, now, when I see "int" or "string", it just looks really wrong to me, like I''m looking at 1970''s C code.', 11, 24, CAST(0x00009F1E015DA2A4 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (53, N'@Anthony: Yes. The compiler team refers to this as hoisting rather than lifting, since "lifting" already has a meaning for nullable arithmetic. But stop thinking about the stack altogether. The stack is an implementation detail subject to change. The compiler uses the stack -- or registers -- when doing so is convenient and correct. In this case it is neither, so the stack isn''t used.', 12, 22, CAST(0x0000A17B00EF9A48 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (54, N'Is there something you can do with foreach loops this way that you couldn''t if they were compiled with an inner-scoped variable? or is this just an arbitrary choice that was made before anonymous methods and lambda expressions were available or common, and which hasn''t been revised since then?', 12, 23, CAST(0x0000A0B000994CEC AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (55, N'The latter. The C# 1.0 specification actually did not say whether the loop variable was inside or outside the loop body, as it made no observable difference. When closure semantics were introduced in C# 2.0, the choice was made to put the loop variable outside the loop, consistent with the "for" loop.

I think it is fair to say that all regret that decision. This is one of the worst "gotchas" in C#, and we are going to take the breaking change to fix it. In C# 5 the foreach loop variable will be logically inside the body of the loop, and therefore closures will get a fresh copy every time.

The for loop will not be changed, and the change will not be "back ported" to previous versions of C#. You should therefore continue to be careful when using this idiom.', 12, 15, CAST(0x0000A05801194000 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (56, N'We did in fact push back on this change in C# 3 and C# 4. When we designed C# 3 we did realize that the problem (which already existed in C# 2) was going to get worse because there would be so many lambdas (and query comprehensions, which are lambdas in disguise) in foreach loops thanks to LINQ. I regret that we waited for the problem to get sufficiently bad to warrant fixing it so late, rather than fixing it in C# 3.', 12, 13, CAST(0x00009E6E0023B374 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (57, N'@Benjol: No, which is why we''re willing to take it. Jon Skeet pointed out to me an important breaking change scenario though, which is that someone writes code in C# 5, tests it, and then shares it with people who are still using C# 4, who then naively believe it to be correct. Hopefully the number of people affected by such a scenario is small.', 12, 11, CAST(0x0000A3F6006C7410 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (60, N'this is a case where the forced consistency is more harmful than being inconsistent. It should "just work" as people expect, and clearly people expect something different when using foreach as opposed to a for loop, given the number of people that have hit problems before we knew about the access to modified closure issue (such as myself).', 12, 16, CAST(0x0000A01E012F3C84 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (61, N'If v was declared outside of the while loop, it would be shared among all iterations, and its value after the for loop would be the final value, 13, which is what the invocation of f would print. Instead, because each iteration has its own variable v, the one captured by f in the first iteration will continue to hold the value  7, which is what will be printed. (Note: earlier versions of C# declared v outside of the while loop.)', 12, 29, CAST(0x0000A3A300817F2C AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (62, N'Be sure to read Eric''s answer: The C# 1.0 specification (in your link we are talking about VS 2003, i.e. C# 1.2) actually did not say whether the loop variable was inside or outside the loop body, as it make no observable difference. When closure semantics were introduced in C# 2.0, the choice was made to put the loop variable outside the loop, consistent with the "for" loop. ', 12, 28, CAST(0x0000A21C0106F530 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (63, N'They were definitive specifications. The problem is that we are talking about a feature (i.e. function closures) that was introduced later (with C# 2.0). When C# 2.0 came up they decided to put the loop variable outside the loop. And than they changed their mind again with C# 5.0 :)', 12, 27, CAST(0x0000A29800118140 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (64, N'That is the typical workaround Thanks for the contribution. Resharper is smart enough to recognize this pattern and bring it to your attention too, which is nice. I haven''t been bit by this pattern in a while, but since it is, in Eric Lippert''s words, "the single most common incorrect bug report we get," I was curious to know the why more than the how to avoid it.', 12, 26, CAST(0x0000A08200B18FDC AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (65, N'this does not work very well in a medium to large development team where some level of code consistency is required. And as noted previously, if you don''t understand the different layouts you may find edge cases that don''t work as you expect.', 13, 22, CAST(0x0000A0D300259E78 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (66, N'It''s also interesting to note what happens if Foo is in namespace Outer, rather than Outer.Inner. In that case, adding Outer.Math in File2 breaks File1 regardless of where the using goes. This implies that the compiler searches the innermost enclosing namespace before it looks at any using statements.', 13, 23, CAST(0x0000A00B01309C14 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (67, N'Now the compiler searches System before searching Outer, finds System.Math, and all is well.

Some would argue that Math might be a bad name for a user-defined class, since there''s already one in System; the point here is just that there is a difference, and it affects the maintainability of your code.', 13, 31, CAST(0x0000A19B01372200 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (68, N'Great answer, but it seems to me that I''d only want to put non-framework using statements locally, and keep the framework using statements global. Anyone have further explanation why I should completely changed my preference? Also where did this come from, the templates in VS2008 put using outside the namespace?', 13, 32, CAST(0x00009FE500B65878 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (69, N'This is imho a much better reason to put using statements locally than Mark''s multiple-namespaces-in-one-file argument. Especially sine the compile can and will complain about the naming clash (see the StyleCop documentation for this rule (e.g. as posted by Jared)).', 13, 33, CAST(0x00009F8E006B8884 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (70, N'Putting it inside the namespaces makes the declarations local to that namespace for the file (in case you have multiple namespaces in the file) but if you only have one namespace per file then it doesn''t make a difference whether they go outside or inside the namespace.', 13, 34, CAST(0x0000A3E20124EC48 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (71, N'Aye I didn''t fully read the thread but bought in when the MVPs said it was right. A guy disproves it, explains it and shows his code further down... "The IL that the C# compiler generates is the same in either case. In fact the C# compiler generates precisely nothing corresponding to each using directive. Using directives are purely a C#ism, and they have no meaning to .NET itself. (Not true for using statements but those are something quite different.)', 13, 35, CAST(0x0000A17B0059B9EC AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (72, N'The code creates an alias to the System.Guid type called Guid, and also creates its own type called Guid with a matching constructor interface. Later, the code creates an instance of the type Guid. To create this instance, the compiler must choose between the two different definitions of Guid. When the using-alias directive is placed outside of the namespace element, the compiler will choose the local definition of Guid defined within the local namespace, and completely ignore the using-alias directive defined outside of the namespace. This, unfortunately, is not obvious when reading the code.', 13, 36, CAST(0x0000A14F005C17C8 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (73, N'When the using-alias directive is positioned within the namespace, however, the compiler has to choose between two different, conflicting Guid types both defined within the same namespace. Both of these types provide a matching constructor. The compiler is unable to make a decision, so it flags the compiler error.', 13, 34, CAST(0x00009E9400BD4458 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (74, N'Placing the using-alias directive outside of the namespace is a bad practice because it can lead to confusion in situations such as this, where it is not obvious which version of the type is actually being used. This can potentially lead to a bug which might be difficult to diagnose.', 13, 37, CAST(0x0000A0AA01137EF4 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (75, N'Placing multiple namespace elements within a single file is generally a bad idea, but if and when this is done, it is a good idea to place all using directives within each of the namespace elements, rather than globally at the top of the file. This will scope the namespaces tightly, and will also help to avoid the kind of behavior described above.', 13, 38, CAST(0x00009EE900EE3608 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (76, N'It is important to note that when code has been written with using directives placed outside of the namespace, care should be taken when moving these directives within the namespace, to ensure that this is not changing the semantics of the code. As explained above, placing using-alias directives within the namespace element allows the compiler to choose between conflicting types in ways that will not happen when the directives are placed outside of the namespace.', 13, 39, CAST(0x00009EDB011ADA28 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (78, N'The rule for resolving which type is implied, can be loosely stated like this: First search the inner-most "scope" for a match, if nothing is found there go out one level to the next scope and search there, and so on, until a match is found. If at some level more than one match is found, if one of the types are from the current assembly, pick that one and issue a compiler warning. Otherwise, give up (compile-time error).', 13, 35, CAST(0x0000A09200E44F44 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (79, N'In the above case, to find out what type Ambiguous is, the search goes in this order:

Nested types inside C (including inherited nested types)
Types in the current namespace MyCorp.TheProduct.SomeModule.Utilities
Types in namespace MyCorp.TheProduct.SomeModule
Types in MyCorp.TheProduct
Types in MyCorp
Types in the null namespace (the global namespace)
Types in System, System.Collections.Generic, System.Linq, MyCorp.TheProduct.OtherModule, MyCorp.TheProduct.OtherModule.Integration, and ThirdParty', 13, 33, CAST(0x0000A06E00E682F0 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (80, N'No matter if you put the usings inside or outside the namespace declaration, there''s always the possibility that someone later adds a new type with identical name to one of the namespaces which have higher priority.', 13, 35, CAST(0x00009F1E00C89C40 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (81, N'Also, if a nested namespace has the same name as a type, it can cause problems.

It is always dangerous to move the usings from one location to another because the search hierarchy changes, and another type may be found. Therefore, choose one convention and stick to it, so that you won''t have to ever move usings.', 13, 29, CAST(0x0000A3320091896C AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (82, N'Visual Studio''s templates, by default, put the usings outside of the namespace (for example if you make VS generate a new class in a new file).

One (tiny) advantage of having usings outside is that you can then utilize the using directives for a global attribute, for example [assembly: ComVisible(false)] instead of [assembly: System.Runtime.InteropServices.ComVisible(false)].', 13, 27, CAST(0x00009F16007BA0D4 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (83, N'It is a better practice if those default using i.e. "references" used in your source solution should be outside the namespaces and those that are "new added reference" is a good practice is you should put it inside the namespace. This is to distinguish what references are being added.', 13, 25, CAST(0x0000A3F2003B6514 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (84, N'No, actually that is a bad idea. You should not base the location between locally scoped and globally scoped of using directives on the fact that they are newly added or not. Instead, it is good practice to alphabetize them, except for BCL references, which should go on top. ', 13, 21, CAST(0x0000A03F0088ADD8 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (85, N'Interesting link; nice to see someone else noticed that a good framework should distinguish pointers which are used incorporate an object''s identity from those which incorporate state. Personally, I think what''s needed is a means of having a variety of storage location types associated with each heap object type (sharable reference to X, exclusively-held reference to X, ephemeral reference to X, etc.). If such types were usable as generic parameters (e.g. List<ExclusiveRef<X>>), I think 99% of cloning situations could be taken care of automatically.', 14, 19, CAST(0x0000A3470087DE6C AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (86, N'Whilst the standard practice is to implement the ICloneable interface (described here, so I won''t regurgitate), here''s a nice deep clone object copier I found on The Code Project a while ago and incorporated it in our stuff.', 14, 18, CAST(0x0000A2B200FB8128 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (87, N'The idea is that it serializes your object and then deserializes it into a fresh object. The benefit is that you don''t have to concern yourself about cloning everything when an object gets too complex.

And with the use of extension methods (also from the originally referenced source):

In case you prefer to use the new extension methods of C# 3.0, change the method to have the following signature:

public static T Clone<T>(this T source)
{
   //...
}', 14, 17, CAST(0x0000A38C01541E50 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (88, N'David, granted, but if the objects are light, and the performance hit when using it is not too high for your requirements, then it is a useful tip. I haven''t used it intensively with large amounts of data in a loop, I admit, but I have never seen a single performance concern.', 14, 16, CAST(0x0000A00A006FFA68 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (89, N'In general, you implement the ICloneable interface and implement Clone yourself. C# objects have a built-in MemberwiseClone method that performs a shallow copy that can help you out for all the primitives.

For a deep copy, there is no way it can know how to automatically do it.', 14, 15, CAST(0x0000A20100F615A8 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (90, N'Basically you need to implement IClonable interface and then realize object structure copying.
If it''s deep copy of all members, you need to insure (not relating on solution you choose) that all children are clonable as well.
Sometimes you need to be aware of some restriction during this process, for example if you copying the ORM objects most of frameworks allow only one object attached to the session and you MUST NOT make clones of this object, or if it''s possible you need to care about session attaching of these objects.', 14, 14, CAST(0x0000A30700CB5DB8 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (91, N'The short answer is you inherit from the ICloneable interface and then implement the .clone function. Clone should do a memberwise copy and perform a deep copy on any member that requires it, then return the resulting object. This is a recursive operation ( it requires that all members of the class you want to clone are either value types or implement ICloneable and that their members are either value types or implement ICloneable, and so on).', 14, 13, CAST(0x00009F7D0179A0A8 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (92, N'The long answer is "it depends". As mentioned by others, ICloneable is not supported by generics, requires special considerations for circular class references, and is actually viewed by some as a "mistake" in the .NET Framework. The serialization method depends on your objects being serializable, which they may not be and you may have no control over. There is still much debate in the community over which is the "best" practice. In reality, none of the solutions are the one-size fits all best practice for all situations like ICloneable was originally interpreted to be.', 14, 12, CAST(0x0000A19700FCE568 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (93, N'Yes, MemberwiseClone makes a shallow copy, but the opposite of MemberwiseClone isn''t Clone; it would be, perhaps, DeepClone, which doesn''t exist. When you use an object through its ICloneable interface, you can''t know which kind of cloning the underlying object performs. (And XML comments won''t make it clear, because you''ll get the interface comments rather than the ones on the object''s Clone method.)', 14, 11, CAST(0x0000A082014BFD10 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (94, N'I''m not clear why ICloneable is considered vague. Given a type like Dictionary(Of T,U), I would expect that ICloneable.Clone should do whatever level of deep and shallow copying is necessary to make the new dictionary be an independent dictionary that contains the same T''s and U''s (struct contents, and/or object references) as the original. Where''s the ambiguity? To be sure, a generic ICloneable(Of T), which inherited ISelf(Of T), which included a "Self" method, would be much better, but I don''t see ambiguity on deep vs shallow cloning.', 14, 10, CAST(0x0000A2180178ACE8 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (96, N'Your example illustrates the problem. Suppose you have a Dictionary<string, Customer>. Should the cloned Dictionary have the same Customer objects as the original, or copies of those Customer objects? There are reasonable use cases for either one. But ICloneable doesn''t make clear which one you''ll get. That''s why it''s not useful.', 14, 8, CAST(0x0000A31901242510 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (97, N'I''ve seen it implemented through reflection as well. Basically there was a method that would iterate through the members of an object and appropriately copy them to the new object. When it reached reference types or collections I think it did a recursive call on itself. Reflection is expensive, but it worked pretty well.', 14, 7, CAST(0x0000A38A013F7B80 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (103, N'If the two objects are of the same type, it would make more sense to make this a generic method with a single type parameter to enforce that. If they are not the same type, you''ll have to handle the possibility that properties with the same name might have incompatible types. For example, S might have a property called "ID" of type int, while T''s ID property might be a Guid.', 14, 1, CAST(0x0000A1510075E6D0 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (105, N'i think about using this method but with recursion. so if the value of a property is a reference, create a new object and call CopyTo again. i just see one problem, that all used classes must have a constructor without parameters. Anybody tried this already? i also wonder if this will actually work with properties containing .net classes like DataRow and DataTable?', 14, 21, CAST(0x0000A3A80078C210 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (106, N'Define an ISelf<T> with a read-only Self property that returns T, and ICloneable<out T>, which derives from ISelf<T> and includes a method T Clone().
Then define a CloneBase type which implements a protected virtual generic VirtualClone casting MemberwiseClone to the passed-in type.
Each derived type should implement VirtualClone by calling the base clone method and then doing whatever needs to be done to properly clone those aspects of the derived type which the parent VirtualClone method hasn''t yet handled.', 14, 22, CAST(0x00009FBE012DA004 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (107, N'For maximum inheritance versatility, classes exposing public cloning functionality should be sealed, but derive from a base class which is otherwise identical except for the lack of cloning. Rather than passing variables of the explicit clonable type, take a parameter of type ICloneable<theNonCloneableType>. This will allow a routine that expects a cloneable derivative of Foo to work with a cloneable derivative of DerivedFoo, but also allow the creation of non-cloneable derivatives of Foo.', 14, 23, CAST(0x0000A1C900DCF410 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (108, N'After much much reading about many of the options linked here, and possible solutions for this issue, I believe all the options are summarized pretty well at Ian P''s link (all other options are variations of those) and the best solution is provided by Pedro77''s link on the question comments.

So I''ll just copy relevant parts of those 2 references here. ', 14, 24, CAST(0x00009ED500545574 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (109, N'The best thing to do for cloning objects in c sharp!

First and foremost, those are all our options:

Manually with ICloneable, which is Shallow and not Type-Safe
MemberwiseClone, which uses ICloneable
Reflection by using Activator.CreateInstance
Serialization, as pointed by johnc''s preferred answer
Intermediate Language, which I got no idea how works
Extension Methods, such as this custom clone framework by Havard Straden', 14, 25, CAST(0x0000A12B01498A1C AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (110, N'All his article circles around an example that tries to be applicable for most cases, using 3 objects: Person, Brain and City. We want to clone a person, which will have its own brain but the same city. You can either picture all problems any of the other methods above can bring or read the article.', 14, 26, CAST(0x0000A197001A32A4 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (111, N'Copying an object by specifying New followed by the class name often leads to code that is not extensible. Using clone, the application of prototype pattern, is a better way to achieve this. However, using clone as it is provided in C# (and Java) can be quite problematic as well. It is better to provide a protected (non-public) copy constructor and invoke that from the clone method. This gives us the ability to delegate the task of creating an object to an instance of a class itself, thus providing extensibility and also, safely creating the objects using the protected copy constructor.', 14, 27, CAST(0x00009EF900269490 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (112, N'MS recommends not using ICloneable for public members. "Because callers of Clone cannot depend on the method performing a predictable cloning operation, we recommend that ICloneable not be implemented in public APIs." msdn.microsoft.com/en-us/library/… However, based on the explanation given by Venkat Subramaniam in your linked article, I think it makes sense to use in this situation as long as the creators of the ICloneable objects have a deep understanding of which properties should be deep vs. shallow copies (i.e. deep copy Brain, shallow copy City) ', 14, 28, CAST(0x0000A22E00643EE4 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (113, N'First off, I''m far from an expert in this topic (public APIs). I think for once that MS remark makes a lot of sense. And I don''t think it''s safe to assume the users of that API will have such a deep understanding. So, it only makes sense implementing it on a public API if it really won''t matter for whoever is going to use it. I guess having some kind of UML very explicitly making the distinction on each property could help. But I''d like to hear from someone with more experience. :P', 14, 29, CAST(0x0000A1B600FD0638 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (114, N'I wanted a cloner for very simple objects of mostly primitives and lists. If your object is out of the box JSON serializable then this method will do the trick. This requires no modification or implementation of interfaces on the cloned class, just a JSON serializer like JSON.NET.', 5, 30, CAST(0x00009FFC0091FD70 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (115, N'I''ve just created CloneExtensions library project. It performs fast, deep clone using simple assignment operations generated by Expression Tree runtime code compilation.

How to use it?

Instead of writing your own Clone or Copy methods with a tone of assignments between fields and properties make the program do it for yourself, using Expression Tree. GetClone<T>() method marked as extension method allows you to simply call it on your instance:', 14, 31, CAST(0x00009F6B01812BE8 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (116, N'What can be cloned?

Primitive (int, uint, byte, double, char, etc.), known immutable types (DateTime, TimeSpan, String) and delegates (including Action, Func, etc)
Nullable
T[] arrays
Custom classes and structs, including generic classes and structs.
Following class/struct members are cloned internally:

Values of public, not readonly fields
Values of public properties with both get and set accessors
Collection items for types implementing ICollection', 14, 32, CAST(0x00009E93006F6C9C AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (117, N'How fast it is?

The solution is faster then reflection, because members information has to be gathered only once, before GetClone<T> is used for the first time for given type T.

It''s also faster than serialization-based solution when you clone more then couple instances of the same type T.', 14, 33, CAST(0x0000A0FD01604220 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (118, N'I have created a version of the accepted answer that works with both ''[Serializable]'' and ''[DataContract]''. It has been a while since I wrote it, but if I remember correctly [DataContract] needed a different serializer.

Requires System, System.IO, System.Runtime.Serialization, System.Runtime.Serialization.Formatters.Binary, System.Xml;', 14, 34, CAST(0x0000A0F701262658 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (119, N'Bepenfriends- Since System.Guid does not throw AggregateException, it would be great if you (or someone) could post an answer showing how you would wrap it into an AggregateException etc.', 15, 35, CAST(0x0000A40F00E1A53C AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (120, N'If Microsoft introduced, say, StringTooLongException derived from FormatException then it is still a format exception, just a specific one. It depends whether you want the semantics of ''catch this exact exception type'' or ''catch exceptions that mean the format of the string was wrong''.', 15, 36, CAST(0x0000A24801756704 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (121, N'This code is extremely fragile - a library developer could expect to replace throw new FormatException(); with throw new NewlyDerivedFromFormatException(); without breaking code using the library, and it will hold true for all exception handling cases except where someone used == instead of is (or simply catch (FormatException))', 15, 37, CAST(0x0000A335012F59D0 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (122, N'Thank you for that link! I just learned one more important reason not to re-throw: throw e; destroys stacktrace and callstack, throw; destroys "only" callstack (rendering crash-dumps useless!) A very good reason to use neither if it can be avoided! ', 15, 38, CAST(0x0000A135014A666C AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (123, N'The accepted answer seems acceptable, except that CodeAnalysis/FxCop will complain about the fact that it''s catching a general exception type.

Also, it seems the "is" operator might degrade performance slightly. http://msdn.microsoft.com/en-us/library/ms182271.aspx says to "consider testing the result of the ''as'' operator instead", but if you do that, you''ll be writing more code than if you catch each exception separately.', 15, 39, CAST(0x0000A2EB0005DE58 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (128, N'This pattern can be improved by storing the exception(please excuse the poor formatting -- I can''t figure out how to put code in comments): Exception ex = null; try { // something } catch( FormatException e){ ex = e; } catch( OverflowException e){ ex = e; } if( ex != null ) { // something else and deal with ex }', 15, 1, CAST(0x0000A2730178449C AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (130, N'Abandoning all the perfectly sane and useful Exception .net provides (ArgumentException, InvalidOperationException etc.) for the sake of being able to catch "MyApplicationBaseException" seems to offer a bad cost/benefit relation. Also, it won''t help me if I want to catch exceptions thrown by string.Format and other Framework methods.', 15, 8, CAST(0x0000A0B60114543C AS DateTime), 0)
GO
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (132, N'+1 on your comment above. But aren''t you looking to abandon all the perfectly sane and useful exception handling syntax provided to elegantly catch multiple exceptions? That you want to execute an identical body of code as a result of differing conditions is pretty much the use-case for a method call. But we don''t try to group-together (in potentially obscure if/then blocks) all the other pre-cursors to a particular method call in other parts of our program, so should we do it here? Not arguin'', just philosophisin'' (in fact I came here as I had the same question as you)! ;-)', 15, 7, CAST(0x0000A18400D6671C AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (133, N'The .net exception hierarchy may be sane and useful from the standpoint of a human identifying things, but it seems pretty useless from the standpoint of deciding how far the stack needs to be unwound when a problem occurs. For example, if a user selects "Open..." and picks a file that can''t be parsed, how should the outer application layer identify which exceptions should simply say "File cannot be opened", and which ones indicate the application as a whole is corrupt and needs to shut down?', 15, 10, CAST(0x0000A269016253D0 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (134, N'Precisely--concise, and you totally bypass the performance penalty of handling the exception, the bad form of intentionally using exceptions to control program flow, and the soft focus of having your conversion logic spread around, a little bit here and a little bit there.', 15, 11, CAST(0x0000A0C800893244 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (135, N'I know what you meant, but of course Guid.TryParse never returns Guid.Empty. If the string is in an incorrect format, it sets the result output parameter to Guid.Empty, but it returns false. I''m mentioning it because I''ve seen code that does things in the style of Guid.TryParse(s, out guid); if (guid == Guid.Empty) { /* handle invalid s */ }, which is usually wrong if s could be the string representation of Guid.Empty', 5, 12, CAST(0x00009FEF00C7266C AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (136, N'One possible advantage of this approach is that there''s a semantic difference between catching and rethrowing an exception versus not catching it; in some cases, code should act upon an exception without catching it. Such a thing is possible in vb.net, but not in C# unless one uses a wrapper written in vb.net and called from C#.', 15, 13, CAST(0x0000A22D006CF750 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (137, N'Cutting straight to the chase, this kind of duplicates an earlier answer, but if you really want to perform a common action for several exception types and keep the whole thing neat and tidy within the scope of the one method, why not just use a lambda/closure/inline function do something like the following? I mean, chances are pretty good that you''ll end up realizing that you just want to make that closure a separate method that you can utilize all over the place. But then it will be super easy to do that without actually changing the rest of the code structurally. Right?', 15, 14, CAST(0x0000A0D0004CDF4C AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (138, N'Because it certainly isn''t automatically more readable.

Granted, I left the three identical instances of /* write to a log, whatever... */ return; out of the first example.

But that''s sort of my point. Y''all have heard of functions/methods, right? Seriously. Write a common ErrorHandler function and, like, call it from each catch block.', 15, 15, CAST(0x0000A2C20136CDA0 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (139, N'If you ask me, the second example (with the if and is keywords) is both significantly less readable, and simultaneously significantly more error-prone during the maintenance phase of your project.', 15, 16, CAST(0x0000A42D00098904 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (140, N'The maintenance phase, for anyone who might be relatively new to programming, is going to comprise 98.7% or more of the overall lifetime of your project, and the poor schmuck doing the maintenance is almost certainly going to be someone other than you. And there is a very good chance they will spend 50% of their time on the job cursing your name.', 15, 17, CAST(0x00009F2A009B9B8C AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (141, N'And of course FxCop barks at you and so you have to also add an attribute to your code that has precisely zip to do with the running program, and is only there to tell FxCop to ignore an issue that in 99.9% of cases it is totally correct in flagging. And, sorry, I might be mistaken, but doesn''t that "ignore" attribute end up actually compiled into your app?', 15, 18, CAST(0x0000A0C4017CCF1C AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (142, N'Would putting the entire if test on one line make it more readable? I don''t think so. I mean, I did have another programmer vehemently argue once long ago that putting more code on one line would make it "run faster." But of course he was stark raving nuts. Trying to explain to him (with a straight face--which was challenging) how the interpreter or compiler would break that long line apart into discrete one-instruction-per-line statements--essentially identical to the result if he had gone ahead and just made the code readable instead of trying to out-clever the compiler--had no effect on him whatsoever. But I digress.', 15, 19, CAST(0x0000A1DA009C0F90 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (144, N'How much less readable does this get when you add three more exception types, a month or two from now? (Answer: it gets a lot less readable).

One of the major points, really, is that most of the point of formatting the textual source code that we''re all looking at every day is to make it really, really obvious to other human beings what is actually happening when the code runs. Because the compiler turns the source code into something totally different and couldn''t care less about your code formatting style. So all-on-one-line totally sucks, too.', 15, 21, CAST(0x00009FA8005B6F08 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (145, N'When I first stumbled across this question I was all over the accepted answer. Cool I can just catch all Exceptions and the check the type. I thought it cleaned up the code, but something kept me coming back to the question and I actually read the other answers to the question. I chewed on it for a while, but I have to agree with you. It is more readable and maintainable to use a function to dry up your code than to catch everything, check the type comparing against a list, wrapping code, and throwing. Thanks for coming late and providing an alternative and sane (IMO) option. +1.', 15, 22, CAST(0x0000A1D30151A7D8 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (146, N'SQLite doesn''t support any kind of ''attach'' trigger that I''m aware of, only delete, insert, and update.

What you want to do is probably best done by your program, not inside SQLite itself. You should be able to manually drop and re-create the view (necessary since views can''t be modified) in your own code anytime you do an attach. Of course this would require a lock (making the table unusable as you said), but that would probably be necessary even if SQLite was doing the work for you.

Either way, the view creation is extremely fast, so it shouldn''t affect your program''s performance.', 16, 23, CAST(0x00009EB701329B04 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (147, N'The word "subjective" in that context is referring to questions that are entirely a matter of opinion. "What do you think of Joe Celko''s book?" - that''s a subjective question. This question is soliciting objective information, it just so happens that there is no single "right" answer. I think it''s important to take a step back and ask, "is this just idle banter, or is it useful for some developers?" My two cents anyway - it''s not like I''m earning rep points for this. :-)', 17, 24, CAST(0x00009F3101423014 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (148, N'Personally, I hate these questions. They almost always amount to piles of personal opinions, light on usable information and heavy on subjective declarations. But I''m not willing to close it for that reason alone; it could be half-way decent, Aaron, if you set some guidelines for responses: single-topic answers (what should you know and why should you know it), no duplicates, up-vote what you agree with... and most importantly, move your own opinions into answers that demonstrate this. As it stands, this reads like a blog post, or forum discussion, neither of which have any business on SO.', 17, 25, CAST(0x0000A2EE00B6448C AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (149, N'I find this rather interesting: "It''s a Community Wiki and therefore appropriate." How on earth can a CW make it appropriate? Either a question is appropriate or not, and I think this question is way to subjective to be helpful if someone is looking for an answer. It might be interesting, but that''s not the only characteristic a question must have.', 17, 26, CAST(0x00009EA7007445A0 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (150, N'I will vote to reopen if it gets closed... I would also like to see a list of those things that DBAs should (but do not) know about OOP and application/Systems Software design..', 17, 27, CAST(0x0000A06400D38150 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (151, N'Every developer should know that this is false: "Profiling a database operation is completely different from profiling code."', 17, 28, CAST(0x0000A1C8010E2184 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (152, N'There is a clear Big-O in the traditional sense. When you do an EXPLAIN PLAN (or the equivalent) you''re seeing the algorithm. Some algorithms involve nested loops and are O( n ^ 2 ). Other algorithms involve B-tree lookups and are O( n log n ).', 17, 29, CAST(0x0000A3570014D084 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (153, N'This is very, very serious. It''s central to understanding why indexes matter. It''s central to understanding the speed-normalization-denormalization tradeoffs. It''s central to understanding why a data warehouse uses a star-schema which is not normalized for transactional updates.', 17, 30, CAST(0x0000A25A00D12374 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (154, N'Also, the corollary: More Indexes are Not Better.

Sometimes an index focused on one operation will slow other operations down. Depending on the ratio of the two operations, adding an index may have good effects, no overall impact, or be detrimental to overall performance.', 5, 31, CAST(0x00009FEE01165A34 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (155, N'Good question. The following are some thoughts in no particular order:

Normalization, to at least the second normal form, is essential.

Referential integrity is also essential, with proper cascading delete and update considerations.

Good and proper use of check constraints. Let the database do as much work as possible.

Don''t scatter business logic in both the database and middle tier code. Pick one or the other, preferably in middle tier code.

Decide on a consistent approach for primary keys and clustered keys.

Don''t over index. Choose your indexes wisely.

Consistent table and column naming. Pick a standard and stick to it.

Limit the number of columns in the database that will accept null values.

Don''t get carried away with triggers. They have their use but can complicate things in a hurry.

Be careful with UDFs. They are great but can cause performance problems when you''re not aware how often they might get called in a query.

Get Celko''s book on database design. The man is arrogant but knows his stuff.', 17, 32, CAST(0x0000A1140069828C AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (156, N'I''ve always preferred to put it in both places. That way you''re protected against bugs as well as user error. There''s no reason to make every column nullable, or to allow values outside the range 1-12 to be inserted into a Month column. Complex business rules are, of course, another story.', 17, 33, CAST(0x0000A27E015E733C AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (157, N'If it''s an absolute certainty that database modifications will only occur in applications then you might be right. However, this is probably pretty rare. Since users will likely enter data directly into the database, it''s good practice to put validation in the database as well. Besides, some types of validation are simply more efficiently done in the database.', 17, 34, CAST(0x00009FD500008DCC AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (158, N'Most of our applications at work were done well before solid programming processes were put into place. Therefore, we''ve got business logic scattered everywhere. Some of it''s in the UI, some in the middle tier and some in the database. It''s a mess. IMO, business logic belongs in the middle tier.', 17, 35, CAST(0x00009F610121545C AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (159, N'I would like everyone, both DBAs and developer/designer/architects, to better understand how to properly model a business domain, and how to map/translate that business domain model into both a normalized database logical model, an optimized physical model, and an appropriate object oriented class model, each one of which is (can be) different, for various reasons, and understand when, why, and how they are (or should be) different from one another.', 17, 36, CAST(0x0000A06D0130B960 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (160, N'I would say strong basic SQL skills. I''ve seen a lot of developers so far who know a little about databases but are always asking for tips about how to formulate a quite simple query. Queries are not always that easy and simple. You do have to use multiple joins (inner, left, etc.) when querying a well normalized database.', 17, 37, CAST(0x00009FB70144AFEC AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (161, N'Every C++ geek wrote a string class in college. Every graphics geek wrote a raytracer in college. Every web geek wrote interactive websites (usually before we had "web frameworks") in college. Every hardware nerd (and even software nerds) built a CPU in college. Every physician dissected an entire cadaver in college, even if she''s only going to take my blood pressure and tell me my cholesterol is too high today. Why would databases be any different?', 17, 38, CAST(0x0000A398003432E4 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (162, N'It''s virtually impossible to get the same level of understanding from just reading about them, or even working your way down from the top. But if you start at the bottom and understand each piece, then it''s relatively easy to figure out the specifics for your database. Even things that lots of database geeks can''t seem to grok, like when to use a non-relational database.', 17, 39, CAST(0x0000A19600C958EC AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (164, N'Maybe that''s a bit strict, especially if you didn''t study computer science in college. I''ll tone it down some: You could write one today, completely, from scratch. I don''t care if you know the specifics of how the PostgreSQL query optimizer works, but if you know enough to write one yourself, it probably won''t be too different from what they did. And you know, it''s really not that hard to write a basic one.', 17, 1, CAST(0x00009F41002E4550 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (170, N'Year after year, researchers come up with new ways of managing data to satisfy special requirements: either requirements to handle data relationships that don''t fit into the relational model, or else requirements of high-scale volume or speed that demand data processing be done on distributed collections of servers, instead of central database servers.', 18, 7, CAST(0x00009E8C011E458C AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (171, N'Even though these advanced technologies do great things to solve the specialized problem they were designed for, relational databases are still a good general-purpose solution for most business needs. SQL isn''t going away.', 18, 8, CAST(0x00009F740152B7B8 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (173, N'Not to be pedantic, but I would like to point out that at least CouchDB isn''t SQL-based. And I would hope that the next-gen SQL would make SQL a lot less... fugly and non-intuitive.', 18, 10, CAST(0x00009EF800ED1494 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (174, N'There are special databases for XML like MarkLogic and Berkeley XMLDB. They can index xml-docs and one can query them with XQuery. I expect JSON databases, maybe they already exist. Did some googling but couldn''t find one.', 18, 11, CAST(0x0000A081012DDCF4 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (175, N'I''m missing graph databases in the answers so far. A graph or network of objects is common in programming and can be useful in databases as well. It can handle semi-structured and interconnected information in an efficient way. Among the areas where graph databases have gained a lot of interest are semantic web and bioinformatics. RDF was mentioned, and it is in fact a language that represents a graph. Here''s some pointers to what''s happening in the graph database area:', 18, 12, CAST(0x0000A19E007800B4 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (176, N'Object databases (OODB) are different from graph databases. Simply put a graphdb won''t tie your data directly to your object model. In a graphdb relationships are first class citizens, while you''d have to implement that on your own in an OODB. In a graphdb you can have different object types represent different views on the same data. Graphdbs typically support things like finding shortest paths and the like.', 18, 13, CAST(0x00009F5F0053C0A0 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (177, N'In regard to the SQL language as a proper implementation of the relational model, I quote from wikipedia, "SQL, initially pushed as the standard language for relational databases, deviates from the relational model in several places. The current ISO SQL standard doesn''t mention the relational model or use relational terms or concepts. However, it is possible to create a database conforming to the relational model using SQL if one does not use certain SQL features."', 18, 14, CAST(0x0000A32F0039E388 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (178, N'Thumbs up for "EXEC sp_databases". The reason for this is that "sysdatabases" does not actually exist in SQL 2005 and 2008. It is renamed to "sys.databases". Cheers.', 19, 15, CAST(0x0000A3470189474C AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (179, N'EXEC sp_databases was slow to execute for me; 40 seconds on an instance with 36 databases. Selecting from sysdatabases was instant.', 19, 16, CAST(0x00009F240158D558 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (180, N'System databases with ID 5 and 6 will be ReportServer and ReportServerTempDB if you have SQL Server Reporting Services installed.', 19, 17, CAST(0x0000A07F0127FD70 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (181, N'Only if you were (silly AND installed Reporting Services using the SQL installer (rather than not accepting defaults and configuring using the manager later)) OR (awesome AND installed SQL server using a pre-configured INF file) ', 19, 18, CAST(0x0000A24A01076A60 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (182, N'I use the following SQL Server Management Objects code to get a list of databases that aren''t system databases and aren''t snapshots.

using Microsoft.SqlServer.Management.Smo;

public static string[] GetDatabaseNames( string serverName )
{
   var server = new Server( serverName );
   return ( from Database database in server.Databases 
            where !database.IsSystemObject && !database.IsDatabaseSnapshot
            select database.Name 
          ).ToArray();
}', 19, 19, CAST(0x0000A0EA00616980 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (184, N'This question concern Microsoft SQL Server not a MySQL Server, do not mix them - they might be "sql" server but they are so different in syntax like day and night... MySQL have many useful "commands" but they are not standard SQL, either syntax is very non-standard..', 19, 21, CAST(0x0000A380014D6600 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (185, N'Not sure if this will omit the Report server databases since I am not running one, but from what I have seen, I can omit system user owned databases with this SQL:

    SELECT  db.[name] as dbname 
    FROM [master].[sys].[databases] db
    LEFT OUTER JOIN  [master].[sys].[sysusers] su on su.sid = db.owner_sid
    WHERE su.sid is null
    order by db.[name]', 19, 22, CAST(0x0000A1DB00065004 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (188, N'To be blunt, it''s a matter of brute force. Simply, it reads through each candidate record in the database and matches the expression to the fields. So, if you have "select * from table where name = ''fred''", it literally runs through each record, grabs the "name" field, and compares it to ''fred''.', 21, 23, CAST(0x0000A33400C0B214 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (189, N'Now, if the "table.name" field is indexed, then the database will (likely, but not necessarily) use the index first to locate the candidate records to apply the actual filter to.

This reduces the number of candidate records to apply the expression to, otherwise it will just do what we call a "table scan", i.e. read every row.', 21, 24, CAST(0x0000A37300BB4FF4 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (190, N'Well, a join is used to make a new "pseudo table", upon which the filter is applied. So, you have the filter criteria and the join criteria. The join criteria is used to build this "pseudo table" and then the filter is applied against that. Now, when interpreting the join, it''s again the same issue as the filter -- brute force comparisons and index reads to build the subset for the "pseudo table".', 21, 25, CAST(0x0000A09D017F0C28 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (191, N'One of the keys to good database is how it manages its I/O buffers. But it basically matches RAM blocks to disk blocks. With the modern virtual memory managers, a simpler database can almost rely on the VM as its memory buffer manager. The high end DB''S do all this themselves.', 21, 26, CAST(0x0000A33B012AF5FC AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (193, N'B+Trees typically, you should look it up. It''s a straight forward technique that has been around for years. It''s benefit is shared with most any balanced tree: consistent access to the nodes, plus all the leaf nodes are linked so you can easily traverse from node to node in key order. So, with an index, the rows can be considered "sorted" for specific fields in the database, and the database can leverage that information to it benefit for optimizations. This is distinct from, say, using a hash table for an index, which only lets you get to a specific record quickly. In a B-Tree you can quickly get not just to a specific record, but to a point within a sorted list.', 21, 27, CAST(0x0000A3A3016BD824 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (194, N'The actual mechanics of storing and indexing rows in the database are really pretty straight forward and well understood. The game is managing buffers, and converting SQL in to efficient query paths to leverage these basic storage idioms.', 21, 28, CAST(0x0000A2EC00BB1304 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (195, N'Saif, excellent link. A bird''s eye overview that manages to cover most topics, and provide details on specific vendor implementations.

I made three tries at writing an explanation, but this is really too big a topic. Check out the Hellerstein article (the one on the berkeley server that Saif linked to), and then ask about specifics.', 21, 29, CAST(0x00009F2F0076E51C AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (197, N'It''s worth noting that only a subset of "known good ideas" is implemented in any given DBMS. For example, SQLite doesn''t even do hash joins, it only does nested loops (ack!!). But then, it''s an easily embeddable dbms, and it does its work very well, so there''s something to be said for the lack of complexity.', 21, 30, CAST(0x00009F8000833DA8 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (198, N'Learning about how a DBMS gathers statistics and how it uses them to construct query plans, as well as learning how to read the query plans in the first place, is an invaluable skill -- if you have to choose one "database internals" topic to learn, learn this. It will make a world of difference (and you will never accidentally write a Cartesian product again... ;-)).', 21, 31, CAST(0x0000A3660084A7C4 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (199, N'In addition to reading, it can be instructive to use the DB tools to examine the execution plan that the database uses on your queries. In addition to getting insight into how it is working, you can experiment with techniques to optimize the queries with a better feedback loop.', 21, 32, CAST(0x0000A2A500EFE41C AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (200, N'If you want to know more in detail, I''d recommend getting the sqlite sources and having a look at how it does it. It''s complete, albeit not at the scale of the larger open source and commercial databases. If you want to know more in detail I recommend The Definitive Guide to SQLite which is not only a great explanation of sqlite, but also one of the most readable technical books I know. On the MySQL side, you could learn from MySQL Performance Blog as well as on the book front the O''Reilly High Performance MySQL (V2) of which the blog is one of the authors.', 21, 33, CAST(0x00009FF3014B8DBC AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (201, N'This might be one of those cases where you need to ask yourself: Do I really want to make business with that guy? Another solution would be to press criminal charges against him. Incest is forbidden in most of the world, after all. Finally, your software is broken anyway, because you can (legally) have cycles in a family tree: cousins are allowed to marry in most (all?) western countries.', 22, 34, CAST(0x00009FB300F8D144 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (202, N'You shouldn''t add assertions for unlikely things, only impossible things. Cycles are the obvious things that aren''t possible in a family tree graph... no one can be his own ancestor via any method. These other assertions are just bogus and should be removed.', 22, 35, CAST(0x0000A2920162F588 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (203, N'Maybe next time you''ll try a more abstract example. People here can''t overlook the incest part and just close it, even if it is a valid question regarding the representation of tree like data.', 22, 36, CAST(0x00009E7800C698A0 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (204, N'It seems you (and/or your company) have a fundamental misunderstanding of what a family tree is supposed to be.

Let me clarify, I also work for a company that has (as one of its products) a family tree in its portfolio, and we have been struggling with similar problems.', 22, 37, CAST(0x0000A12900D723C8 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (205, N'The problem, in our case, and I assume your case as well, comes from the GEDCOM format that is extremely opinionated about what a family should be. However this format contains some severe misconceptions about what a family tree really looks like.

GEDCOM has many issues, such as incompatibility with same sex relations, incest, etc... Which in real life happens more often than you''d imagine (especially when going back in time to the 1700-1800).', 22, 38, CAST(0x00009EC000A7A7EC AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (206, N'We have modeled our family tree to what happens in the real world: Events (for example, births, weddings, engagement, unions, deaths, adoptions, etc.). We do not put any restrictions on these, except for logically impossible ones (for example, one can''t be one''s own parent, relations need two individuals, etc...)

The lack of validations gives us a more "real world", simpler and more flexible solution.

As for this specific case, I would suggest removing the assertions as they do not hold universally.

For displaying issues (that will arise) I would suggest drawing the same node as many times as needed, hinting at the duplication by lighting up all the copies on selecting one of them.', 5, 39, CAST(0x0000A168017D9FB4 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (207, N'This looks like the right approach, and it''s easy enough to extend to detect more complex problems. You can work out a set of "A happened before B" relationships between events. For example, that a person was born before any other events involving them. This is a directed graph. You could then check that the graph contains no cycles.', 22, 1, CAST(0x00009EF20160D820 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (213, N'If it where only that simple. In older records (even new ones) there are date inconsistencies. Baptism before birth, multiple birth records etc... So to an extent, in official records, there is time travel. We allow this inconsistent data. We allow users to indicate what the application should consider "the" birth record in case of duplicates. And we''ll indicate broken timelines if found', 22, 7, CAST(0x0000A1DD007EF84C AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (214, N'GEDCOM is a format created by the The Church of Jesus Christ of Latter-day Saints. The specification clearly states that marriage (MARR) is to be between men and women. For same sex marriage or incest the ASSO tag should be used (ASSOCIATES), also used to indicate friendship or being neighbours. It is clear the same sex marriage is second class relation within this spec. A more neutral spec would not demand male female relations.', 22, 8, CAST(0x00009FE1014E88A0 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (216, N'Potential legal implications aside, it certainly seems that you need to treat a ''node'' on a family tree as a predecessor-person rather than assuming that the node can be the-one-and-only person.

Have the tree node include a person as well as the successors - and then you can have another node deeper down the tree that includes the same person with different successors.', 22, 10, CAST(0x0000A1AB01094C04 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (217, N'This is one of the reasons why languages like "Go" do not have assertions. They are used to handle cases that you probably didn''t think about, all too often. You should only assert the impossible, not simply the unlikely. Doing the latter is what gives assertions a bad reputation. Every time you type assert(, walk away for ten minutes and really think about it.

In your particularly disturbing case, it is both conceivable and appalling that such an assertion would be bogus under rare but possible circumstances. Hence, handle it in your app, if only to say "This software was not designed to handle the scenario that you presented".

Asserting that your great, great, great grandfather being your father as impossible is a reasonable thing to do.

If I was working for a testing company that was hired to test your software, of course I would have presented that scenario. Why? Every juvenile yet intelligent ''user'' is going to do the exact same thing and relish in the resulting ''bug report''.', 5, 11, CAST(0x00009E9100943824 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (218, N'Finding true cycles in a tree can be done in a few ways. The wrong way is to mark every ancestor from a given individual, and when traversing, if the person you''re going to step to next is already marked, then cut the link. This will sever potentially accurate relationships. The correct way to do it is to start from each individual, and mark each ancestor with the path to that individual. If the new path contains the current path as a subpath, then it''s a cycle, and should be broken. You can store paths as vector<bool> (MFMF, MFFFMF, etc.) which makes the comparison and storage very fast.

There are a few other ways to detect cycles, such as sending out two iterators and seeing if they ever collide with the subset test, but I ended up using the local storage method.

Also note that you don''t need to actually sever the link, you can just change it from a normal link to a ''weak'' link, which isn''t followed by some of your algorithms. You will also want to take care when choosing which link to mark as weak; sometimes you can figure out where the cycle should be broken by looking at birthdate information, but often you can''t figure out anything because so much data is missing.', 22, 12, CAST(0x0000A13900649218 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (219, N'Instead of removing all assertions, you should still check for things like a person being his/her own parent or other impossible situations and present an error. Maybe issue a warning if it is unlikely so the user can still detect common input errors, but it will work if everything is correct.

I would store the data in a vector with a permanent integer for each person and store the parents and children in person objects where the said int is the index of the vector. This would be pretty fast to go between generations (but slow for things like name searches). The objects would be in order of when they were created.', 22, 13, CAST(0x0000A27F00B17290 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (221, N'Alternately you could make a clearbits() function instead of &= ~. Why are you using an enum for this? I thought those were for creating a bunch of unique variables with hidden arbitrary value, but you''re assigning a definite value to each one. So what''s the benefit vs just defining them as variables?', 25, 14, CAST(0x0000A1DC0176E3E0 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (222, N'The use of enums for sets of related constants goes back a long way in c programing. I suspect that with modern compilers the only advantage over const short or whatever is that they are explicitly grouped together. And when you want them for something other than bitmasks you get the automatic numbering. In c++ of course, they also form distinct types which gives you a little extras static error checking.', 25, 15, CAST(0x0000A1ED006282C0 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (223, N'I''ve always found using bitfields is a bad idea. You have no control over the order in which bits are allocated (from the top or the bottom), which makes it impossible to serialize the value in a stable/portable way except bit-at-a-time. It''s also impossible to mix DIY bit arithmetic with bitfields, for example making a mask that tests for several bits at once. You can of course use && and hope the compiler will optimize it correctly...', 25, 16, CAST(0x00009FC100E717C4 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (224, N'Bit fields are bad in so many ways, I could almost write a book about it. In fact I almost had to do that for a bit field program that needed MISRA-C compliance. MISRA-C enforces all implementation-defined behavior to be documented, so I ended up writing quite an essay about everything that can go wrong in bit fields. Bit order, endianess, padding bits, padding bytes, various other alignment issues, implicit and explicit type conversions to and from a bit field, UB if int isn''t used and so on. Instead, use bitwise-operators for less bugs and portable code. Bit fields are completely redundant.', 25, 17, CAST(0x0000A16501827084 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (225, N'Like most language features, bit fields can be used correctly or they can be abused. If you need to pack several small values into a single int, bit fields can be very useful. On the other hand, if you start making assumptions about how the bit fields map to the actual containing int, you''re just asking for trouble.', 25, 18, CAST(0x0000A1010140CE2C AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (226, N'The bottom line is that this is a general solution to an entire class of problems. It is, of course, possible and even appropriate to rewrite the equivalent of any of these macros with explicit mask values every time you need one, but why do it? Remember, the macro substitution occurs in the preprocessor and so the generated code will reflect the fact that the values are considered constant by the compiler - i.e. it''s just as efficient to use the generalized macros as to "reinvent the wheel" every time you need to do bit manipulation.', 25, 19, CAST(0x0000A135007853E8 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (228, N'What''s the point with this? It only makes the code slower and harder to read? I can''t see a single advantage with it. 1u << n is easier to read for C programmers, and can hopefully be translated into a single clock tick CPU instruction. Your division on the other hand, will be translated to something around 10 ticks, or even as bad as up to 100 ticks, depending on how poorly the specific architecture handles division. As for the bitmap feature, it would make more sense to have a lookup table translating each bit index to a byte index, to optimize for speed.', 25, 21, CAST(0x00009E6D01553B14 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (229, N'Your statements are excessively broad (thus useless to argue about). I am sure that I can find situations were they are true. This does not change my initial point. Both of these classes are perfectly fine for use in embedded systems (and I know for a fact that they are used). Your initial point about STL/Boost not being used on embedded systems is also wrong. I am sure there are systems that don''t use them and even the systems that do use them they are used judiciously but saying they are not used is just not correct (because there are systems were they are used).', 25, 22, CAST(0x0000A34D0161A534 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (230, N'As this is tagged "embedded" I''ll assume you''re using a microcontroller. All of the above suggestions are valid & work (read-modify-write, unions, structs, etc.).

However, during a bout of oscilloscope-based debugging I was amazed to find that these methods have a considerable overhead in CPU cycles compared to writing a value directly to the micro''s PORTnSET / PORTnCLEAR registers which makes a real difference where there are tight loops / high-frequency ISR''s toggling pins.

For those unfamiliar: In my example, the micro has a general pin-state register PORTn which reflects the output pins, so doing PORTn |= BIT_TO_SET results in a read-modify-write to that register. However, the PORTnSET / PORTnCLEAR registers take a ''1'' to mean "please make this bit 1" (SET) or "please make this bit zero" (CLEAR) and a ''0'' to mean "leave the pin alone". so, you end up with two port addresses depending whether you''re setting or clearing the bit (not always convenient) but a much faster reaction and smaller assembled code.', 25, 23, CAST(0x0000A1DC01545438 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (231, N'Note there is nothing "special" about this code. It treats a bit like an integer - which technically, it is. A 1 bit integer that can hold 2 values, and 2 values only.

I once used this approach to find duplicate loan records, where loan_number was the ISAM key, using the 6-digit loan number as an index into the bit array. Savagely fast, and after 8 months, proved that the mainframe system we were getting the data from was in fact malfunctioning. The simplicity of bit arrays makes confidence in their correctness very high - vs a searching approach for example.', 25, 24, CAST(0x00009F0101582338 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (232, N'You may have multiple performance problems of different sizes. If you clean out any one of them, the remaining ones will take a larger percentage, and be easier to spot, on subsequent passes.', 26, 25, CAST(0x0000A0E901781238 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (233, N'Caveat: programmers tend to be skeptical of this technique unless they''ve used it themselves. They will say that profilers give you this information, but that is only true if they sample the entire call stack, and then let you examine a random set of samples. (The summaries are where the insight is lost.) Call graphs don''t give you the same information, because 1) they don''t summarize at the instruction level, and 2) they give confusing summaries in the presence of recursion. They will also say it only works on toy programs, when actually it works on any program, and it seems to work better on bigger programs, because they tend to have more problems to find. They will say it sometimes finds things that aren''t problems, but that is only true if you see something once. If you see a problem on more than one sample, it is real.', 26, 26, CAST(0x0000A0370112BA14 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (234, N'P.S. This can also be done on multi-thread programs if there is a way to collect call-stack samples of the thread pool at a point in time, as there is in Java.

P.P.S As a rough generality, the more layers of abstraction you have in your software, the more likely you are to find that that is the cause of performance problems (and the opportunity to get speedup).', 26, 27, CAST(0x0000A419005E608C AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (235, N'Added: It might not be obvious, but the stack sampling technique works equally well in the presence of recursion. The reason is that the time that would be saved by removal of an instruction is approximated by the fraction of samples containing it, regardless of the number of times it may occur within a sample.', 26, 28, CAST(0x0000A0C500C66E70 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (236, N'Another objection I often hear is: "It will stop someplace random, and it will miss the real problem". This comes from having a prior concept of what the real problem is. A key property of performance problems is that they defy expectations. Sampling tells you something is a problem, and your first reaction is disbelief. That is natural, but you can be sure if it finds a problem it is real, and vice-versa.', 26, 29, CAST(0x0000A43D01009140 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (237, N'ADDED: Let me make a Bayesian explanation of how it works. Suppose there is some instruction I (call or otherwise) which is on the call stack some fraction f of the time (and thus costs that much). For simplicity, suppose we don''t know what f is, but assume it is either 0.1, 0.2, 0.3, ... 0.9, 1.0, and the prior probability of each of these possibilities is 0.1, so all of these costs are equally likely a-priori.', 26, 30, CAST(0x0000A2F300BAFA68 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (238, N'Now it says P(f >= 0.5) is 26%, up from the prior assumption of 0.6%. So Bayes allows us to update our estimate of the probable cost of I. If the amount of data is small, it doesn''t tell us accurately what the cost is, only that it is big enough to be worth fixing.', 26, 31, CAST(0x00009E6F0142E234 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (239, N'Yet another way to look at it is called the Rule Of Succession. If you flip a coin 2 times, and it comes up heads both times, what does that tell you about the probable weighting of the coin? The respected way to answer is to say that it''s a Beta distribution, with average value (number of hits + 1) / (number of tries + 2) = (2+1)/(2+2) = 75%.', 26, 32, CAST(0x0000A3550147BB38 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (241, N'(The key is that we see I more than once. If we only see it once, that doesn''t tell us much except that f > 0.)

So, even a very small number of samples can tell us a lot about the cost of instructions that it sees. (And it will see them with a frequency, on average, proportional to their cost. If n samples are taken, and f is the cost, then I will appear on nf+/-sqrt(nf(1-f)) samples. Example, n=10, f=0.3, that is 3+/-1.4 samples.)', 26, 33, CAST(0x0000A057017AC5A0 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (242, N'I won''t debate the "poor man" part :-) It''s true that statistical measurement precision requires many samples, but there are two conflicting goals - measurement and problem location. I''m focussing on the latter, for which you need precision of location, not precision of measure. So for example, there can be, mid-stack, a single function call A(); that accounts for 50% of time, but it can be in another large function B, along with many other calls to A() that are not costly. Precise summaries of function times can be a clue, but every other stack sample will pinpoint the problem.', 26, 34, CAST(0x0000A09C00A9E4F8 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (243, N'I''ve had very good luck with Rational Quantify (expensive but very good) and oprofile. Be aware when using oprofile that its a statistical profiler, not a full-on tracing profiler like Quantify. oprofile uses a kernel module to poke into the call stack of every running process on every interval so certain behaviors may not be caught. Using multiple profilers is good, especially since different profilers tend to give you different data all of which is useful.

As for using gprof, its ok. I would get one of the graphical front-ends, since the data can be rather difficult to get through just on the command line. I would avoid valgrind, until you require memory checking.', 26, 35, CAST(0x00009EEB016DD00C AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (244, N'Valgrind is in essence a virtual machine using just-in-time (JIT) compilation techniques, including dynamic recompilation. Nothing from the original program ever gets run directly on the host processor. Instead, Valgrind first translates the program into a temporary, simpler form called Intermediate Representation (IR), which is a processor-neutral, SSA-based form. After the conversion, a tool (see below) is free to do whatever transformations it would like on the IR, before Valgrind translates the IR back into machine code and lets the host processor run it.', 26, 36, CAST(0x0000A048010AB170 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (245, N'Callgrind is a profiler build upon that. Main benefit is that you don''t have to run your aplication for hours to get reliable result. Even one second run is sufficient to get rock-solid, reliable results, because Callgrind is a non-probing profiler.

Another tool build upon Valgrind is Massif. I use it to profile heap memory usage. It works great. What it does is that it gives you snapshots of memory usage -- detailed information WHAT holds WHAT percentage of memory, and WHO had put it there. Such information is available at different points of time of application run.', 26, 37, CAST(0x0000A11501290198 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (246, N'The call graph gets confused by function pointers. Example : I have a function called multithread() which enables me to multi-thread a specified function over a specified array (both passed as arguments). Gprof however, views all calls to multithread() as equivalent for the purposes of computing time spent in children. Since some functions I pass to multithread() take much longer than others my call graphs are mostly useless. (to those wondering if threading is the issue here : no, multithread() can optionally, and did in this case, run everything sequentially on the calling thread only).', 26, 38, CAST(0x0000A31400FECBBC AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (247, N'It says here that "... the number-of-calls figures are derived by counting, not sampling. They are completely accurate...". Yet I find my call graph giving me 5345859132+784984078 as call stats to my most called function, where the first number is supposed to be direct calls, and the second recursive calls (which are all from itself). Since this implied I had a bug, I put in long (64bit) counters into the code and did the same run again. My counts : 5345859132 direct, and 78094395406 self-recursive calls. There''s a lot of digits there, so I''ll point out the recursive calls I measure are 78bn, versus 784m from gprof : a factor of 100 different. Both runs were single threaded and unoptimised code, one compiled -g and the other -pg.', 26, 39, CAST(0x0000A07C00B22258 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (248, N'Apart from syntactic sugar, a reference is a const pointer (not pointer to const thing, a const pointer). You must establish what it refers to when you declare the reference variable, an you cannot change it later.', 27, 38, CAST(0x00009EC200B12C40 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (249, N'A pointer has its own memory address and size on the stack (4 bytes on x86), whereas a reference shares the same memory address (with the original variable) but also takes up some space on the stack. Since a reference has the same address as the original variable itself, it is safe to think of a reference as another name for the same variable. Note: What a pointer points to can be on the stack or heap. Ditto a reference. My claim in this statement is not that a pointer must point to the stack. A pointer is just a variable that holds a memory address. This variable is on the stack. Since a reference has its own space on the stack, and since the address is the same as the variable it references. More on stack vs heap. This implies that there is a real address of a reference that the compiler will not tell you.', 27, 37, CAST(0x0000A3600057123C AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (250, N'While the standard might not require space allocated for the reference, in many cases the compiler will be forced to reserve space. Consider a reference within a class, surely each instance of the class can refer to different external objects, and to which object they refer must be held somehow --in most implementations as an automatically dereferenced pointer (I cannot really think of any other possible implementation that fits all use cases, but then again, I am no expert) ', 27, 36, CAST(0x0000A1B501321314 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (251, N'See Mark Ransom''s answer for a counter-example. This is the most often asserted myth about references, but it is a myth. The only guarantee that you have by the standard is, that you immediately have UB when you have a NULL reference. But that is akin to saying "This car is safe, it can never get off the road. (We don''t take any responsibility for what may happen if you steer it off the road anyway. It might just explode.)', 27, 35, CAST(0x0000A356008F25B4 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (252, N'Yes, valid programs stay on the road. But there is no traffic barrier to enforce that your program actually does. Large parts of the road are actually missing markings. So it''s extremely easy to get off the road at night. And it is crucial for debugging such bugs that you know this can happen: the null reference can propagate before it crashes your program, just like a null pointer can. And when it does you have code like void Foo::bar() { virtual_baz(); } that segfaults. If you are not aware that references may be null, you can''t trace the null back to its origin.', 27, 34, CAST(0x0000A1FC018A5E34 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (253, N'The actual error is in the dereferencing of the NULL pointer, prior to the assignment to a reference. But I''m not aware of any compilers that will generate any errors on that condition - the error propagates to a point further along in the code. That''s what makes this problem so insidious. Most of the time, if you dereference a NULL pointer, you crash right at that spot and it doesn''t take much debugging to figure it out.', 27, 33, CAST(0x00009E8D00888600 AS DateTime), 1)
GO
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (254, N'I want to reiterate that the only way to get a null reference is through malformed code, and once you have it you''re getting undefined behavior. It never makes sense to check for a null reference; for example you can try if(&bar==NULL)... but the compiler might optimize the statement out of existence! A valid reference can never be NULL so from the compiler''s view the comparison is always false - this is the essence of undefined behavior.', 27, 32, CAST(0x0000A301002C79F0 AS DateTime), 1)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (255, N'Schwartz, if I were talking about the way things had to work according to the standard, you''d be correct. But that''s not what I''m talking about - I''m talking about actual observed behavior with a very popular compiler, and extrapolating based on my knowledge of typical compilers and CPU architectures to what will probably happen. If you believe references to be superior to pointers because they''re safer and don''t consider that references can be bad, you''ll be stumped by a simple problem someday just as I was.', 27, 31, CAST(0x0000A0980056BCB0 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (256, N'Quoting myself: "A reference on the stack doesn''t take up any space at all. Or rather, it doesn''t matter how much space it takes up since you can''t actually see any side effect of whatever space it would take up." In other words, it may have an impact, but you can only observe it through side effects of execution. It doesn''t even have a different size from the underlying type. This is different from embedding a reference in another type.', 27, 30, CAST(0x0000A267017A4F44 AS DateTime), 0)
INSERT [dbo].[Answers] ([Id], [Content], [QuestionId], [UserId], [CreatedOn], [IsHidden]) VALUES (257, N'When calling a function, the compiler usually generates memory spaces for the arguments to be copied to. The function signature defines the spaces that should be created and gives the name that should be used for these spaces. Declaring a parameter as a reference just tells the compiler to use the input variable memory space instead of allocating a new memory space during the method call. It may seem strange to say that your function will be directly manipulating a variable declared in the calling scope but remember that when executing a compiled code, there is no more scope, there is just plain flat memory and your function code could manipulate any variables.', 5, 29, CAST(0x0000A4470162CDB0 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Answers] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [CategoryId]) VALUES (1, N'Java', 22)
INSERT [dbo].[Categories] ([Id], [Name], [CategoryId]) VALUES (2, N'C#', 22)
INSERT [dbo].[Categories] ([Id], [Name], [CategoryId]) VALUES (3, N'C++', 22)
INSERT [dbo].[Categories] ([Id], [Name], [CategoryId]) VALUES (4, N'Databases', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CategoryId]) VALUES (5, N'ORM Technologies', 4)
INSERT [dbo].[Categories] ([Id], [Name], [CategoryId]) VALUES (6, N'.NET', 22)
INSERT [dbo].[Categories] ([Id], [Name], [CategoryId]) VALUES (7, N'JavaScript', 22)
INSERT [dbo].[Categories] ([Id], [Name], [CategoryId]) VALUES (8, N'Git', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CategoryId]) VALUES (9, N'Design', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CategoryId]) VALUES (10, N'Front-End', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CategoryId]) VALUES (11, N'Design Patterns', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CategoryId]) VALUES (12, N'Python', 22)
INSERT [dbo].[Categories] ([Id], [Name], [CategoryId]) VALUES (13, N'PHP', 22)
INSERT [dbo].[Categories] ([Id], [Name], [CategoryId]) VALUES (14, N'Security', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CategoryId]) VALUES (15, N'Algorithms', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CategoryId]) VALUES (16, N'SQL Server', 4)
INSERT [dbo].[Categories] ([Id], [Name], [CategoryId]) VALUES (17, N'MySQL', 4)
INSERT [dbo].[Categories] ([Id], [Name], [CategoryId]) VALUES (18, N'jQuery', 7)
INSERT [dbo].[Categories] ([Id], [Name], [CategoryId]) VALUES (19, N'AngularJS', 7)
INSERT [dbo].[Categories] ([Id], [Name], [CategoryId]) VALUES (20, N'SPA Applications', 7)
INSERT [dbo].[Categories] ([Id], [Name], [CategoryId]) VALUES (21, N'UX Design', 9)
INSERT [dbo].[Categories] ([Id], [Name], [CategoryId]) VALUES (22, N'Programming', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CategoryId]) VALUES (23, N'Android', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CategoryId]) VALUES (26, N'Computer Networks', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CategoryId]) VALUES (27, N'Artifficial Intelligence', NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Questions] ON 

INSERT [dbo].[Questions] ([Id], [Title], [Content], [CategoryId], [UserId], [CreatedOn]) VALUES (2, N'Why is processing a sorted array faster than an unsorted array?', N'Here is a piece of C++ code that seems very peculiar. For some strange reason, sorting the data miraculously makes the code almost six times faster. Initially, I thought this might be just a language or compiler anomaly. So I tried it in Java. With a somewhat similar, but less extreme result. My first thought was that sorting brings the data into the cache, but my next thought was how silly that is, because the array was just generated.

What is going on?
Why is a sorted array faster than an unsorted array?
The code is summing up some independent terms, and the order should not matter.', 1, 1, CAST(0x00009F7A0100A7A9 AS DateTime))
INSERT [dbo].[Questions] ([Id], [Title], [Content], [CategoryId], [UserId], [CreatedOn]) VALUES (3, N'Why is subtracting these two times (in 1927) giving a strange result?', N'The code above produces no output on my Windows machine. So any time zone which has any offset other than its standard one at the start of 1900 will count that as a transition. TZDB itself has some data going back earlier than that, and doesn''t rely on any idea of a "fixed" standard time (which is what getRawOffset assumes to be a valid concept) so other libraries needn''t introduce this artificial transition.', 1, 7, CAST(0x00009F9F00BD0737 AS DateTime))
INSERT [dbo].[Questions] ([Id], [Title], [Content], [CategoryId], [UserId], [CreatedOn]) VALUES (5, N'Java += operator', N'Until today I thought that for example:

i += j;
is just a shortcut for:

i = i + j;
But what if we try this:

int i = 5;
long j = 8;
Then i = i + j; will not compile but i += j; will compile fine.

Does it mean that in fact i += j; is a shortcut for something like this i = (type of i) (i + j)?

I''ve tried googling for it but couldn''t find anything relevant.', 1, 8, CAST(0x00009FA800D308D3 AS DateTime))
INSERT [dbo].[Questions] ([Id], [Title], [Content], [CategoryId], [UserId], [CreatedOn]) VALUES (6, N'What exactly is Apache Camel?', N'I don''t understand what exactly Camel does.

If you could give in 101 words an introduction to Camel:

What exactly is it?
How does it interact with an application written in Java?
Is it something that goes together with the server?
Is it an independent program?
Please explain what Camel is.', 1, 10, CAST(0x00009FAE01670DCD AS DateTime))
INSERT [dbo].[Questions] ([Id], [Title], [Content], [CategoryId], [UserId], [CreatedOn]) VALUES (7, N'What is a JavaBean exactly?', N'I understood, I think, that a "Bean" is a Java class with properties and getters/setters. As much as I understand, it is the equivalent of a C struct. Is that true?

Also, is there a real syntactic difference between a bean and a regular class? Is there any special definition or an interface?

Basically, why is there a term for this, it puzzles me...

Edit: If you can be so kind and add information regarding the Serializable interface, and what it means, to your answer, I''d be very grateful.', 1, 11, CAST(0x0000A0150100A7A9 AS DateTime))
INSERT [dbo].[Questions] ([Id], [Title], [Content], [CategoryId], [UserId], [CreatedOn]) VALUES (8, N'How can I Initialize a static Map?', N'How would you initialise a static Map in Java?

Method one: Static initializer 
Method two: instance initialiser (anonymous subclass) or some other method?

What are the pros and cons of each?

Here is an example illustrating two methods:', 1, 12, CAST(0x0000A04F00FF2A76 AS DateTime))
INSERT [dbo].[Questions] ([Id], [Title], [Content], [CategoryId], [UserId], [CreatedOn]) VALUES (11, N'What''s the difference between String and string?', N'In C#, what is the difference between String and string? (note the case) Example:

string s = "Hello, World";

String S = "Hello, World";
What are the guidelines for the use of each? And what are the differences?', 2, 13, CAST(0x0000A09600F727DD AS DateTime))
INSERT [dbo].[Questions] ([Id], [Title], [Content], [CategoryId], [UserId], [CreatedOn]) VALUES (12, N'Is there a reason for C#''s reuse of the variable in a foreach?', N'When using lambda expressions or anonymous methods in C#, we have to be wary of the access to modified closure pitfall. For example:

foreach (var s in strings)
{
   query = query.Where(i => i.Prop == s); // access to modified closure
   ...
}
Due to the modified closure, the above code will cause all of the Where clauses on the query to be based on the final value of s.

As explained here, this happens because the s variable declared in foreach loop above is translated like this in the compiler:

string s;
while (enumerator.MoveNext())
{
   s = enumerator.Current;
   ...
}
instead of like this:

while (enumerator.MoveNext())
{
   string s;
   s = enumerator.Current;
   ...
}
As pointed out here, there are no performance advantages to declaring a variable outside the loop, and under normal circumstances the only reason I can think of for doing this is if you plan to use the variable outside the scope of the loop:

string s;
while (enumerator.MoveNext())
{
   s = enumerator.Current;
   ...
}
var finalString = s;
However variables defined in a foreach loop cannot be used outside the loop:

foreach(string s in strings)
{
}
var finalString = s; // won''t work: you''re outside the scope.
So the compiler declares the variable in a way that makes it highly prone to an error that is often difficult to find and debug, while producing no perceivable benefits.

Is there something you can do with foreach loops this way that you couldn''t if they were compiled with an inner-scoped variable, or is this just an arbitrary choice that was made before anonymous methods and lambda expressions were available or common, and which hasn''t been revised since then?', 2, 17, CAST(0x00009FD4006C7D70 AS DateTime))
INSERT [dbo].[Questions] ([Id], [Title], [Content], [CategoryId], [UserId], [CreatedOn]) VALUES (13, N'Should ''using'' statements be inside or outside the namespace?', N'I have been running StyleCop over some C# code, and it keeps reporting that my using statements should be inside the namespace.

Is there a technical reason for putting the using statements inside instead of outside the namespace?', 2, 18, CAST(0x0000A00700864ED0 AS DateTime))
INSERT [dbo].[Questions] ([Id], [Title], [Content], [CategoryId], [UserId], [CreatedOn]) VALUES (14, N'Deep cloning objects', N'I want to do something like:

myObject myObj = GetmyObj(); //Create and fill a new object
myObject newObj = myObj.Clone();
And then make changes to the new object that are not reflected in the original object.

I don''t often need this functionality, so when it''s been necessary, I''ve resorted to creating a new object and then copying each property individually, but it always leaves me with the feeling that there is a better or more elegant way of handling the situation.

How can I clone or deep copy an object so that the cloned object can be modified without any changes being reflected in the original object?', 2, 19, CAST(0x0000A007009A1550 AS DateTime))
INSERT [dbo].[Questions] ([Id], [Title], [Content], [CategoryId], [UserId], [CreatedOn]) VALUES (15, N'Catch multiple Exceptions at once?', N'It is discouraged to simply catch System.Exception, instead only the "known" Exceptions should be caught.

Now, this sometimes leads to unneccessary repetetive code, for example:

try
{
    WebId = new Guid(queryString["web"]);
}
catch (FormatException)
{
    WebId = Guid.Empty;
}
catch (OverflowException)
{
    WebId = Guid.Empty;
}
I wonder: Is there a way to catch both Exceptions and only call the WebId = Guid.Empty call once?

Edit: the given example is rather simple, as it''s only a Guid. But imagine Code where you modify an object multiple times, and if one of the manipulations fail in an expected way, you want to "reset" the object. However, if there is an unexpected Exception, I still want to throw that higher.

About the Answer: Thanks everyone! For some reason, I had my mind set on a switch-case statement which does not support switching on GetType(). Now, there were two answers, one using "typeof" and one using "is". I first thought typeof() would be my Function because I thought "Hey, I only want to catch FormatException because that''s the only thing I expect". But that''s not how catch() works: catch also catches all derived exceptions. After thinking about it, this is really obvious: Otherwise, catch(Exception ex) would not work! So the correct answer is "is". Yay, learned two things with only one question \o/', 2, 17, CAST(0x0000A04A00BB9770 AS DateTime))
INSERT [dbo].[Questions] ([Id], [Title], [Content], [CategoryId], [UserId], [CreatedOn]) VALUES (16, N'Can I create a SQLite view UNIONING all databases?', N'I have databases which manage files. The reason that there are multiple is that they live on separate drives (think USB drives). I want to write queries which apply to files on all drives. The problem is that I cannot take down the view to recreate it with another database (its being used). Therefore, I was wondering if there is a way to write a view to union all tables with the same name in each of the databases from .databases? That way, when a new database is attached, i dont have to take down the view.', 4, 8, CAST(0x0000A09200C27540 AS DateTime))
INSERT [dbo].[Questions] ([Id], [Title], [Content], [CategoryId], [UserId], [CreatedOn]) VALUES (17, N'What should every developer know about databases?', N'Whether we like it or not, many if not most of us developers either regularly work with databases or may have to work with one someday. And considering the amount of misuse and abuse in the wild, and the volume of database-related questions that come up every day, it''s fair to say that there are certain concepts that developers should know - even if they don''t design or work with databases today.', 4, 11, CAST(0x0000A13C00DA5A70 AS DateTime))
INSERT [dbo].[Questions] ([Id], [Title], [Content], [CategoryId], [UserId], [CreatedOn]) VALUES (18, N'The Next-gen Databases', N'I''m learning traditional Relational Databases (with PostgreSQL) and doing some research I''ve come across some new types of databases. CouchDB, Drizzle, and Scalaris to name a few, what is going to be the next database technologies to deal with?', 4, 12, CAST(0x0000A1C6011D5EB0 AS DateTime))
INSERT [dbo].[Questions] ([Id], [Title], [Content], [CategoryId], [UserId], [CreatedOn]) VALUES (19, N'Get list of databases from SQL Server', N'How can I get the list of available databases on a SQL Server instance? I''m planning to make a list of them in a combo box in VB.NET.', 4, 13, CAST(0x0000A22701380300 AS DateTime))
INSERT [dbo].[Questions] ([Id], [Title], [Content], [CategoryId], [UserId], [CreatedOn]) VALUES (21, N'How do databases work internally?', N'I''ve been working with databases for the last few years and I''d like to think that I''ve gotten fairly competent with using them. However I was reading recently about Joel''s Law of Leaky Abstractions and I realised that even though I can write a query to get pretty much anything I want out of a database, I have no idea how the database actually interprets the query. Does anyone know of any good articles or books that explain how databases work internally?

Some specific things I''m interested in are:

What does a database actually do to find out what matches a select statement?
How does a database interpret a join differently to a query with several "where key1 = key2" statements?
How does the database store all its memory?
How are indexes stored?', 4, 14, CAST(0x0000A26701483770 AS DateTime))
INSERT [dbo].[Questions] ([Id], [Title], [Content], [CategoryId], [UserId], [CreatedOn]) VALUES (22, N'Cycles in family tree software', N'I am the developer of some family tree software (written in C++ and Qt). I had no problems until one of my customers mailed me a bug report. The problem is that he has two children with his own daughter, and, as a result, he can''t use my software because of errors.

Those errors are the result of my various assertions and invariants about the family graph being processed (for example, after walking a cycle, the program states that X can''t be both father and grandfather of Y).

How can I resolve those errors without removing all data assertions?', 3, 15, CAST(0x0000A27A01598520 AS DateTime))
INSERT [dbo].[Questions] ([Id], [Title], [Content], [CategoryId], [UserId], [CreatedOn]) VALUES (25, N'How do you set, clear and toggle a single bit in C/C++?', N'How to set, clear and toggle a bit in C/C++?', 3, 16, CAST(0x0000A36F016208D0 AS DateTime))
INSERT [dbo].[Questions] ([Id], [Title], [Content], [CategoryId], [UserId], [CreatedOn]) VALUES (26, N'What can I use to profile C++ code in Linux?', N'I have a C++ application I''m in the process of optimizing. What tool can I use to pinpoint my slow code?', 3, 17, CAST(0x0000A393016EAB30 AS DateTime))
INSERT [dbo].[Questions] ([Id], [Title], [Content], [CategoryId], [UserId], [CreatedOn]) VALUES (27, N'What are the differences between a pointer variable and a reference variable in C++?', N'I know references are syntactic sugar, so code is easier to read and write.

But what are the differences?

Summary from answers and links below:

A pointer can be re-assigned any number of times while a reference can not be re-seated after binding.
Pointers can point nowhere (NULL), whereas reference always refer to an object.
You can''t take the address of a reference like you can with pointers.
There''s no "reference arithmetics" (but you can take the address of an object pointed by a reference and do pointer arithmetics on it as in &obj + 5).
To clarify a misconception:', 3, 18, CAST(0x0000A441018AF560 AS DateTime))
INSERT [dbo].[Questions] ([Id], [Title], [Content], [CategoryId], [UserId], [CreatedOn]) VALUES (29, N'Fetch NULL values in PDO query', N'When I run the snippet, NULL values are converted to empty strings. How can fetch NULL values?', 4, 32, CAST(0x0000A44A00EEF6A7 AS DateTime))
SET IDENTITY_INSERT [dbo].[Questions] OFF
INSERT [dbo].[QuestionsTags] ([TagId], [QuestionId]) VALUES (58, 6)
INSERT [dbo].[QuestionsTags] ([TagId], [QuestionId]) VALUES (2, 6)
INSERT [dbo].[QuestionsTags] ([TagId], [QuestionId]) VALUES (61, 7)
INSERT [dbo].[QuestionsTags] ([TagId], [QuestionId]) VALUES (2, 7)
INSERT [dbo].[QuestionsTags] ([TagId], [QuestionId]) VALUES (40, 7)
INSERT [dbo].[QuestionsTags] ([TagId], [QuestionId]) VALUES (1, 8)
INSERT [dbo].[QuestionsTags] ([TagId], [QuestionId]) VALUES (21, 8)
INSERT [dbo].[QuestionsTags] ([TagId], [QuestionId]) VALUES (22, 8)
INSERT [dbo].[QuestionsTags] ([TagId], [QuestionId]) VALUES (2, 12)
INSERT [dbo].[QuestionsTags] ([TagId], [QuestionId]) VALUES (2, 11)
INSERT [dbo].[QuestionsTags] ([TagId], [QuestionId]) VALUES (8, 22)
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([Id], [Name]) VALUES (1, N'c#')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (2, N'java')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (3, N'php')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (4, N'ruby')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (5, N'python')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (6, N'security')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (7, N'computer')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (8, N'c++')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (9, N'go')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (10, N'qa')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (11, N'performance')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (12, N'optimization')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (13, N'operator')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (14, N'statement')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (15, N'terminology')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (16, N'null')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (17, N'android')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (18, N'code')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (19, N'hashtable')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (20, N'hashmap')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (21, N'string')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (22, N'stream')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (23, N'inputstream')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (24, N'memory')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (25, N'char')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (26, N'array')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (27, N'list')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (28, N'structures')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (29, N'random')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (30, N'range')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (31, N'eclipse')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (32, N'visualstudio')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (33, N'http')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (34, N'udp')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (35, N'tcp')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (36, N'request')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (37, N'response')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (38, N'url')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (39, N'jsp')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (40, N'javaee')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (41, N'exception')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (42, N'deadlock')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (43, N'multithreading')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (44, N'loops')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (45, N'math')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (46, N'equals')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (47, N'map')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (48, N'concatenation')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (49, N'parameters')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (50, N'default')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (51, N'methods')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (52, N'jvm')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (53, N'notepad')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (54, N'buffer')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (55, N'enum')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (56, N'stacktrace')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (57, N'nodejs')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (58, N'apache')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (59, N'junit')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (60, N'assert')
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (61, N'serializable')
SET IDENTITY_INSERT [dbo].[Tags] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [PhoneNumber], [RegistrationDate], [Email]) VALUES (1, N'Joiner', N'Adriano', N'Abatangelo', NULL, CAST(0xBB380B00 AS Date), N'Joiner@gmail.com')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [PhoneNumber], [RegistrationDate], [Email]) VALUES (7, N'JonSkeet', N'Jon', N'Skeet', N'0895471654', CAST(0xB5360B00 AS Date), N'JonSkeet@yahoo.com')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [PhoneNumber], [RegistrationDate], [Email]) VALUES (8, N'HonzaBrabec', N'Honza', N'Brabec', N'0947523654', CAST(0x7C360B00 AS Date), N'HonzaBrabec@brabec.com')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [PhoneNumber], [RegistrationDate], [Email]) VALUES (10, N'RaviKumar', N'Ravi', N'Meduri', N'0885316781', CAST(0x10360B00 AS Date), N'kumar@abv.bg')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [PhoneNumber], [RegistrationDate], [Email]) VALUES (11, N'StefanG', N'Stefan', N'Georgiev', N'0886947513', CAST(0xED370B00 AS Date), N'stefang@gmail.com')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [PhoneNumber], [RegistrationDate], [Email]) VALUES (12, N'Brodie', N'Jim', N'Brodie', N'0894153497', CAST(0xC4320B00 AS Date), N'brodiej@yahoo.com')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [PhoneNumber], [RegistrationDate], [Email]) VALUES (13, N'DanielB', N'Daniel', N'Bocksteger', NULL, CAST(0xAC310B00 AS Date), N'danbocksteger@mail.bg')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [PhoneNumber], [RegistrationDate], [Email]) VALUES (14, N'LloudNe', N'SHane', N'Lloyd', NULL, CAST(0x5E340B00 AS Date), N'lloudne@abv.bg')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [PhoneNumber], [RegistrationDate], [Email]) VALUES (15, N'MaryDefal', N'Mary', N'Defal', N'0887913947', CAST(0x75370B00 AS Date), N'MaryDefal@yahoo.com')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [PhoneNumber], [RegistrationDate], [Email]) VALUES (16, N'Chad', N'Chad', N'Killingsworth', NULL, CAST(0x4E390B00 AS Date), N'chad@killingsworth.com')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [PhoneNumber], [RegistrationDate], [Email]) VALUES (17, N'StefSan', N'Stefano', N'Sanfilippo', NULL, CAST(0x3F350B00 AS Date), N'stefsan@stefano.net')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [PhoneNumber], [RegistrationDate], [Email]) VALUES (18, N'AGreenman', N'Angelo', N'Greenman', N'0882346545', CAST(0xB0340B00 AS Date), N'agreen@abv.bg')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [PhoneNumber], [RegistrationDate], [Email]) VALUES (19, N'Ankit', N'Angel', N'Nikolaev', N'0878645521', CAST(0x93320B00 AS Date), N'angel@gmail.com')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [PhoneNumber], [RegistrationDate], [Email]) VALUES (21, N'buch', N'Arpan', N'Buch', NULL, CAST(0x86370B00 AS Date), N'arpan@buch.info')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [PhoneNumber], [RegistrationDate], [Email]) VALUES (22, N'Onorio', N'Onorio', N'Catenacci', N'0895232112', CAST(0x44380B00 AS Date), N'catenacci@onorio.com')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [PhoneNumber], [RegistrationDate], [Email]) VALUES (23, N'ben', N'Ben', N'Ford', N'0888545444', CAST(0x74390B00 AS Date), N'fordben@gmail.com')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [PhoneNumber], [RegistrationDate], [Email]) VALUES (24, N'micori', N'Mico', N'Rigunay', N'0889664877', CAST(0x91390B00 AS Date), N'micori@yahoo.com')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [PhoneNumber], [RegistrationDate], [Email]) VALUES (25, N'Lingfeng', N'Lingfeng', N'Zhuang', NULL, CAST(0x84390B00 AS Date), N'lingfeng@abv.bg')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [PhoneNumber], [RegistrationDate], [Email]) VALUES (26, N'Qwerty', N'Tony', N'Quig', NULL, CAST(0x65370B00 AS Date), N'querty@google.com')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [PhoneNumber], [RegistrationDate], [Email]) VALUES (27, N'Lorraine', N'Ellen', N'Mulcahy', NULL, CAST(0x6C360B00 AS Date), N'lorraine@microsoft.com')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [PhoneNumber], [RegistrationDate], [Email]) VALUES (28, N'casper', N'Casoer', N'Beyer', N'0884544125', CAST(0xB2360B00 AS Date), N'casper@cartoon.com')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [PhoneNumber], [RegistrationDate], [Email]) VALUES (29, N'keveh', N'Keveh', N'Shahbazian', N'0887455222', CAST(0xA8350B00 AS Date), N'keveh@abv.bg')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [PhoneNumber], [RegistrationDate], [Email]) VALUES (30, N'ziba', N'Ziba', N'Leah', NULL, CAST(0x2C390B00 AS Date), N'ziba@gmail.com')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [PhoneNumber], [RegistrationDate], [Email]) VALUES (31, N'quirk', N'Patrick', N'Quirk', NULL, CAST(0xB8320B00 AS Date), N'quirk@mail.com')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [PhoneNumber], [RegistrationDate], [Email]) VALUES (32, N'darkcat', N'Darkcat', N'Studios', N'0889665522', CAST(0x52370B00 AS Date), N'darkcat@studios.com')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [PhoneNumber], [RegistrationDate], [Email]) VALUES (33, N'Pravinsingh', N'Pravinsingh', N'Wanghela', NULL, CAST(0x8B350B00 AS Date), N'pravinsingh@abv.bg')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [PhoneNumber], [RegistrationDate], [Email]) VALUES (34, N'Rafael', N'Rafael', N'Afonso', NULL, CAST(0xB3340B00 AS Date), N'rafael@gmail.com')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [PhoneNumber], [RegistrationDate], [Email]) VALUES (35, N'HHendriks', N'Henry', N'Hendriks', N'0887541254', CAST(0xE1370B00 AS Date), N'hhendriks@hp.com')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [PhoneNumber], [RegistrationDate], [Email]) VALUES (36, N'Sydney', N'Sydney', N'Nogueira', NULL, CAST(0x8E350B00 AS Date), N'sydney@mail.com')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [PhoneNumber], [RegistrationDate], [Email]) VALUES (37, N'Camacho', N'President', N'Camacho', N'0885152244', CAST(0xD0380B00 AS Date), N'camacho@gmail.com')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [PhoneNumber], [RegistrationDate], [Email]) VALUES (38, N'Kaviraj', N'Kaviraj', N'Kanagaraj', NULL, CAST(0x5C340B00 AS Date), N'kaviraj@microsoft.com')
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [PhoneNumber], [RegistrationDate], [Email]) VALUES (39, N'Darshan', N'Darshan', N'Kapasi', N'0845242525', CAST(0xA0320B00 AS Date), N'darshan@abv.bg')
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[Votes] ON 

INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (2, 1, 2, 2)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (3, 31, 2, 203)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (4, 28, 2, 20)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (5, 28, 2, 139)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (6, 11, 2, 57)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (7, 23, 2, 205)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (8, 11, 2, 38)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (9, 16, 2, 253)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (10, 12, 2, 17)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (11, 31, 2, 193)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (12, 23, 2, 17)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (13, 37, 2, 67)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (14, 13, 2, 14)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (15, 38, 2, 109)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (16, 34, 2, 233)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (17, 39, 2, 206)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (18, 30, 2, 152)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (19, 7, 2, 161)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (20, 27, 2, 81)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (21, 27, 2, 218)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (22, 33, 2, 250)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (23, 32, 2, 68)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (24, 33, 2, 109)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (25, 10, 2, 65)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (26, 17, 2, 79)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (27, 15, 2, 205)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (28, 21, 2, 21)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (29, 26, 2, 55)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (30, 35, 2, 204)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (31, 32, 2, 235)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (32, 26, 2, 64)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (33, 7, 2, 136)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (34, 14, 2, 93)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (35, 8, 2, 152)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (36, 34, 2, 80)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (37, 27, 2, 185)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (38, 16, 2, 105)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (39, 7, 2, 230)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (40, 38, 2, 161)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (41, 22, 2, 181)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (42, 10, 2, 173)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (43, 28, 2, 146)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (44, 27, 2, 160)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (45, 13, 2, 54)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (46, 19, 2, 247)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (47, 13, 2, 195)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (48, 34, 2, 70)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (49, 13, 2, 106)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (50, 39, 2, 33)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (51, 21, 2, 69)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (52, 34, -1, 45)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (53, 13, -1, 146)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (54, 34, -1, 60)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (55, 23, -1, 251)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (56, 11, -1, 243)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (57, 38, -1, 123)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (58, 10, -1, 146)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (59, 38, -1, 134)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (60, 26, -1, 117)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (61, 7, -1, 177)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (62, 19, -1, 248)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (63, 8, -1, 177)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (64, 21, -1, 185)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (65, 37, -1, 128)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (66, 17, -1, 255)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (67, 34, -1, 22)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (68, 21, -1, 34)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (69, 23, -1, 182)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (70, 38, -1, 34)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (71, 34, -1, 194)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (72, 10, -1, 81)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (73, 18, -1, 25)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (74, 34, -1, 235)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (75, 19, -1, 247)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (76, 19, -1, 39)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (77, 8, -1, 170)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (78, 39, -1, 130)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (79, 15, -1, 155)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (80, 13, -1, 257)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (81, 24, -1, 245)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (82, 12, -1, 217)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (83, 30, -1, 243)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (84, 29, -1, 154)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (85, 7, -1, 197)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (86, 26, -1, 17)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (87, 33, -1, 82)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (88, 25, -1, 10)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (89, 12, -1, 46)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (90, 15, -1, 236)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (91, 39, -1, 35)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (92, 12, -1, 96)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (93, 28, -1, 110)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (94, 16, -1, 232)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (95, 17, -1, 56)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (96, 17, -1, 108)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (97, 16, -1, 49)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (98, 31, -1, 216)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (99, 15, -1, 190)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (100, 13, -1, 21)
GO
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (101, 12, -1, 174)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (102, 24, -1, 46)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (103, 29, -1, 214)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (104, 12, -1, 179)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (105, 30, -1, 67)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (106, 18, -1, 90)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (107, 15, -1, 236)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (108, 37, -1, 160)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (109, 25, -1, 103)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (110, 8, -1, 242)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (111, 21, -1, 188)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (112, 31, -1, 162)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (113, 19, -1, 174)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (114, 34, -1, 62)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (115, 33, -1, 28)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (116, 7, -1, 182)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (117, 34, -1, 218)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (118, 12, -1, 203)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (119, 23, -1, 200)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (120, 16, -1, 213)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (121, 16, -1, 106)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (122, 37, -1, 233)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (123, 22, -1, 144)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (124, 23, -1, 80)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (125, 26, -1, 213)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (126, 12, -1, 159)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (127, 28, -1, 230)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (128, 16, -1, 191)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (129, 18, -1, 226)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (130, 8, -1, 230)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (131, 34, -1, 206)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (132, 28, -1, 73)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (133, 25, -1, 122)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (134, 13, -1, 216)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (135, 33, 1, 256)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (136, 34, 1, 228)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (137, 15, 1, 255)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (138, 12, 1, 217)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (139, 35, 1, 234)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (140, 30, 1, 257)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (141, 23, 1, 251)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (142, 18, 1, 12)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (143, 24, 1, 159)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (144, 23, 1, 231)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (145, 18, 1, 156)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (146, 36, 1, 221)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (147, 15, 1, 203)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (148, 31, 1, 86)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (149, 7, 1, 138)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (150, 37, 1, 117)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (151, 35, 1, 75)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (152, 15, 1, 233)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (153, 27, 1, 46)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (154, 22, 1, 39)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (155, 37, 1, 28)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (156, 38, 1, 213)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (157, 27, 1, 84)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (158, 11, 1, 153)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (159, 30, 1, 116)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (160, 13, 1, 89)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (161, 13, 1, 108)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (162, 34, 1, 85)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (163, 11, 1, 206)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (164, 39, 1, 184)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (165, 23, 1, 25)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (166, 31, 1, 214)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (167, 31, 1, 63)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (168, 26, 1, 75)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (169, 21, 1, 199)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (170, 26, 1, 29)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (171, 31, 1, 29)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (172, 22, 1, 158)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (173, 38, 1, 86)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (174, 32, 1, 45)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (175, 35, -1, 190)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (176, 8, -1, 184)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (177, 29, -1, 36)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (178, 19, -1, 135)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (179, 27, -1, 83)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (180, 29, -1, 234)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (181, 11, -1, 191)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (182, 29, -1, 89)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (183, 38, -1, 86)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (184, 28, -1, 117)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (185, 1, -1, 254)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (186, 35, -1, 133)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (187, 35, -1, 242)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (188, 8, -1, 23)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (189, 36, -1, 203)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (190, 37, -1, 138)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (191, 12, -1, 24)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (192, 37, -1, 147)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (193, 26, -1, 241)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (194, 14, -1, 84)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (195, 11, -1, 214)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (196, 27, -1, 17)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (197, 19, -1, 54)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (198, 38, -1, 61)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (199, 18, -1, 120)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (200, 19, -1, 113)
GO
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (201, 15, -1, 107)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (202, 39, -1, 245)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (203, 13, -1, 223)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (204, 37, -1, 238)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (205, 26, -1, 140)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (206, 35, -1, 133)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (207, 8, -1, 21)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (208, 11, -1, 194)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (209, 39, -1, 118)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (210, 15, -1, 117)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (211, 7, -1, 206)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (212, 37, -1, 64)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (213, 38, -1, 145)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (214, 16, -1, 74)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (215, 24, -1, 57)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (216, 8, -1, 236)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (217, 24, -1, 18)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (218, 38, -1, 38)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (219, 23, -1, 63)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (220, 35, -1, 194)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (221, 37, -1, 256)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (222, 29, -1, 164)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (223, 19, -1, 234)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (224, 7, -1, 219)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (225, 10, -1, 181)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (226, 7, -1, 25)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (227, 17, -1, 117)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (228, 17, -1, 74)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (229, 8, -1, 156)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (230, 7, -1, 54)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (231, 34, -1, 103)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (232, 27, -1, 177)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (233, 17, -1, 233)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (234, 17, -1, 224)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (235, 17, -1, 97)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (236, 34, -1, 218)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (237, 19, -1, 243)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (238, 21, -1, 93)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (239, 29, -1, 193)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (240, 14, -1, 75)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (241, 25, -1, 222)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (242, 11, -1, 249)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (243, 25, -1, 241)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (244, 13, -1, 23)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (245, 29, -1, 31)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (246, 13, -1, 189)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (247, 17, -1, 255)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (248, 14, -1, 138)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (249, 37, -1, 19)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (250, 15, -1, 16)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (251, 10, -1, 243)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (252, 26, -1, 128)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (253, 16, -1, 17)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (254, 24, -1, 256)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (255, 24, -1, 177)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (256, 33, -1, 257)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (257, 38, -1, 253)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (258, 36, -1, 88)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (259, 10, 1, 66)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (260, 14, 1, 31)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (261, 34, 1, 189)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (262, 13, 1, 91)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (263, 21, 1, 29)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (264, 29, 1, 204)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (265, 19, 1, 154)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (266, 37, 1, 112)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (267, 33, 1, 223)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (268, 32, 1, 34)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (269, 1, 1, 189)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (270, 25, 1, 60)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (271, 15, 1, 221)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (272, 39, 1, 119)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (273, 14, 1, 182)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (274, 29, 1, 223)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (275, 37, 1, 93)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (276, 30, 1, 48)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (277, 36, 1, 214)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (278, 18, 1, 66)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (279, 25, 1, 67)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (280, 10, 1, 160)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (281, 27, 1, 164)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (282, 17, 1, 35)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (283, 38, 1, 10)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (284, 33, 1, 238)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (285, 7, 1, 205)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (286, 19, 1, 160)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (287, 38, 1, 54)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (288, 14, 1, 216)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (289, 19, 1, 256)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (290, 33, 1, 80)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (291, 22, 1, 39)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (292, 13, 1, 177)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (293, 34, 1, 179)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (294, 33, 1, 36)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (295, 27, 1, 248)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (296, 16, 1, 170)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (297, 35, 1, 90)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (298, 29, 1, 34)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (299, 7, 1, 146)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (300, 36, 1, 64)
GO
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (301, 8, 1, 81)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (302, 30, 1, 241)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (303, 12, 1, 145)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (304, 25, 1, 66)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (305, 26, 1, 134)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (306, 14, 1, 151)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (307, 38, 1, 103)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (308, 12, 1, 63)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (309, 13, 1, 54)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (310, 31, 1, 217)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (311, 33, 1, 80)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (312, 25, 1, 249)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (313, 11, 1, 141)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (314, 18, 1, 83)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (315, 29, 1, 250)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (316, 30, 1, 20)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (317, 7, 1, 136)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (318, 16, 1, 148)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (319, 15, 1, 48)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (320, 7, 1, 121)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (321, 29, 1, 12)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (322, 37, 1, 241)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (323, 29, 1, 213)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (324, 33, 1, 20)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (325, 22, 1, 158)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (326, 19, 1, 75)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (327, 24, 1, 87)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (328, 13, 1, 254)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (329, 1, 1, 238)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (330, 8, 1, 229)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (331, 14, 1, 79)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (332, 13, 1, 250)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (333, 35, 1, 36)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (334, 39, 1, 121)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (335, 34, 1, 160)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (336, 25, 1, 57)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (337, 11, 1, 219)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (338, 19, 1, 150)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (339, 29, 1, 68)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (340, 25, 1, 147)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (341, 38, 1, 48)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (342, 29, 1, 12)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (343, 35, 1, 56)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (344, 18, 1, 138)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (345, 26, 1, 81)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (346, 19, 1, 234)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (347, 39, 1, 66)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (348, 8, 1, 144)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (349, 35, 1, 201)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (350, 18, 1, 15)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (351, 14, 1, 27)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (352, 11, 1, 113)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (353, 30, 1, 176)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (354, 14, 1, 84)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (355, 38, 1, 137)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (356, 13, 1, 71)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (357, 23, 1, 197)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (358, 18, 1, 249)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (359, 39, 1, 34)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (360, 10, 1, 103)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (361, 39, 1, 30)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (362, 32, 1, 242)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (363, 38, 1, 214)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (364, 36, 1, 242)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (365, 24, 1, 116)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (366, 25, 1, 11)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (367, 15, 1, 152)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (368, 17, 1, 207)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (369, 34, 1, 235)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (370, 11, 1, 141)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (371, 30, 1, 130)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (372, 24, 1, 205)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (373, 21, 1, 229)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (374, 21, 1, 257)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (375, 34, 1, 85)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (376, 10, 1, 198)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (377, 22, 1, 174)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (378, 34, 1, 178)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (379, 11, 1, 141)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (380, 28, 1, 238)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (381, 28, 1, 113)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (382, 21, 1, 35)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (383, 34, 1, 30)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (384, 31, 1, 171)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (385, 12, 1, 48)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (386, 31, 1, 94)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (387, 16, 1, 243)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (388, 25, 1, 154)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (389, 31, 1, 51)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (390, 28, 1, 48)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (391, 11, 1, 245)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (392, 33, 1, 239)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (393, 1, 1, 244)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (394, 24, 1, 150)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (395, 19, 1, 39)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (396, 22, 1, 86)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (397, 31, 1, 225)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (398, 33, 1, 221)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (399, 17, 1, 69)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (400, 1, 1, 51)
GO
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (401, 21, 1, 162)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (402, 1, 1, 38)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (403, 38, 1, 199)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (404, 23, 1, 35)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (405, 31, 1, 109)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (406, 28, 1, 161)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (407, 18, 1, 96)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (408, 28, 1, 202)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (409, 19, 1, 19)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (410, 11, 1, 48)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (411, 17, 1, 185)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (412, 22, 1, 216)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (413, 14, 1, 217)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (414, 8, 1, 68)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (415, 26, 1, 176)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (416, 25, 1, 116)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (417, 21, 1, 14)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (418, 25, 1, 47)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (419, 7, 1, 138)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (420, 23, 1, 92)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (421, 15, 1, 257)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (422, 37, 1, 53)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (423, 7, 1, 75)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (424, 28, 1, 11)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (425, 32, 1, 214)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (426, 23, 1, 214)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (427, 14, 1, 120)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (428, 30, 1, 31)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (429, 21, 1, 34)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (430, 1, 1, 31)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (431, 35, 1, 216)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (432, 24, 1, 176)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (433, 16, 1, 178)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (434, 15, 1, 113)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (435, 28, 1, 27)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (436, 27, 1, 116)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (437, 38, 1, 235)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (438, 7, 1, 203)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (439, 34, 1, 112)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (440, 19, 1, 17)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (441, 13, 1, 81)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (442, 15, 1, 130)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (443, 10, 1, 189)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (444, 37, 1, 207)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (445, 24, 1, 256)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (446, 35, 1, 47)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (447, 13, 1, 93)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (448, 12, 1, 197)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (449, 11, 1, 10)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (450, 27, 1, 118)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (451, 28, 1, 64)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (452, 15, 1, 238)
INSERT [dbo].[Votes] ([Id], [UserId], [Value], [AnswerId]) VALUES (453, 32, 1, 218)
SET IDENTITY_INSERT [dbo].[Votes] OFF
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Questions] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Questions]
GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Users]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Categories]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Categories]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Users]
GO
ALTER TABLE [dbo].[QuestionsTags]  WITH CHECK ADD  CONSTRAINT [FK_QuestionsTags_Questions] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[QuestionsTags] CHECK CONSTRAINT [FK_QuestionsTags_Questions]
GO
ALTER TABLE [dbo].[QuestionsTags]  WITH CHECK ADD  CONSTRAINT [FK_QuestionsTags_Tags] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([Id])
GO
ALTER TABLE [dbo].[QuestionsTags] CHECK CONSTRAINT [FK_QuestionsTags_Tags]
GO
ALTER TABLE [dbo].[Votes]  WITH CHECK ADD  CONSTRAINT [FK_Votes_Answers] FOREIGN KEY([AnswerId])
REFERENCES [dbo].[Answers] ([Id])
GO
ALTER TABLE [dbo].[Votes] CHECK CONSTRAINT [FK_Votes_Answers]
GO
ALTER TABLE [dbo].[Votes]  WITH CHECK ADD  CONSTRAINT [FK_Votes_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Votes] CHECK CONSTRAINT [FK_Votes_Users]
GO
USE [master]
GO
ALTER DATABASE [Forum] SET  READ_WRITE 
GO
