//= require rails-ujs
//= require activestorage
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require slider
//= require es6
//= require galaxy_vacansies
//= require cable

$(function(){
    $('#dom').on('click', function (e) {
        e.preventDefault();
        console.log('event');
    })
});