$(document).on ('ready page:load page:reload', function() {
    var blockIdToken = '#block_id_token';
    if ($(blockIdToken).length) {
        var blockId = $(blockIdToken).attr('blockId');
        var blockDiv = '#selectedDiv';
        var blockUl = '#selected';
        var UrlBlockPartsSort = "/lawsuit_blocks/block_parts_sort";
        var UrlBlockPartsLoad = "/lawsuit_blocks/block_parts_load";
        
        loadBlockParts();

        function setBlockEvents() {
            var selected = $(blockDiv + ' li');
            //Set Drag on Each 'li' in the selected
            $.each(selected, function (idx, val) {
                $(this).on('dragstart', function (evt) {
                    evt.originalEvent.dataTransfer.setData('Text', evt.target.textContent);
                    evt.originalEvent.dataTransfer.setData('ID', evt.target.id);
                });
            });
        }
        //Set the Drop on the <div>
        $(blockDiv).on('drop', function (evt) {
            evt.preventDefault();
            var listItems = $(blockUl);
            var sourceId = evt.originalEvent.dataTransfer.getData('ID');
            var targetId = evt.target.id;
            if (targetId !== null && sourceId !== null && targetId != sourceId) {
                setWeight(blockId, sourceId, targetId);
                listItems.empty();
            }
        });

        //The dragover
        $(blockDiv).on('dragover', function (evt) {
            evt.preventDefault();
        });

        function loadBlockParts() {
            var items = '';
            var block = { block_id: blockId };
            $.ajax({
                type: 'POST',
                url: UrlBlockPartsSort,
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(block)
            }).done(function (resp) {
                if (resp.length > 0) {
                    $.each(resp, function (idx, el) {
                        items += '<li draggable="true" id=' + el.id + '><a draggable="false" href="/block_part/'+ el.id +'/edit">' + el.name + '</a></li>';
                    });
                    $(blockUl).html(items);
                    setBlockEvents();
                }
                else {
                    $(blockUl).html('<p class="lead"> Список пустий </p>');
                }
            }).error(function (err) {
                alert('Error! ' + err.status);
            });
        }

        function setWeight(blockId, sourceId, targetBlockId) {
            var values = { block_id:blockId, source_block_id: sourceId, target_block_id:targetBlockId };
            $.ajax({
                url: UrlBlockPartsLoad,
                type: 'POST',
                data: JSON.stringify(values),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8'
            }).error(function (err) {
                alert('Error! ' + err.status);
            }).done(function (resp) {
                loadBlockParts();
            });
        }
    }
});
