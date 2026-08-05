package com.javademo.collection;

/**
 * @Create 2026/8/5 17:23
 */
public class User implements Comparable{

    private int age;
    private String name;

    public User() {
    }

    public User(String name , int age) {
        this.age = age;
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public String getName() {
        return name;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "User{" +
                "age=" + age +
                ", name='" + name + '\'' +
                '}';
    }


    //按年龄从小到大排序
/*
    @Override
    public int compareTo(Object o) {
        if( this == o){
            return 0;
        }
        if(o instanceof User){
            User u = (User) o;
            return this.age - u.age;
        }
        throw new RuntimeException("类型不匹配");
    }
*/

    //先按年龄从小到大，如果年龄相同则按名字从大到小
    @Override
    public int compareTo(Object o) {
        if( this == o){
            return 0;
        }
        if(o instanceof User){
            User u = (User) o;
            int value =  this.age - u.age;
            if(value != 0){
                return value;
            }
            return -(this.name.compareTo(u.name));
        }
        throw new RuntimeException("类型不匹配");
    }

}
