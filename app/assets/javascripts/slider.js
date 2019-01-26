$(function() {
    const PREFIX = '/assets/slider/';
    let slides = ['slide1.jpg', 'slide2.jpg', 'slide3.jpg', 'slide4.jpg'];
    let currentSlide = 0;
    let startSlider = setInterval(moveRight, 2000);

    $('#slide-right').on('click', moveRight);
    $('#slide-left').on('click', moveLeft);
    $('body').on('keydown', keyMove);
    $('#slider').on('mouseover', function () {
        clearInterval(startSlider);
    });
    $('#slider').on('mouseleave', function () {
        startSlider = setInterval(moveRight, 2000);
    });

    function moveRight(event) {
        if (event) event.preventDefault();
        currentSlide = ++currentSlide % slides.length;
        $('#slide').attr('src', `${PREFIX}${slides[currentSlide]}`);
    }

    function moveLeft(event) {
        if (event) event.preventDefault();
        if (!currentSlide) {
            currentSlide = 4;
            currentSlide = --currentSlide % slides.length;
        }
        else {
            currentSlide = --currentSlide % slides.length;
        }
        $('#slide').attr('src', `${PREFIX}${slides[currentSlide]}`);
    }

    function keyMove(event) {
        if (event.keyCode === 37) {
            moveLeft(event);
        }
        else if (event.keyCode === 39) {
            moveRight(event);
        }
    }
});