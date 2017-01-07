$(document).on ('ready page:load', function() {
    var lawsuitIdToken = '#lawsuit_id_token';
    if ($(lawsuitIdToken).length) {
        var lawsuitId = $(lawsuitIdToken).attr('lawsuitId');
        var listDivId = '#listDiv';
        var selectedDivId = '#selectedDiv';
        var collapsibleClass = '.collapsible2';
        var selectedId = '#selected';
        var ajaxUrl = '/lawsuit_blocks/ajax';

        setCollapsibleEvents();
        AJAX.post ({ command: 'list', lawsuit_id: lawsuitId }, ajaxUrl, replace);
        AJAX.post ({ command: 'text', lawsuit_id: lawsuitId }, ajaxUrl, AJAX.replace);

        function replace (type, target, content) {
            AJAX.replace(type, target, content);
            AJAX.set_draggable_events(target);
        }
        //Function to set events for Drag-Drop for li items of selected lists
        function setCollapsibleEvents() {
            var lists = $(collapsibleClass);
            //Set Drag on Each 'li' in the list
            lists.each(function (index, element) {
                var list = $(element).find('li');
                $.each(list, function (idx, val) {
                    $(this).on('dragstart', function (evt) {
                        evt.originalEvent.dataTransfer.setData('Text', evt.target.textContent);
                        evt.originalEvent.dataTransfer.setData('ID', evt.target.id);
                        evt.originalEvent.dataTransfer.setData('Location', 'list');
                    });
                });
            });
        }

        //Set the Drop on the <div>
        $(selectedDivId).on('drop', function (evt) {
            evt.preventDefault();
            var listItems = $(selectedId);
            var location = evt.originalEvent.dataTransfer.getData("Location");
            if (location == "list") {
                var id = evt.originalEvent.dataTransfer.getData("ID");
                if (listItems.find('#' + id).length === 0) {
                    action('add', lawsuitId, id, 0);
                    listItems.empty();
                }
            }
            else {
                var sourceId = evt.originalEvent.dataTransfer.getData("ID");
                var targetId = evt.target.id;
                if (targetId !== null && sourceId !== null && targetId != sourceId) {
                    action('move', lawsuitId, sourceId, targetId); // using not by name
                    listItems.empty();
                }
            }
        });
        $(listDivId).on('drop', function (evt) {
            evt.preventDefault();
            var location = evt.originalEvent.dataTransfer.getData("Location");
            if (location == "selected") {
                var id = evt.originalEvent.dataTransfer.getData("ID", evt.target.id);
                var listItems = $(selectedId);
                action('remove', lawsuitId, id, 0);
                listItems.empty();
            }
        });
        //The dragover
        $(selectedDivId).on('dragover', function (evt) {
            evt.preventDefault();
        });
        //The dragover
        $(listDivId).on('dragover', function (evt) {
            evt.preventDefault();
        });
        //The dragover
        $('.toggle').each(function (id, el) {
            $(el).on('dragover', function (evt) {
                evt.preventDefault();
            });
        });

        function action(type, lawsuitId, blockId, targetBlockId) {
            var values = { command:type, lawsuit_id:lawsuitId, block_id:blockId, target_block_id:targetBlockId };
            $.ajax({
                url: ajaxUrl,
                type: 'POST',
                data: JSON.stringify(values),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8'
            }).error(function (err) {
                alert('Error! ' + err.status);
            }).done(function (resp) {
                AJAX.post ({ command: 'list', lawsuit_id: lawsuitId }, ajaxUrl, replace);
                AJAX.post ({ command: 'text', lawsuit_id: lawsuitId }, ajaxUrl, AJAX.replace);
            });
        }
    }
});
