<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Дерево чего-то там</title>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
      <script src="treeview.js"></script>
      <script src="https://use.fontawesome.com/7782d0eb6b.js"></script>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
  </head>
  <body>

  <button type="button" onclick="node_create();">Создать</button>
  <button type="button" onclick="node_rename();">Изменить</button>
  <button type="button" onclick="node_delete();">Удалить</button>
  <button type="button" onclick="lazy_load();">Ленивая загрузка</button>


  <div id="tree"></div>


  </body>
  <script>
      $('#tree').jstree({ 'core' : {
          "check_callback" : true,
          'data' : [
              <%=(String)request.getAttribute("data")%>
          ],
          'themes' : { 'stripes' : true }

      },"plugins" : [ "dnd", "types" ],
          "types" : {

              "folder" : {
                  "icon" : "fa fa-folder-o"
              },
              "default" : {
                  "icon" : "fa fa-folder-o"
              },
              "loading" : {
                  "icon" : "fa fa-spinner"
              },
              "sltd" : {
                  "icon" : "fa fa-folder"
              }

          }
      });

      var lastnode;

      $('#tree')
      // listen for event
          .on('select_node.jstree', function (e, data) {
              var i, j;
              for(i = 0, j = data.selected.length; i < j; i++) {

                  $('#tree').jstree('set_type', data.instance.get_node(data.selected[i]), 'sltd');


                  if(lastnode != data.instance.get_node(data.selected[i])){
                      $('#tree').jstree('set_type', lastnode, 'folder');
                  }

                  lastnode = data.instance.get_node(data.selected[i]);
              }

          })
          .on('deselect_node.jstree', function (e, data) {

              console.log(lastnode);
              $('#tree').jstree('set_type', lastnode, 'folder');


          })
          // create the instance
          .jstree();

  </script>
</html>
