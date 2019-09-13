$(function () {
  $('.new_user').click(function () {
    sessionStorage.removeItem("password");
    alert('クリックした');
  });
});