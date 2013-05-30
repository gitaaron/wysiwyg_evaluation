define(['tinymce_jquery'], function() {
    $(function() {
        $('.tinyMCE-test').tinymce({
            script_url:'lib/tinymce/tinymce.js',
            selector: "textarea",
            plugins: ["textcolor code"],	
            toolbar: "fontsizeselect | forecolor | bold italic underline | alignleft aligncenter alignright",
            width: 600,
        });

        $('#tinymce-container pre').click(function() {
            var str = $(this).html().trim();
            tinymce.activeEditor.insertContent(str);
         
        });
    });


});
