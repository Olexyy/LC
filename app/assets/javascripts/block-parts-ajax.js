$(document).on ('ready page:load page:reload', function() {
    var blockIdToken = '#block_id_token';
    if ($(blockIdToken).length) {
        var blockId = $(blockIdToken).attr('blockId');
        var blockDiv = '#listDiv';
        var blockUl = '#list';
        var textDiv = '.block-text';
        var ajaxUrl = "/block_part/ajax";
        
        AJAX.post ({ command: 'list', block_id: blockId }, ajaxUrl, replace);
        AJAX.post ({ command: 'text', block_id: blockId }, ajaxUrl, AJAX.replace);
        AJAX.set_draggable_events(blockUl);
        AJAX.set_droppable_event(blockDiv, blockId, set_weight);

        function replace (type, target, content) {
            AJAX.replace(type, target, content);
            AJAX.set_draggable_events(target);
        }
        function set_weight(blockId, sourceId, targetBlockId) {
            var values = { command: 'sort', block_id: blockId, source_part_id: sourceId, target_part_id: targetBlockId };
            AJAX.post(values, ajaxUrl, on_sort);
        }
        function on_sort (type, target, content){
            AJAX.post ({ command: 'list', block_id: blockId }, ajaxUrl, replace);
            AJAX.post ({ command: 'text', block_id: blockId }, ajaxUrl, AJAX.replace);
        }
    }
});
