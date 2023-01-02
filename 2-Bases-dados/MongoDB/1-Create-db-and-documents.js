// MongoDB does not need to have a created database.
// We can just use it and Mongo will automatically 
// create it when needed.
use bookstore;


// This will create the COLLECTION book and add a
// DOCUMENT into it
db.books.insertOne({
    "title" : "I, Robot",
    "author" : "Isaac Asimov",
    "rating" : 9.5,
    "pages" : 450,
    "genres" : ["science","fiction"],
    "InStock" : true
})

// As you can see, we can have strings, integers,
// floats, booleans and arrays. But we can also include
// dates, timestamps, etc


// The same way we can add several documents at one
// with insertMany

db.books.insertMany([
    {
        "title" : "Dune",
        "author" : "Fran Hebert",
        "rating" : 8.5,
        "pages" : 600,
        "genres" : ["science","fiction"],
        "InStock" : true
    },
    {
        "title" : "The Old Man and the Sea",
        "author" : "Ernest Hemingway",
        "rating" : 9.0,
        "pages" : 150,
        "genres" : ["contemplative"],
        "InStock" : false
        },
])