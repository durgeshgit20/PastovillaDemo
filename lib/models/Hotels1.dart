var jsonString = """
 [
 {
    "id": "1",
    "hotel_name": "Honey Chilli Potatoes",
    "address": "Nismotek , Goregaon (E) , Mumbai 400063, India",
    "contact_number": 21345645648,
    "isOpen": true,
    "hotel_category": "Starters", 
    "price":"Rs 240",
    "rating":4.1,
    "timing": "9.30 am to 10.40 pm",
    "imgUrl": "https://b.zmtcdn.com/data/reviews_photos/43e/397d152aa1fbf7e19d34be31c7aee43e_1558970759.jpg?fit=around%7C800%3A600&crop=800%3A600%3B%2A%2C%2A",
    "comments": [
        {
            "userName": "John",
            "userProfilePic": "assets/images/FoodImage.png",
            "comment": "Lorem ipsum dolor sit amet consectetur",
            "rating":"4.2"
        },
        {
            "userName": "John",
            "userProfilePic": "assets/images/FoodImage.png",
            "comment": "Lorem ipsum dolor sit amet consectetur",
            "rating":"2.4"
        },
         {
            "userName": "John",
            "userProfilePic": "assets/images/FoodImage.png",
            "comment": "Lorem ipsum dolor sit amet consectetur",
            "rating":"4.2"
        },
        {
            "userName": "John",
            "userProfilePic": "assets/images/FoodImage.png",
            "comment": "Lorem ipsum dolor sit amet consectetur",
            "rating":"2.4"
        },
         {
            "userName": "John",
            "userProfilePic": "assets/images/FoodImage.png",
            "comment": "Lorem ipsum dolor sit amet consectetur",
            "rating":"4.2"
        },
        {
            "userName": "John",
            "userProfilePic": "assets/images/FoodImage.png",
            "comment": "Lorem ipsum dolor sit amet consectetur",
            "rating":"2.4"
        },
         {
            "userName": "John",
            "userProfilePic": "assets/images/FoodImage.png",
            "comment": "Lorem ipsum dolor sit amet consectetur",
            "rating":"4.2"
        },
        {
            "userName": "John",
            "userProfilePic": "assets/images/FoodImage.png",
            "comment": "Lorem ipsum dolor sit amet consectetur",
            "rating":"2.4"
        },
         {
            "userName": "John",
            "userProfilePic": "assets/images/FoodImage.png",
            "comment": "Lorem ipsum dolor sit amet consectetur",
            "rating":"4.2"
        },
        {
            "userName": "John",
            "userProfilePic": "assets/images/FoodImage.png",
            "comment": "Lorem ipsum dolor sit amet consectetur",
            "rating":"2.4"
        }
    ],
    "menu_and_photos": [
        "assets/images/FoodImage.png",
        "assets/images/FoodImage.png",
        "assets/images/FoodImage.png",
        "assets/images/FoodImage.png",
        "assets/images/FoodImage.png",
        "assets/images/FoodImage.png"
    ]
},
  {
    "id": "2",
    "hotel_name": "PavBhaji Fondue",
    "address": "Nismotek , Goregaon (E) , Mumbai 400063,US",
    "contact_number": 21345645648,
    "isOpen": false,
    "hotel_category": "Starters",
    "price": "Rs 200",
    "rating":4.4,
    "timing": "9.30 am to 10.40 pm",
    "imgUrl":"https://grazia.wwmindia.com/content/2016/oct/pav-bhaji-fondue_gallery_large_1489136193.jpg",
     "menu_and_photos":[
      "assets/images/FoodImage.png",
      "assets/images/FoodImage.png",
      "assets/images/FoodImage.png"
    ]
  },
  {
    "id": "3",
    "hotel_name": "Mexican Wraps",
    "address": "Nismotek , Goregaon (E) , Mumbai 400063, India",
    "contact_number": 21345645648,
    "isOpen": true,
    "hotel_category": "Italian",
    "price":"Rs 200",
    "rating":3.9,
    "timing": "9.30 am to 10.40 pm",
    "imgUrl":"https://southmelbournemarket.com.au/wp-content/uploads/2018/12/MexicanBurrito-1-652x368.jpg",
     "menu_and_photos":[
      "assets/images/FoodImage.png",
      "assets/images/FoodImage.png",
      "assets/images/FoodImage.png"
    ]
  },
  {
    "id": "4",
    "hotel_name": "Richie Rich",
    "address": "Nismotek , Goregaon (E) , Mumbai 400063, India",
    "contact_number": 21345645648,
    "isOpen": true,
    "hotel_category": "Italian",
   "price":"Rs 300",
    "rating":4.1,
    "timing": "9.30 am to 10.40 pm",
    "imgUrl":"https://www.pastovilla.com/wp-content/uploads/2012/11/Richie-Rich.jpg",
    "menu_and_photos":[
      "assets/images/FoodImage.png",
      "assets/images/FoodImage.png",
      "assets/images/FoodImage.png"
    ]
  },
  {
    "id": "5",
    "hotel_name": "Penne Pesto Genovese",
    "address": "Nismotek , Goregaon (E) , Mumbai 400063, India",
    "contact_number": 21345645648,
    "isOpen": true,
    "hotel_category": "Italian",
    "price":"Rs 250",
    "rating":4.0,
    "timing": "9.30 am to 10.40 pm",
    "imgUrl": "https://b.zmtcdn.com/data/reviews_photos/7dd/efdbb5082ca52135242752e46c5947dd_1559152033.jpg?fit=around%7C800%3A775&crop=800%3A775%3B%2A%2C%2A",
    "menu_and_photos": [
        "assets/images/FoodImage.png",
        "assets/images/FoodImage.png",
        "assets/images/FoodImage.png"
    ]
}
]""";

