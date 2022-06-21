$(function () {
  function readURL(input) {
      if (input.files) {
          var reader = new FileReader();
          reader.onload = function (e) {
              $("#preview_img").attr("src", e.target.result);
          };
          reader.readAsDataURL(input.files[0]);
      }
  }
  $("#board.board_image").change(function () {
      readURL(this);
  });
});