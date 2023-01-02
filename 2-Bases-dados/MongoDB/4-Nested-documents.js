use bookstore

// The interesting thing about MongoDB
// is that we can have a document within
// a document. In our example, imagine that
// we had a bunch of reviewa for each book

db.reviewedbooks.insertOne({
    title : "I, Robot",
    author : "Isaac Asimov",
    rating : 9.5,
    pages : 450,
    genres : ["science","fiction"],
    InStock : true,
    reviews : [
        {
            name : "Edgar",
            header: "Great book!!",
            body : "It was so good I read it in a weekend."
        },
        {
            name : "Rachel",
            header: "Well-balanced book",
            body : "Particularly enjoyable given its rythm."
        },
    ]
})


db.reviewedbooks.insertMany([{
    title : "The Adventures of Sherlock Holmes",
    author : "Arthur Conan Doyle",
    rating : 9.3,
    pages : 60,
    genres : ["science","adventure","detective"],
    InStock : true,
    reviews : [
        {
            name : "Edgar",
            header: "Decent",
            body : "Not the best of the Sherlock's stories."
        },
        {
            name : "Harry",
            header: "Not my cup of tea",
            body : "It is an all-time classic, but hard to read nowadays."
        },
        {
            name : "Mike",
            header: "Masterpiece",
            body : "Simply amazing."
        }
    ]
},
{
    title : "Twilight",
    author : " Stephenie Meyer",
    rating : 6.3,
    pages : 400,
    genres : ["fantasy","romance"],
    InStock : false,
    reviews : [
        {
            name : "Rachel",
            header: "Painful",
            body : "I have seen more interesting stories on Reddit."
        }
    ]
}])




// Now, the question arises, how can we find
// all the reviews by, say, Rachel? 
// NOTICE THE QUOTATIONS!

db.reviewedbooks.find({"reviews.name" : "Rachel" })