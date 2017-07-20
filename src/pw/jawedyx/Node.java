package pw.jawedyx;

import java.util.ArrayList;

public class Node {

    private String id;
    private String parent;
    private String text;


    Node(String id, String parent, String text){
        this.id = id;
        this.parent = parent;
        this.text = text;

    }

    static String parseData(ArrayList<Node> nodes){
        StringBuilder data = new StringBuilder();

        for (Node node : nodes) {
            data.append("{ 'id' : '" + node.id + "', 'parent' : '" + node.parent + "', 'text' : '" +node.text +"', 'icon' : 'fa fa-folder-o' },");
        }

        return data.toString();
    }

}
