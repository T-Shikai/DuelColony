// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .


// チャットルームの名前表示
$(function(){
  $('[data-toggle="tooltip"]').hover(
    function(){
      $(this).tooltip('show');
    },
    function(){
      $(this).tooltip('hide');
    }
  );
});

// 通知
$(function(){
  $('.toast').toast('show');
});

// マイページ
$(function(){
  var $nav = $('.my-nav-item');
  var $content = $('.my-content');
  // 初期状態
  $content.eq(0).show();
  // クリックするとmy-contentを表示し、ボタンの色を変更
  $nav.each(function(i,elm){
    $(elm).click(function(){
      $content.hide();
      $content.eq(i).show();
      if($nav.hasClass('btn-light')){
        $nav.removeClass('btn-light').addClass('btn-outline-light');
      };
      $(this).removeClass('btn-outline-light').addClass('btn-light');
      });
  });
});