var jsonCategory = """
[
{
  "id":"1",
  "category_name":"BreakFast",
  "imgUrl":"https://freedesignfile.com/upload/2017/03/Rich-and-nutritious-breakfast-with-HD-picture-07.jpg"
},
{
  "id":"2",
  "category_name":"Fries",
  "imgUrl":"https://b.zmtcdn.com/data/reviews_photos/6a1/44c03a87da3f2db6fca5dec1a36e76a1_1564760844.jpg?fit=around%7C800%3A600&crop=800%3A600%3B%2A%2C%2A"
},{
  "id":"3",
  "category_name":"Wrap",
  "imgUrl":"https://b.zmtcdn.com/data/pictures/chains/3/18527783/6d599f9ba1cddadea49d6abdc831a4a1.jpg?fit=around%7C800%3A534&crop=800%3A534%3B%2A%2C%2A"
},{
  "id":"4",
  "category_name":" Sandwich",
  "imgUrl":"https://b.zmtcdn.com/data/reviews_photos/a3f/fbd6fc39652109bc7c6a277cfbb41a3f_1554056942.jpg?fit=around%7C800%3A1067&crop=800%3A1067%3B%2A%2C%2A"
},{
  "id":"5",
  "category_name":"Soups",
  "imgUrl":"https://b.zmtcdn.com/data/pictures/chains/3/18527783/7891b5ff1437399d3c34b7214799bf3e.jpg?fit=around%7C800%3A534&crop=800%3A534%3B%2A%2C%2A"
},
{
  "id":"6",
  "category_name":"Salads",
  "imgUrl":"https://b.zmtcdn.com/data/reviews_photos/1ca/36c0fb1eb7cd0c3d82bc0c985745b1ca_1562620587.jpg?fit=around%7C756%3A1008&crop=756%3A1008%3B%2A%2C%2A"
},
{
  "id":"7",
  "category_name":"Starters",
  "imgUrl":"https://b.zmtcdn.com/data/pictures/chains/3/18527783/2ba54222dbc9ca8de4afb6431d6541be.jpg?fit=around%7C800%3A534&crop=800%3A534%3B%2A%2C%2A"
},{
  "id":"8",
  "category_name":"Pizza",
  "imgUrl":"https://b.zmtcdn.com/data/pictures/chains/3/18527783/d7a2f84f8b466f971d96f9c170283d69.jpg?fit=around%7C800%3A587&crop=800%3A587%3B%2A%2C%2A"
},
{
  "id":"9",
  "category_name":"Pasta",
  "imgUrl":"https://b.zmtcdn.com/data/reviews_photos/01b/99beca0fdc6881e592d057504a2fb01b_1554056941.jpg?fit=around%7C800%3A1067&crop=800%3A1067%3B%2A%2C%2A"
},
{
  "id":"10",
  "category_name":"Main Course Oriental",
  "imgUrl":"https://b.zmtcdn.com/data/pictures/chains/3/18527783/44fe40aac64b0265aea54446fd3f1b7d.jpg?fit=around%7C800%3A1198&crop=800%3A1198%3B%2A%2C%2A"
},
{
  "id":"11",
  "category_name":"Main Course Indian",
  "imgUrl":"https://b.zmtcdn.com/data/pictures/1/19154011/363360a7f1308dd5acbbaabede0a8770_featured_v2.jpg"
}

]""";

