define(['exports', 'bootstrap-wysihtml5'], function(exports) {
    exports.initialize = function() {
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
		var myCustomTemplate = {
			'font-styles' : function(locale) {
                                 
			return "<li class = dropdown>" +
					"<a class='btn dropdown-toggle' data-toggle='dropdown'>"+
						"<span class='current-size'>Font Size</span>" +
						"<b class='caret'></b>"+
					"</a>"+
					"<ul class='dropdown-menu'>"+
						"<li>"+
                        				"<a class='wysihtml5-font-size' data-wysihtml5-command='fontSize' data-wysihtml5-command-value='large' title='font-size'>Large</a>" +
						"</li>"+
						"<li>"+ 
							"<a class='wysihtml5-font-size' data-wysihtml5-command='fontSize' data-wysihtml5-command-value='medium' title='font-size'>Medium</a>"+
						"</li>"+
						"<li>"+ 
							"<a class='wysihtml5-font-size' data-wysihtml5-command='fontSize' data-wysihtml5-command-value='small' title='font-size'>Small</a>"+
						"</li>"+
						
					"</ul>"+
                        "</li>";      	        
			 }
 		}

                $('#some-textarea').wysihtml5({
                        "font-styles": true, //Font styling, e.g. h1, h2, etc. Default true
                        "emphasis": true, //Italics, bold, etc. Default true
                        "lists": true, //(Un)ordered lists, e.g. Bullets, Numbers. Default true
                        "html": true, //Button which allows you to edit the generated HTML. Default false
                        "link": false, //Button to insert a link. Default true
                        "image": false, //Button to insert an image. Default true,
                        "color": true, //Button to change color of font, 
			customTemplates: myCustomTemplate,
			parserRules: {
				classes: {
					"wysiwyg-font-size-large":1,
					"wysiwyg-font-size-medium":1,
					"wysiwyg-font-size-small":1,
					"wysiwyg-color-silver" : 1,
                			"wysiwyg-color-gray" : 1,
                			"wysiwyg-color-white" : 1,
               	 			"wysiwyg-color-maroon" : 1,
					"wysiwyg-color-red" : 1,
					"wysiwyg-color-purple" : 1,
					"wysiwyg-color-fuchsia" : 1,
					"wysiwyg-color-green" : 1,
					"wysiwyg-color-lime" : 1,
					"wysiwyg-color-olive" : 1,
					"wysiwyg-color-yellow" : 1,
					"wysiwyg-color-navy" : 1,
					"wysiwyg-color-blue" : 1,
					"wysiwyg-color-teal" : 1,
					"wysiwyg-color-aqua" : 1,
					"wysiwyg-color-orange" : 1
				},
			
				tags :{
					"span":1
				}
			} 
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
    }
});
