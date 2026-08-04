package com.javademo.collection;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

/**
 * @Create 2026/8/4 18:03
 *
 *
 *          增：
 *              add(Object obj)
 *               addAll(Collection coll)
 *
 *           删
 *               remove(Object obj)
 *               remove(int index)
 *
 *           改
 *               set(int index , Object ele)
 *
 *           查
 *              get(int index)
 *
 *           遍历
 *               iterator
 *               增强for循环
 *               一般for循环
 *
 *          插入
 *              add(int index , Object els)
 *              addAll(int index , Collection eles)
 *
 *          长度
 *              size()
 *
 *
 */
public class ArrayListDemo {

    public static void main(String[] args) {

        List list = new ArrayList();

        //数组转换成集合
        //list1 不能做 add 、 remove 操作
        List list1 = Arrays.asList(1 , 2 , 3);

    //增
        list.add("AA");
        list.add("BB");
        list.add(789);
        list.add(new Person("Tom" ,  12));

        //addAll 和 add的区别
        list.add(list1);//把 list1整体当成一个元素
        list.addAll(list1);
        System.out.println(list);

    //删
        list.remove("BB");
        list.remove(1);//删除下标1位置的值
        list.remove(Integer.valueOf(1));//删除值为 1的对象
        System.out.println(list);

    //改
        list.set(3 , 888);
        System.out.println(list);

    //查
        System.out.println(list.get(4));

    //插
        list.add(3 , 40);
        list.addAll(4 , list1);
        System.out.println(list);

    //三种遍历
        System.out.println("");
        System.out.println("迭代器");
        //迭代器
        Iterator iterator = list.iterator();
        while(iterator.hasNext()){
            System.out.println(iterator.next());
        }
        System.out.println();

        System.out.println("增强for循环");
        //增强for循环
        for(Object obj : list){
            System.out.println(obj);
        }
        System.out.println();

        System.out.println("普通for循环");
        //普通for循环
        for (int i = 0; i < list.size() ; i++) {
            System.out.println(list.get(i));
        }

    }
}

