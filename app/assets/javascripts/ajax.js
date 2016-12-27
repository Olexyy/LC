var AJAX = {
    command: function (type, target, content) {
        var element = $(target);
        if (type == 'replace_draggable') {
            element.empty();
            element.html(content);
            AJAX.set_draggable_events(target)
        }
        if (type == 'sorted') {
            element.empty();
            element.html(content);
            AJAX.set_draggable_events(target)
        }
    },
    set_draggable_events: function (target) {
        var selected = $(target + ' li');
        //Set Drag on Each 'li' in the selected
        $.each(selected, function (idx, val) {
            $(this).on('dragstart', function (evt) {
                evt.originalEvent.dataTransfer.setData('ID', evt.target.id);
            });
        });
    },
    set_droppable_event: function (target, blockId, handler) {
        //Set the Drop on the <div>
        $(target).on('drop', function (evt) {
            evt.preventDefault();
            var sourceId = evt.originalEvent.dataTransfer.getData('ID');
            var targetId = evt.target.id;
            if (targetId !== '' && sourceId !== '' && targetId != sourceId) {
                handler(blockId, sourceId, targetId);
            }
        });
        //The dragover
        $(target).on('dragover', function (evt) {
            evt.preventDefault();
        });
    },
    post: function(data, path, handler) {
        $.ajax({
            type: 'POST',
            url: path,
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(data)
        }).done(function (resp) {
            if(handler)
                handler(resp['command'], resp['target'], resp['content']);
            else
                AJAX.command(resp['command'], resp['target'], resp['content']);
        }).error(function (err) {
            alert('Error! ' + err.status);
        });
    }
};
