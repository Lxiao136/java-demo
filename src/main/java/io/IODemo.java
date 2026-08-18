package io;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

/**
 * @Create 2026/8/18 15:45
 *
 *
 * 目的：创建 “hello.txt"文件的副本 "hello_copy.txt"
 *
 * 读操作对应的文件必须存在，写操作对应的文件可以不存在
 */
public class IODemo {
    public static void main(String[] args) {
        FileReader fr = null;
        FileWriter fw = null;

        try {
            //创建文件对象
            File file = new File("src/main/java/io/hello.txt");
            File fileCopy = new File("src/main/java/io/hello_copy.txt");

            //创建流
            fr = new FileReader(file);
            fw = new FileWriter(fileCopy);//文件覆盖
            //fw = new FileWrite(fileCopy , true);  这是文件续写，靠构造器实现

            //数据操作
            char[] cbuffer = new char[5];//一次性多读数据
            int len;//记录每次读取到cbuffer中的字符个数
            while((len = fr.read(cbuffer)) != -1){
                fw.write(cbuffer , 0 ,len);
            }

            System.out.println("复制成功");

        } catch (IOException e) {
            e.printStackTrace();
        } finally {

            //关闭流
            try {
                fw.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                fr.close();
            } catch (IOException e) {
                e.printStackTrace();
            }

        }

    }
}
