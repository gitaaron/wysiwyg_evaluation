define(['tinymce_jquery'], function() {
    $('.tinyMCE-test').tinymce({
        script_url:'lib/tinymce/tinymce.js',
        selector: "textarea",
        plugins: ["textcolor code"],	
        toolbar: "fontsizeselect | forecolor | bold italic underline | alignleft aligncenter alignright",
        width: 600,
    });

});
