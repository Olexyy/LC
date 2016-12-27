$(document).on ('ready page:load page:reload', function() {
    var blockIdToken = '#block_id_token';
    if ($(blockIdToken).length) {
        var blockId = $(blockIdToken).attr('blockId');
        var blockDiv = '#listDiv';
        var blockUl = '#list';
        var UrlBlockPartsSort = "/lawsuit_blocks/block_parts_sort";
        var UrlBlockPartsLoad = "/lawsuit_blocks/block_parts_load";
        
        AJAX.post ({ block_id: blockId }, UrlBlockPartsLoad);
        AJAX.set_draggable_events(blockUl);
        AJAX.set_droppable_event(blockDiv, blockId, set_weight);

        function set_weight(blockId, sourceId, targetBlockId) {
            var values = { block_id: blockId, source_part_id: sourceId, target_part_id: targetBlockId };
            AJAX.post(values, UrlBlockPartsSort, sorted);
        }
        function sorted (target, content){
            AJAX.post ({ block_id: blockId }, UrlBlockPartsLoad);
        }
    }
});
