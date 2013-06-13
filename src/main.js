
require.config({
    paths:{
        'jquery':'../lib/jquery-1.7.2.min',
        'tinymce_jquery':'../lib/tinymce/jquery.tinymce.min',
        'wysihtml5':'../lib/wysihtml5-0.3.0',
        'prettify':'../lib/prettify',
        'bootstrap':'../lib/bootstrap',
        'bootstrap-wysihtml5':'../lib/bootstrap-wysihtml5',
        'tinymce':'../lib/tinymce',
        'ckeditor':'../lib/ckeditor/ckeditor',
        'jhtmlarea':'../lib/jhtmlarea/jHtmlArea-0.7.5',
        'jquery-ui':'../lib/jquery-ui-1.7.2.custom.min',
        'backbone':'../lib/misc/backbone',
        'underscore':'../lib/misc/underscore',
        'underscore.string':'../lib/misc/underscore.string.min',
        'text':'../lib/misc/text'
    },

    shim: {
        'bootstrap-wysihtml5': {
            deps:['jquery', 'wysihtml5', 'prettify', 'bootstrap']
        },
        'wysihtml5':{
            deps:['jquery', 'prettify']
        },
        'tinymce_jquery':{
            deps:['jquery']
        },
        'jhtmlarea':{
            deps:['jquery-ui']
        },
        'underscore':{
            exports:'_',
            deps:['underscore.string']
        },
        'backbone':{
            exports:'Backbone',
            deps:['underscore','jquery']
        }

    }
});

var g_plaintext_mode = getQueryVariable('plain_mode') === '1';

require(['backbone', 'underscore', 'my-backbone-view'], function(Backbone, _, MyBackboneView) {


    myBackboneView = new MyBackboneView().render();

    $('#test').html(myBackboneView.$el);
    myBackboneView.initializeTextEditors();

    if(g_plaintext_mode) {
        $('#plain_mode_item').addClass('active');
    } else {
        $('#html_mode_item').addClass('active');
    }


});

function getQueryVariable(variable) {
    var query = window.location.search.substring(1);
    var vars = query.split("&");

    for (var i = 0; i < vars.length; i++) {
        var pair = vars[i].split("=");
        if (pair[0] == variable) {
            return pair[1];
        }
    }

    return false;
}
