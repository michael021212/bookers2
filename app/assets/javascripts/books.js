// document.addEventListener('turbolinks:load', function () {
//   document.querySelectorAll('.delete').forEach(fanction(a) {
//     a.addEventListener('ajax:success', function () {
//       var div = a.parentNode;
//       var td = div.parentNode;
//       td.style.display = 'none';
//     })
//   })
// })


// document.querySelector("#book-<%= book.id %>")


// document.addEventListener('turbolinks:load', function (){
//   document.querySelectorAll('.delete').forEach(function (a) {
//     a.addEventListener('ajax:success', function () {
//       var div = a.parentNode;
//       var td = div.parentNode;
//       td.style.display = 'none';
//     })
//   })
// })



// $(function () {
//   $('.delete').on('click', function () {
//     $("#book-<%= book.id %>").html('<%= escape_javascript(render("/book", book: @books )) %>');
//   });
// });




// document.getElementById("delete").onclick = function() {
//   var element = document.getElementsByClassName( "fa-heart" ) ;
//   element.classList.remove( "fas" );
//   element.classList.add( "far" );

//   // book.favorites.count　にプラス１する
// };

// document.getElementById("post").onclick = function() {
//   fas fa-heartをfar fa-heartにする
//   book.favorites.count　にプラス１する
// };