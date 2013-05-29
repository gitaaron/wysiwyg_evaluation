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
        'jquery-ui':'../lib/jquery-ui-1.7.2.custom.min'
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
        }

    }
});

require(['my-bootstrap-wysihtml5', 'my-tinymce', 'my-ckeditor', 'my-jhtmlarea'], function() {
    console.log('required');
});
