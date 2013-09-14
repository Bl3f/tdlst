// Generated by CoffeeScript 1.6.3
(function() {
  jQuery(function() {
    "use strict";
    var $, HomePage, homepage;
    $ = jQuery;
    HomePage = (function() {
      function HomePage() {
        this.reduce_button = $('.js-reduce-aside.right');
        this.show_button = $('.js-reduce-aside.left');
        this.aside = $('aside');
        this.textarea_task = $("#new_task");
        this.tasks = $('ul li');
        this.tasks.on('click', function(event) {
          return window.location.href = $(this).attr('data-toggle-url');
        });
        this.aside_reduce();
        this.textarea_submit();
      }

      HomePage.prototype.textarea_submit = function() {
        return this.textarea_task.on('keyup', function(event) {
          event.preventDefault();
          if (event.keyCode === 13) {
            return $(this).parents('form').submit();
          }
        });
      };

      HomePage.prototype.aside_reduce = function() {
        var _this = this;
        return $('.js-reduce-aside').on('click', function(event) {
          event.preventDefault();
          if (_this.aside.hasClass('outside')) {
            _this.aside.removeClass('outside');
            return _this.aside.animate({
              right: "0px"
            }, 500, function() {});
          } else {
            _this.aside.addClass('outside');
            return _this.aside.animate({
              right: "-300px"
            }, 500, function() {});
          }
        });
      };

      return HomePage;

    })();
    return homepage = new HomePage;
  });

}).call(this);
