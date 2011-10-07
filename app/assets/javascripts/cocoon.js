$(document).ready(function() {

  function replace_in_content(content, regexp_str, with_str) {
    reg_exp = new RegExp(regexp_str);
    content.replace(reg_exp, with_str);
  }

  $('.add_fields').live('click', function(e) {
    e.preventDefault();
    var assoc   = $(this).attr('data-association'),
        assocs  = $(this).attr('data-associations'),
        content = $(this).attr('data-template'),
        insertionPosition = $(this).attr('data-association-insertion-position'),
        insertionNode = $(this).attr('data-association-insertion-node'),
        insertionCallback = $(this).attr('data-insertion-callback'),
        regexp_braced = new RegExp('\\[new_' + assoc + '\\]', 'g'),
        regexp_underscord = new RegExp('_new_' + assoc + '_', 'g'),
        new_id  = new Date().getTime(),
        newcontent_braced = '[' + new_id + ']',
        newcontent_underscord = '_' + new_id + '_',
        new_content = content.replace(regexp_braced, '[' + new_id + ']');

    if (new_content == content) {
        regexp_braced = new RegExp('\\[new_' + assocs + '\\]', 'g');
        regexp_underscord = new RegExp('_new_' + assocs + '_', 'g');
        new_content = content.replace(regexp_braced, '[' + new_id + ']');
    }

    new_content = new_content.replace(regexp_underscord, newcontent_underscord);

    if (insertionNode){
      insertionNode = insertionNode == "this" ? $(this) : $(insertionNode);
    } else {
      insertionNode = $(this).parent();
    }

    var contentNode = $(new_content);

    if (insertionPosition == 'after'){
      insertionNode.after(contentNode);
    } else {
      insertionNode.before(contentNode);
    }
    
    if (insertionCallback){
      insertionCallback.call(contentNode);
    }
  });

  $('.remove_fields.dynamic').live('click', function(e) {
    e.preventDefault();
    $(this).closest(".nested-fields").remove();
  });

  $('.remove_fields.existing').live('click', function(e) {
    e.preventDefault();
    $(this).prev("input[type=hidden]").val("1");
    $(this).closest(".nested-fields").hide();
  });

});