var jsonFavourite = """
 [
 {
    "id": "1",
    "hotel_name": "Honey Chilli Potatoes",
    "address": "Nismotek , Goregaon (E) , Mumbai 400063, India",
    "contact_number": 21345645648,
    "isOpen": true,
    "hotel_category": "Starters",
    "price":"Rs 240",
    "rating":4.1,
    "timing": "9.30 am to 10.40 pm",
    "imgUrl": "https://b.zmtcdn.com/data/reviews_photos/43e/397d152aa1fbf7e19d34be31c7aee43e_1558970759.jpg?fit=around%7C800%3A600&crop=800%3A600%3B%2A%2C%2A",
    "comments": [
        {
            "userName": "John",
            "userProfilePic": "assets/images/FoodImage.png",
            "comment": "Lorem ipsum dolor sit amet consectetur",
            "rating":"4.2"
        },
        {
            "userName": "John",
            "userProfilePic": "assets/images/FoodImage.png",
            "comment": "Lorem ipsum dolor sit amet consectetur",
            "rating":"2.4"
        },
         {
            "userName": "John",
            "userProfilePic": "assets/images/FoodImage.png",
            "comment": "Lorem ipsum dolor sit amet consectetur",
            "rating":"4.2"
        },
        {
            "userName": "John",
            "userProfilePic": "assets/images/FoodImage.png",
            "comment": "Lorem ipsum dolor sit amet consectetur",
            "rating":"2.4"
        },
         {
            "userName": "John",
            "userProfilePic": "assets/images/FoodImage.png",
            "comment": "Lorem ipsum dolor sit amet consectetur",
            "rating":"4.2"
        },
        {
            "userName": "John",
            "userProfilePic": "assets/images/FoodImage.png",
            "comment": "Lorem ipsum dolor sit amet consectetur",
            "rating":"2.4"
        },
         {
            "userName": "John",
            "userProfilePic": "assets/images/FoodImage.png",
            "comment": "Lorem ipsum dolor sit amet consectetur",
            "rating":"4.2"
        },
        {
            "userName": "John",
            "userProfilePic": "assets/images/FoodImage.png",
            "comment": "Lorem ipsum dolor sit amet consectetur",
            "rating":"2.4"
        },
         {
            "userName": "John",
            "userProfilePic": "assets/images/FoodImage.png",
            "comment": "Lorem ipsum dolor sit amet consectetur",
            "rating":"4.2"
        },
        {
            "userName": "John",
            "userProfilePic": "assets/images/FoodImage.png",
            "comment": "Lorem ipsum dolor sit amet consectetur",
            "rating":"2.4"
        }
    ],
    "menu_and_photos": [
        "assets/images/FoodImage.png",
        "assets/images/FoodImage.png",
        "assets/images/FoodImage.png",
        "assets/images/FoodImage.png",
        "assets/images/FoodImage.png",
        "assets/images/FoodImage.png"
    ]
},
  {
    "id": "2",
    "hotel_name": "PavBhaji Fondue",
    "address": "Nismotek , Goregaon (E) , Mumbai 400063,US",
    "contact_number": 21345645648,
    "isOpen": false,
    "hotel_category": "Starters",
    "price": "Rs 200",
    "rating":4.4,
    "timing": "9.30 am to 10.40 pm",
    "imgUrl":"https://grazia.wwmindia.com/content/2016/oct/pav-bhaji-fondue_gallery_large_1489136193.jpg",
     "menu_and_photos":[
      "assets/images/FoodImage.png",
      "assets/images/FoodImage.png",
      "assets/images/FoodImage.png"
    ]
  },
  {
    "id": "3",
    "hotel_name": "Mexican Wraps",
    "address": "Nismotek , Goregaon (E) , Mumbai 400063, India",
    "contact_number": 21345645648,
    "isOpen": true,
    "hotel_category": "Italian",
    "price":"Rs 200",
    "rating":3.9,
    "timing": "9.30 am to 10.40 pm",
    "imgUrl":"https://southmelbournemarket.com.au/wp-content/uploads/2018/12/MexicanBurrito-1-652x368.jpg",
     "menu_and_photos":[
      "assets/images/FoodImage.png",
      "assets/images/FoodImage.png",
      "assets/images/FoodImage.png"
    ]
  }
]""";
