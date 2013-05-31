define(['bootstrap-wysihtml5'], function() {
    $(function() {
        if(g_plaintext_mode) {
            $('#some-textarea').wysihtml5({
                    "font-styles": true, //Font styling, e.g. h1, h2, etc. Default true
                    "emphasis": true, //Italics, bold, etc. Default true
                    "lists": true, //(Un)ordered lists, e.g. Bullets, Numbers. Default true
                    "html": true, //Button which allows you to edit the generated HTML. Default false
                    "link": false, //Button to insert a link. Default true
                    "image": false, //Button to insert an image. Default true,
                    "color": true, //Button to change color of font  
                    parserRules:{
                        classes:{},
                        tags:{}
                    }
            });
        } else {
            $('#some-textarea').wysihtml5({
                    "font-styles": true, //Font styling, e.g. h1, h2, etc. Default true
                    "emphasis": true, //Italics, bold, etc. Default true
                    "lists": true, //(Un)ordered lists, e.g. Bullets, Numbers. Default true
                    "html": true, //Button which allows you to edit the generated HTML. Default false
                    "link": false, //Button to insert a link. Default true
                    "image": false, //Button to insert an image. Default true,
                    "color": true //Button to change color of font  
            });

        }

        $('#wysihtml5-insert-container pre').click(function() {
            var str = $(this).html().trim();
            g_wysiEditor.editor.currentView.commands.exec('insertHTML', str);
        });

        $('#wysi-insert').click(function() {
            g_wysiEditor.editor.currentView.commands.exec('insertHTML', '<h1>hello</h1>');
        });

    }); 
});
