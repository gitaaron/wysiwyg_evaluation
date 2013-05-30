define(['ckeditor', 'jquery'], function() {
    $(function() {
        CKEDITOR.replace('ckeditor');

        $('#ckeditor-container pre').click(function() {
            var str = $(this).html().trim();
            CKEDITOR.instances.ckeditor.insertText(str);
        });  

    });

});
