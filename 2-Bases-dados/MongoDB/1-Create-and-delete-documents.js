// MongoDB does not need to have a created database.
// We can just use it and Mongo will automatically 
// create it when needed.
use bookstore;


// This will create the COLLECTION book and add a
// DOCUMENT into it
db.books.insertOne({
    title : "I, Robot",
    author : "Isaac Asimov",
    rating : 9.5,
    pages : 450,
    genres : ["science","fiction"],
    InStock : true
})

// As you can see, we can have strings, integers,
// floats, booleans and arrays. But we can also include
// dates, timestamps, etc


// The same way we can add several documents at one
// with insertMany

db.books.insertMany([
    {
        title : "Dune",
        author : "Fran Hebert",
        rating : 8.5,
        pages : 600,
        genres : ["science","fiction","fantasy","adventure"],
        InStock : true
    },
    {
        title : "The Old Man and the Sea",
        author : "Ernest Hemingway",
        rating : 9.0,
        pages : 150,
        genres : ["contemplative"],
        InStock : false
    },
    {
        title : "El Quijote",
        author : "Miguel de Cervantes",
        rating : 10.0,
        pages : 700,
        genres : ["adventure", "travel"],
        InStock : false
    },
    {
        title : "Harry Potter and the Philosopher's Stone",
        author : "J. K. Rowling",
        rating : 8.0,
        pages : 240,
        genres : ["adventure", "fantasy"],
        InStock : true
    },
    {
        title : "Harry Potter and the Chamber of Secrets",
        author : "J. K. Rowling",
        rating : 8.5,
        pages : 300,
        genres : ["adventure", "fantasy"],
        InStock : true
    },
    {
        title : "Harry Potter and the Prisoner of Azkaban",
        author : "J. K. Rowling",
        rating : 9.5,
        pages : 350,
        genres : ["adventure", "fantasy"],
        InStock : false
    },
    {
        title : "Harry Potter and the Goblet of Fire",
        author : "J. K. Rowling",
        rating : 10.0,
        pages : 750,
        genres : ["adventure", "fantasy"],
        InStock : true
    },
    {
        title : "Harry Potter and the Order of the Phoenix",
        author : "J. K. Rowling",
        rating : 7.0,
        pages : 800,
        genres : ["adventure", "fantasy"],
        InStock : true
    },
    {
        title : "Harry Potter and the Half-Blood Prince",
        author : "J. K. Rowling",
        rating : 10.0,
        pages : 430,
        genres : ["adventure", "fantasy"],
        InStock : true
    },
    {
        title : "Harry Potter and the Deathly Hallows",
        author : "J. K. Rowling",
        rating : 10.0,
        pages : 560,
        genres : ["adventure", "fantasy"],
        InStock : true
    },
    {
        title : "Ulysses",
        author : "James Joyce",
        rating : 7.5,
        pages : 350,
        genres : ["novel", "adventure"],
        InStock : false
    },
])


// The same way we can delete documents
// The safest way is to use the unique id
// that represents the object


db.books.deleteOne({_id: ObjectId("......")})


// But if we wanted to delete all books from 
// one author or that are not in stock, we could use


db.books.deleteMany({InStock: false})


// Identically, we could update one or many objects

db.books.updateOne({_id: ObjectId(".......")},{$set: {rating: 8}})

db.books.updateMany({author: "J. K. Rowling"},{$set: {author: "Joanne Rowling"}})

// There are other operators like 
//  - $inc : {parameter: value} ---> which increments
//    quantity associated to parameter by quantity
//  - $pull/push : {array: element}  ---> removes/adds 
//    certain element to an array
