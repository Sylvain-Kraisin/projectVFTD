$(document).ready(function () {
  $('img').on('click', function () {
    var image = $(this).attr('src');

    $('#imagepreview').attr('src', image); // here asign the image to the modal when the user click the enlarge link
    $('#imagemodal').modal('show'); // imagemodal is the id attribute assigned to the bootstrap modal, then i use the show function
  });
});
