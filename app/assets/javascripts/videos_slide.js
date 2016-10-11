$(document).ready(function(){
  $(".owl-carousel").owlCarousel({
    loop:true,
    // autoplay:true,
    items:1
  });

  owl = $('.owl-carousel').owlCarousel();

  $(".select_button_bis").click(function () {
  owl.trigger('next.owl.carousel');
  });

});
