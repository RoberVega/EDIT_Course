

use bookstore;


// We can find elements in our documents by
// using the command find. For example,
// if we want to find all J. K. Rowling books.
db.books.find(
    {
        author : "J. K. Rowling"
    }
)

// We can also impose extra constrains

db.books.find(
    {
        author : "J. K. Rowling",
        rating : 10
    }
)

// Imagine we only cared about the titles and 
// not all the other parameters, we can also do this with

db.books.find(
    {
        author : "J. K. Rowling"
    },
    {
        title : 1,
        author: 1
    }
)


// Advanced finding: 

// What if I wanted to find only excellent books
// say with rating 9 or above

db.books.find({
    rating : {$gt: 9}
})

db.books.find({
    rating : {$lt: 9}
})

db.books.find({
    rating : {$gte: 9}
})

// If we wanted to ask for excellent books or
// those with our preferred author Fran Hebert

db.books.find({
    $or : [
        {
            rating : {$gte: 9}
        },
        {
            author: "Fran Hebert"
        }
    ]
})

// The same thing we can do with $in or $nin if 
// we wanted to pass an array of options

db.books.find({author : {$in: ["Fran Hebert", "Ernest Hemingway"]}})


// Whenever we want to find the instances with a  
// specific value in an array, we can use

db.books.find({genres : "adventure"})

// While, if we want to fit the whole array

db.books.find({genres : ["adventure","fantasy"]})

// What if we want to find the ones that have
// these and also alow extra ones? 

db.books.find({genres : {$all : ["adventure","fantasy"]}})