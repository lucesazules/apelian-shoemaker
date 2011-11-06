$(document).ready ->
    $(".page_navigation > li").click -> document.location.href = $(this).children('a').attr('href')