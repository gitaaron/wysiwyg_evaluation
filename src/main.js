require.config({
    paths:{
        'jquery':'../lib/jquery-1.7.2.min',
        'wysihtml5':'../lib/wysihtml5-0.3.0',
        'prettify':'../lib/prettify',
        'bootstrap':'../lib/bootstrap',
        'bootstrap-wysihtml5':'../lib/bootstrap-wysihtml5'
    },

    shim: {
        'bootstrap-wysihtml5': {
            deps:['jquery', 'wysihtml5', 'prettify', 'bootstrap']
        },
        'wysihtml5':{
            deps:['jquery', 'prettify']
        }

    }
});

require(['my-bootstrap-wysihtml5'], function() {
    console.log('required');
});
