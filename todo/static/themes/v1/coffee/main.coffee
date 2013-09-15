jQuery ->

    "use strict"
    $ = jQuery

    class HomePage
        tasks_actions: () ->
            @tasks = $('.tasks ul li')
            @tasks.unbind 'click'
            @tasks.on 'click', (event) ->
                $.ajax
                    url: $(this).attr('data-toggle-url')
                    success: (data) =>
                        console.log data
                    error: (data) =>
                        console.log data

        textarea_submit: () ->
            @textarea_task.on 'keyup', (event) ->
                event.preventDefault()

                if event.keyCode == 13
                    $(this).attr('disabled')
                    $(this).val($(this).val().replace("\n", ""))
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

        constructor: () ->
            @reduce_button = $('.js-reduce-aside.right')
            @show_button = $('.js-reduce-aside.left')
            @aside = $('aside')
            @textarea_task = $("#new_task")
            @todo = $('.todo')

            @aside_reduce()
            @textarea_submit()
            @tasks_actions()

    class SocketClient
        add_task: (data) ->
            message = {
                action: "add_task"
                task: data
                todo: @home_manager.todo.attr('data-todo-id')
            }
            @socket.send(message)

        connected: () =>
            @socket.subscribe(@home_manager.todo.attr('id'))

        disconnected: () =>
            console.log "disconnected"

        messaged: (data) =>
            switch data.action
                when "new_task"
                    $('.tasks ul').append('<label for="task_' + data.task_id + '">
                                               <li data-toggle-url="toggle/' + data.task_id + '">
                                                   <input id="task_' + data.task_id + '" type="checkbox">
                                                   <p>' + data.task + '</p>
                                                   <a href="delete/' + data.task_id + '">
                                                       <span class="glyphicon glyphicon-trash"></span>
                                                   </a>
                                               </li>
                                            </label>')
                    @home_manager.tasks_actions()
        constructor: (@home_manager) ->
            @socket = new io.Socket()
            @socket.connect()
            @socket.on('connect', @connected)
            @socket.on('disconnect', @disconnected);
            @socket.on('message', @messaged);

            $('#task_form').on 'submit', (event) =>
                @add_task(@home_manager.textarea_task.val())

                @home_manager.textarea_task.val('').focus()
                return false

    homepage = new HomePage
    socket_client = new SocketClient(homepage)