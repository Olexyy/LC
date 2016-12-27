$(document).on ('ready page:load page:reload', function() {
    var blockIdToken = '#block_id_token';
    if ($(blockIdToken).length) {
        var blockId = $(blockIdToken).attr('blockId');
        var blockDiv = '#listDiv';
        var blockUl = '#list';
        var textDiv = '.block-text';
        var UrlBlockPartsSort = "/lawsuit_blocks/block_parts_sort";
        var UrlBlockPartsLoad = "/lawsuit_blocks/block_parts_load";
        var UrlBlockPartsText = "/lawsuit_blocks/block_parts_text";
        
        AJAX.post ({ block_id: blockId }, UrlBlockPartsLoad, replace);
        AJAX.post ({ block_id: blockId }, UrlBlockPartsText, replace_text);
        AJAX.set_draggable_events(blockUl);
        AJAX.set_droppable_event(blockDiv, blockId, set_weight);

        function replace (type, target, content) {
            AJAX.replace(type, target, content);
            AJAX.set_draggable_events(target);
        }
        function replace_text (type, target, content) {
            AJAX.replace(type, target, content);
        }
        function set_weight(blockId, sourceId, targetBlockId) {
            var values = { block_id: blockId, source_part_id: sourceId, target_part_id: targetBlockId };
            AJAX.post(values, UrlBlockPartsSort, on_sort);
        }
        function on_sort (type, target, content){
            AJAX.post ({ block_id: blockId }, UrlBlockPartsLoad, replace);
            AJAX.post ({ block_id: blockId }, UrlBlockPartsText, replace_text);
        }
    }
});
