define(['ckeditor', 'jquery'], function() {
    $(function() {
        if(g_plaintext_mode) {
            CKEDITOR.replace('ckeditor', {
                extraPlugins:'pastetext',
                forcePasteAsPlainText:true
            });
        } else {
            CKEDITOR.replace('ckeditor', {
            });
        }

        $('#ckeditor-container pre').click(function() {
            var str = $(this).html().trim();
            CKEDITOR.instances.ckeditor.insertHtml(str);
        });  

    });

});
