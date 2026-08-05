package com.javademo.collection;

import java.util.*;

/**
 * @Create 2026/8/5 18:44
 */
public class SetDemo {
    public static void main(String[] args) {

        //HashSet()
        Set hashSet  = new HashSet();

        hashSet.add("AA");
        hashSet.add("BB");
        hashSet.add(123);
        hashSet.add(new Person("Jarry" , 18));

        Iterator hsiterator = hashSet.iterator();
        while(hsiterator.hasNext()){
            System.out.println(hsiterator.next());
            //输出与存放顺序不一致，但这并不是无序性
        }

        System.out.println(hashSet.contains(new Person("Jarry", 18)));
        System.out.println();


        //LinkHashSet()
        Set linkedHashSet  = new LinkedHashSet();

        linkedHashSet.add("AA");
        linkedHashSet.add("BB");
        linkedHashSet.add(123);
        linkedHashSet.add(new Person("Jarry" , 18));

        Iterator lkhiterator = linkedHashSet.iterator();
        while(lkhiterator.hasNext()){
            System.out.println(lkhiterator.next());
            //输出与存放顺序一致，因为底层有双向指针
        }
        System.out.println();


        //TreeSet
        Set treeSet = new TreeSet();

        treeSet.add("AA");
        treeSet.add("BB");
        treeSet.add("DD");
        treeSet.add("MM");
        treeSet.add("SS");
        //set.add(123);要保持类型一致否则报 java.lang.ClassCastException 异常

        Iterator tsiterator = treeSet.iterator();
        while(tsiterator.hasNext()){
            System.out.println(tsiterator.next());
        }
        System.out.println();


        //TreeSet 的 自然排序
        //TreeSet 底层实现是红黑树
        //所以User需要实现 Comparable 接口，重写 compareTo 方法 、
        //否则报异常
        //java.lang.ClassCastException: class set.User cannot be cast to class java.lang.Comparable

        Set treeSet1 = new TreeSet();
        User u1 = new User("Tom" , 13);
        User u2 = new User("Jack" , 23);
        User u3 = new User("Marry" , 33);
        User u4 = new User("Frank" , 43);
        User u5 = new User("Trump" , 23);

        treeSet1.add(u1);
        treeSet1.add(u2);
        treeSet1.add(u3);
        treeSet1.add(u4);
        treeSet1.add(u5);

        Iterator iterator = treeSet1.iterator();

        System.out.println("自然排序");
        while(iterator.hasNext()){
            System.out.println(iterator.next());
        }
        System.out.println();


        //TreeSet 的 定制排序

        //姓名从小到大，若相等则年龄从大到小
        Comparator  comparable = new Comparator() {
            @Override
            public int compare(Object o1, Object o2) {
                if(o1 instanceof User && o2 instanceof User){
                    User u1 = (User) o1;
                    User u2 = (User) o2;
                    int value = u1.getName().compareTo(u2.getName());
                    if(value != 0){
                        return value;
                    }
                    return -(u1.getAge() - u2.getAge());

                }
                throw new RuntimeException("类型不符");
            }
        };

        Set treeSet2 = new TreeSet(comparable);
        for(Object u : treeSet1){
            treeSet2.add(u);
        }

        System.out.println("定制排序");
        Iterator iterator1 = treeSet2.iterator();
        while(iterator1.hasNext()){
            System.out.println(iterator1.next());
        }

    }
}
