define(['jhtmlarea', 'jquery'], function() {
    $(function() {
        $("#jhtmlarea").htmlarea(); // Initialize jHtmlArea's with all default values

        $('#jhtmlarea-container pre').click(function() {
            var str = $(this).html().trim();
            $('#jhtmlarea').htmlarea('pasteHTML', str);
        }); 

    }); 



});
