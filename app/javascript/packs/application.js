// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
require("bootstrap/dist/js/bootstrap")
require("@fortawesome/fontawesome-free/js/all")
require("@nathanvda/cocoon")
require("./flexselect")

document.addEventListener("turbolinks:load", () => {
  $("select.flexselect").flexselect();

  $('#food_recipes').on('cocoon:after-insert', function(e, insertedItem, originalEvent) {
    $("select.flexselect").flexselect();
  });

  document.querySelectorAll("input[type='submit']").forEach((input) => {
    input.addEventListener("click", (ev) => {
      let isValid = false
      input.closest('form').querySelectorAll(".valid-field").forEach((e) => {
        if (e.value === "") {
          e.classList.add("is-invalid")
          isValid = true
        } else {
          e.classList.remove("is-invalid")
        } 
      })  
      if(isValid) {
        ev.stopPropagation();
        ev.preventDefault();
      }
    })
  })
});

// 今クエリでinput[type='submit']を全取得してinputに１つずつ格納。それがクリックされたらevが動く
// input[type='submit']から取り出したinputは
// document.querySelectorAll("input[type='submit']").forEach((input) => {
//   input.addEventListener("click", (ev) => {
//     let isValid = false

//     document.querySelectorAll(".valid-field").forEach((e) => {
//       if (e.value === "") {
//         e.classList.add("is-invalid")
//         isValid = true
//       } else {
//         e.classList.remove("is-invalid")
//       } 
//     })  
//     if(isValid) {
//       ev.stopPropagation();
//       ev.preventDefault();
//     }
//   })
// })
