# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
    $(".select_shoe").live "change", ()->
        i = $(this).attr('id').match(/(\d+)/)[1]
        $t = $(this)
        $color_select = $("#order_order_details_attributes_"+i+"_color_id")
        $size_select = $("#order_order_details_attributes_"+i+"_size_ids_")
        $.getJSON "/shoes/"+$(this).val()+".json", (data)->
            color_options = '<option value=""></option>'
            size_options = '<option value=""></option>'
            color_options += "<option value='"+color.id+"'>"+color.name+"</option>" for color in data.colors
            size_options  += "<option value='"+size.id+"'>"+size.number+"</option>" for size in data.sizes
            $color_select.html(color_options)
            $size_select.html(size_options)

