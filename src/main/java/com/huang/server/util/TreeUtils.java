package com.huang.server.util;


import java.util.ArrayList;
import java.util.List;

/**
 * Created by HUANG at 2019/9/8
 */
public class TreeUtils {

    public static List<TreeNode> getTree(List<TreeNode> list) {//调用方法的入口

        if (list == null)return new ArrayList<TreeNode>(0);

        List<TreeNode> result = new ArrayList<TreeNode>(list.size());

        for (int i = 0; i < list.size(); i++) {//添加一级结构
            if (list.get(i).getParentId() == null) {
                result.add(list.get(i));
                list.set(i, null);
            }
        }

        for (TreeNode treeNode : result) {//构造下级结构
            treeNode = TreeUtils.recurisve(treeNode, list);
        }

        return result;
    }

    public static TreeNode recurisve(TreeNode treeNode, List<TreeNode> list) {
        if (list == null)return treeNode;
        for (int i = 0; i < list.size(); i++) {
            TreeNode node = list.get(i);
            if (node != null && node != treeNode && treeNode.getId().equals(node.getParentId())) {
                node = recurisve(node, list);
                if (treeNode.getChildren() == null) {
                    treeNode.setChildren(new ArrayList<TreeNode>());
                }
                treeNode.getChildren().add(node);
            }
        }
        return treeNode;
    }


    public static List<TreeNode> getList(){
        TreeNode treeNode = new TreeNode();
        treeNode.setId("1");
        treeNode.setParentId(null);
        treeNode.setLabel("一级机构1");

        TreeNode treeNode1 = new TreeNode();
        treeNode1.setId("2");
        treeNode1.setParentId(null);
        treeNode1.setLabel("一级机构2");

        TreeNode treeNode2 = new TreeNode();
        treeNode2.setId("3");
        treeNode2.setParentId("1");
        treeNode2.setLabel("二级机构1");


        TreeNode treeNode3 = new TreeNode();
        treeNode3.setId("4");
        treeNode3.setParentId("1");
        treeNode3.setLabel("二级机构2");

        TreeNode treeNode4 = new TreeNode();
        treeNode4.setId("5");
        treeNode4.setParentId("3");
        treeNode4.setLabel("三级机构1");

        List<TreeNode> list = new ArrayList<TreeNode>();
        list.add(treeNode);
        list.add(treeNode1);
        list.add(treeNode2);
        list.add(treeNode3);
        list.add(treeNode4);
        List<TreeNode> treeNodeList = getTree(list);
        return treeNodeList;
    }
}

class TreeNode{
    private String id;
    private String parentId;
    private String label;
    private List<TreeNode> children;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public List<TreeNode> getChildren() {
        return children;
    }

    public void setChildren(List<TreeNode> children) {
        this.children = children;
    }
}

