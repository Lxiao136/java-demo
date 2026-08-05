package com.javademo.collection;

import java.util.Objects;

/**
 * @Create 2026/8/4 18:59
 */
public class Person {
    String name;
    int age;

    public Person(){

    }
    public Person(String name , int age){
        this.age = age;
        this.name = name;
    }


    //不重写 toString()的话，输出该类对象时，输出的是地址值
    @Override
    public String toString() {
        return "Person{" + name +"," + age +"}";
    }


    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        Person person = (Person) o;
        return age == person.age && Objects.equals(name, person.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, age);
    }



}
