jQuery ->

    "use strict"
    $ = jQuery

    class HomePage
        constructor: () ->
            @reduce_button = $('.js-reduce-aside.right')
            @show_button = $('.js-reduce-aside.left')
            @aside = $('aside')
            @textarea_task = $("#new_task")
            @tasks = $('ul li')

            @tasks.on 'click', (event) ->
                window.location.href = $(this).attr('data-toggle-url')

            @aside_reduce()
            @textarea_submit()

        textarea_submit: () ->
            @textarea_task.on 'keyup', (event) ->
                event.preventDefault()

                if event.keyCode == 13
                    $(this).parents('form').submit()

        aside_reduce: () ->
            $('.js-reduce-aside').on 'click', (event) =>
                event.preventDefault()

                if @aside.hasClass('outside')
                    @aside.removeClass('outside')
                    @aside.animate
                        right: "0px"
                    , 500, () ->
                else
                    @aside.addClass('outside')
                    @aside.animate
                        right: "-300px"
                    , 500, () ->


    homepage = new HomePage