use bookstore;

// Some queries are obtained via combination,
// for example, if I wanted to count how many
// books we have, I could use

db.books.find().count()

// If I wanted to count how many J. K. Rowling
// books I have available, I can filter first

db.books.find({
    author : "J. K. Rowling",
    InStock : true
}).count()


// Another example is if I would like to sort them
// alphabetically
db.books.find({
    author : "J. K. Rowling",
    InStock : true
}).sort({
    title : 1 
})

// or in descending order in rating

db.books.find({
    author : "J. K. Rowling",
    InStock : true
}).sort({
    rating : -1 
})