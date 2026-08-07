package com.javademo.map;

import com.javademo.collection.Person;
import com.javademo.collection.User;

import java.util.*;

/**
 * @Create 2026/8/6 18:59
 *
 *
 *         HashMap中的key是无序的，不重复的，构成了一个 Set 集 ，所以key 所在类需要重写 hashCode()和equals()
 *         HashMap中的value是无序的，可重复的，构成了一个 Collection集 ，所以value所在类需要重写 equals()
 *         HashMap中的key-value 构成了一个Entry集
 *             Entry是无序的，不可重复的，构成了一个Set集
 *
 *         （前面是返回值）
 *     增加、修改：
 *         Object put(Object key , Object value):将指定key-value添加到（修改）当前map对象中
 *                 （用于修改则返回原先的value值，用于增加则返回 null）
 *         Object putAll(Map m):将m中的所有key-value对存放在当前map中
 *
 *     删除:
 *         Object remove(Object key):移除指定key对应的key-value对，并返回value
 *         void clear():清空当前map中的所有数据
 *
 *     查询:
 *         Object get(Object key):获取指定key对应的value
 *         boolean containsKey(Object key):是否包含指定的key
 *         boolean containsValue(Object value):是否包含指定的value
 *         int size():返回map中 key-value对个数
 *         boolean isEmpty():判断当前map是否为空
 *         boolean equals(Object obj)：判断当前map和参数对象obj是否相等
 *
 *     遍历:
 *         遍历key集 ：Set keySet():返回所有key构成的Set集合
 *         遍历value集 ：Collection values():返回所有 value 构成的Collection集合
 *         遍历entry集 ：Set entrySet():返回所有 key-value 构成的Set集合
 *
 */
public class MapDemo {
    public static void main(String[] args) {

        //HashMap
        Map map = new HashMap();
        Map mapCopy = new HashMap();

        System.out.println("以下是增加操作");
        // put 当增加
        map.put("AA" , 18);
        map.put("BB" , 19);
        map.put("EE" , 28);
        map.put(38 , "DD");
        map.put(new Person("Tom" , 15), 18);
        mapCopy.putAll(map);

        System.out.println(map);
        System.out.println(mapCopy);

        System.out.println("以下是修改操作");
        // put 当修改返回修改前的值
        Object revalue = map.put("AA" , 20);
        System.out.println(revalue);
        System.out.println(map);
        System.out.println(mapCopy);//改了 map ，mapCopy 不会跟着变

        System.out.println("以下是删除操作");
        //找到 key 并删除 key-value对
        //如果是自定义类需要重写 hashCode()
        Object devalue = map.remove("AA");
        System.out.println(devalue);
        System.out.println(map);

        //clean():清空当前map中的所有数据
        mapCopy.clear();
        System.out.println(map.isEmpty());
        System.out.println(mapCopy);

        System.out.println("以下是查询操作");
        //查询
        Object value = map.get("EE");
        System.out.println(value);

        System.out.println(map.containsKey("XX"));
        System.out.println(map.containsValue(28));

        System.out.println(map.size());

        System.out.println(map.equals(mapCopy));

        System.out.println("以下是遍历操作");
        //遍历
        Set keySet = map.keySet();
        Iterator iterator = keySet.iterator();
        while(iterator.hasNext()){
            System.out.println(iterator.next());
        }

        System.out.println();
        Collection collection = map.values();
        for(Object obj : collection){
            System.out.println(obj);
        }

        System.out.println();
        Set entrySet = map.entrySet();
        Iterator iterator1 = entrySet.iterator();
        while(iterator1.hasNext()){
            //System.out.println(iterator1.next());
            Map.Entry entry = (Map.Entry)iterator1.next();
            System.out.println(entry.getKey() + "---->" + entry.getValue());
        }


        System.out.println();

        //TreeMap：两种排序和 TreeSet 相同

        //定制排序
        Comparator comparator = new Comparator() {
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

        Map treeMap = new TreeMap(comparator);

        User u1 = new User("Tom" , 13);
        User u2 = new User("Jack" , 23);
        User u3 = new User("Marry" , 33);
        User u4 = new User("Frank" , 43);
        User u5 = new User("Trump" , 23);

        treeMap.put(u1 , 28);
        treeMap.put(u2 , 18);
        treeMap.put(u3 , 48);
        treeMap.put(u4 , 38);
        treeMap.put(u5 , "MAGA");

        Set entry = treeMap.entrySet();
        for(Object e : entry){
            System.out.println(e);
        }

    }

}
