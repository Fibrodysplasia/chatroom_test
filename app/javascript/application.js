// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
require('channels')
import "./channels"

window.scroll_to_bottom = function() {
    if ($('#messages').length > 0) {
        $('#messages').scrollTop($('#messages')[0].scrollHeight);
    }
};

$(document).on('turbolinks:load', function() {
    $('.ui.dropdown').dropdown();
    $('.message .close').on('click', function() {
        $(this).closest('.message').transition('fade');
    });
    scroll_to_bottom();
})