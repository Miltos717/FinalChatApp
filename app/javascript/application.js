// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

$(document).on("turbo:load",function() {
    $('.ui.dropdown').dropdown();

    // this code is for exit the flash messages
    $('.message .close')
        .on('click', function() {
            $(this)
                .closest('.message')
                .transition('fade');
        });

    // Scroll to the bottom of the form on page reload
    var form = document.getElementById('messages');
    form.scrollTop = form.scrollHeight;

    // Rails 7 has code for submitting form with enter and
    // we dont have to wite code for this.
    //the code below is for, when we enter it clears the text field
    $('#message_body').on('keydown', function(event) {
        if (event.keyCode === 13) { // 13 is the keycode for the enter key
            $('button').click();
            event.target.value = '';
        }
    });
})
import "channels"
