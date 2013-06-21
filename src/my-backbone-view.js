define(['backbone', 'underscore', 'text!./main.tpl.html','my-bootstrap-wysihtml5', 'my-tinymce', 'my-ckeditor', 'my-jhtmlarea'], function(Backbone, _, MyTemplate,my_bootstrap_wysihtml5, my_tinymce, my_ckeditor, my_jhtmlarea) {


    MyTemplate = _.template(MyTemplate);

    var MyBackboneView = Backbone.View.extend({
        render:function() {
            this.$el.html(MyTemplate());
            return this;
        },
        initializeTextEditors: function() {
            my_bootstrap_wysihtml5.initialize();
            my_tinymce.initialize();
            my_ckeditor.initialize();
            my_jhtmlarea.initialize();
        }

    });

    return MyBackboneView;

});
