define(['tinymce_jquery'], function() {
    $(function() {
        $('.tinyMCE-test').tinymce({
            script_url:'lib/tinymce/tinymce.js',
            selector: "textarea",
            plugins: ["textcolor code paste"],	
            toolbar: "fontsizeselect | forecolor | bold italic underline | alignleft aligncenter alignright",
            width: 600,
            menubar: "false",
            paste_auto_cleanup_on_paste : true,
            paste_remove_styles: true,
            paste_remove_styles_if_webkit: true,
            paste_strip_class_attributes: true,
            paste_text_sticky:true,
            paste_text_sticky_default:true,

        });

        $('#tinymce-container pre').click(function() {
            var str = $(this).html().trim();
            tinymce.activeEditor.insertContent(str);
         
        });
    });


});
