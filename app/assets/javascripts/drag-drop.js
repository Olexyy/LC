$(document).on ('ready page:load', function() {
    if ($('#lawsuit_id_token').length) {
        var lawsuitId = $('#lawsuit_id_token').attr('lawsuitId');
        var listDivId = '#listDiv';
        var selectedDivId = '#selectedDiv';
        var collapsibleClass = '.collapsible2';
        var selectedId = '#selected';

        var UrlSelected = "/lawsuit_blocks/selected";
        var UrlAction = "/lawsuit_blocks/action";

        setCollapsibleEvents();
        loadSelected();
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

        function setSelectedEvents() {
            var selected = $(selectedDivId + ' li');
            //Set Drag on Each 'li' in the selected
            $.each(selected, function (idx, val) {
                $(this).on('dragstart', function (evt) {
                    evt.originalEvent.dataTransfer.setData('Text', evt.target.textContent);
                    evt.originalEvent.dataTransfer.setData('ID', evt.target.id);
                    evt.originalEvent.dataTransfer.setData('Location', 'selected');
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

        function loadSelected() {
            var items = '';
            var lawsuit = { lawsuit_id: lawsuitId };
            $.ajax({
                type: 'POST',
                url: UrlSelected,
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(lawsuit)
            }).done(function (resp) {
                if (resp.length > 0) {
                    $.each(resp, function (idx, el) {
                        var a = el;
                        items += '<li draggable="true" id=' + el.id + '>' + el.name + '</li>';
                    });
                    $(selectedId).html(items);
                    setSelectedEvents();
                }
                else {
                    $(selectedId).html('<p class="lead"> Список пустий </p>');
                }
            }).error(function (err) {
                alert('Error! ' + err.status);
            });
        }

        function action(type, lawsuitId, blockId, targetBlockId) {
            var values = { type:type, lawsuit_id:lawsuitId, block_id:blockId, target_block_id:targetBlockId };
            $.ajax({
                url: UrlAction,
                type: 'POST',
                data: JSON.stringify(values),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8'
            }).error(function (err) {
                alert('Error! ' + err.status);
            }).done(function (resp) {
                loadSelected();
            });
        }
    }
});
