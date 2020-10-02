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

document.addEventListener("turbolinks:load", () => {
  $(function () {
    $('.js-food_field').on('keyup', function() {
      var food = $.trim($(this).val())
      console.log(food)
    });

    $.ajax({
      type: 'GET', // リクエストのタイプ
      url: '/recipes/searches', // リクエストを送信するURL
      data:  { food: food }, // サーバーに送信するデータ。{キー: バリュー }としてパラメーターで送られる。今回のバリューはvar foodの事
      dataType: 'json' // サーバーから返却される型
    });



});
// 基本形
// $(function ( ) {  });