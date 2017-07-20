
function node_create() {
    var ref = $('#tree').jstree(true),
        sel = ref.get_selected();
    if(!sel.length) { return false; }
    sel = sel[0];
    sel = ref.create_node(sel, {"type":"folder"});
    if(sel) {
        ref.edit(sel);
    }
};

function node_rename() {
    var ref = $('#tree').jstree(true),
        sel = ref.get_selected();
    if(!sel.length) { return false; }
    sel = sel[0];
    ref.edit(sel);
};

function node_delete() {
    var ref = $('#tree').jstree(true),
        sel = ref.get_selected();
    if(!sel.length) { return false; }
    ref.delete_node(sel);
};


function lazy_load() {
    var ref = $('#tree').jstree(true),
        sel = ref.get_selected();

    if(!sel.length) {return false;}
    sel = sel[0];

    ref.set_type(sel, "loading");
    setTimeout(function () {
        ref.set_type(sel, "folder");
        ref.open_node(sel);
    }, 2000);
}